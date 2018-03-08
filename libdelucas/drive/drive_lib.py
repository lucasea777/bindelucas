# https://github.com/requests/requests-oauthlib/blob/master/docs/examples/real_world_example_with_refresh.rst
# https://requests-oauthlib.readthedocs.io/en/latest/examples/google.html
mywellcome = b"""
HTTP/1.1 200 OK
Content-Length: 53
Content-Type: text/html
Connection: Closed

<html>
<body>
<h1>Hello, World!</h1>
</body>
</html>


"""

def get_response_url():
    import socket
    s = socket.socket()
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    s.bind(("localhost", 5000))
    s.listen()
    conn, addr = s.accept()
    #print('Connected by', addr)
    total = b''
    while b'\r\n\r\n' not in total and b'\n\n' not in total:
        data = conn.recv(1024)
        if not data: break
        total += data
    #print(total.decode())
    #import IPython; IPython.embed()
    conn.send(mywellcome)
    conn.close()
    return total.split(b' ', 2)[1].decode()

import json
from pprint import pformat
from time import time

import requests
from requests_oauthlib import OAuth2Session
import os
os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'

# This information is obtained upon registration of a new Google OAuth
# application at https://code.google.com/apis/console
with open(os.path.expanduser("~/binprivate/db/google_client_secret.json"), 'r') as infile:
    obj = json.load(infile)['installed']
    client_id = obj['client_id']
    client_secret = obj['client_secret']
    
redirect_uri = 'http://127.0.0.1:5000/callback'
#authorization_base_url = "https://accounts.google.com/o/oauth2/v2/auth"
#token_url = 'https://www.googleapis.com/oauth2/v4/token'

# Uncomment for detailed oauthlib logs
#import logging
#import sys
#log = logging.getLogger('oauthlib')
#log.addHandler(logging.StreamHandler(sys.stdout))
#log.setLevel(logging.DEBUG)

# OAuth endpoints given in the Google API documentation
authorization_base_url = "https://accounts.google.com/o/oauth2/auth"
token_url = "https://accounts.google.com/o/oauth2/token"
refresh_url = token_url # True for Google but not all providers.
scope = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/userinfo.profile",
    'https://www.googleapis.com/auth/drive.metadata.readonly',
]

class OA():
    def __init__(self, credentials_path=None):
        #self.openbrowser = None
        self.credentials_path = credentials_path
        self.authorization_url = None
        self.state = None
        self.token = None

    def save(self, path):
        with open(path, 'w+') as outfile:
            json.dump({"state": self.state, "token":self.token}, outfile)

    def load(self, path):
        with open(path, 'r') as infile:
            obj = json.load(infile)
            self.state = obj['state']
            self.token = obj['token']

    def ask(self):
        """Step 1: User Authorization.

        Redirect the user/resource owner to the OAuth provider (i.e. Google)
        using an URL with a few key OAuth parameters.
        """
        google = OAuth2Session(client_id, scope=scope, redirect_uri=redirect_uri)
        self.authorization_url, self.state = google.authorization_url(authorization_base_url,
            # offline for refresh token
            # force to always make user click authorize
            access_type="offline", prompt="select_account")

        # State is used to prevent CSRF, keep this for later.
        #print(self.authorization_url)
        return self.authorization_url


    def wait_callback(self):
        google = OAuth2Session(client_id, redirect_uri=redirect_uri,
                               state=self.state)
        authorization_response = get_response_url()
        self.token = google.fetch_token(token_url, client_secret=client_secret,
                                   authorization_response=authorization_response)
        #print("ready to play")

    def play(self):
        google = OAuth2Session(client_id, token=self.token)
        return (google.get('https://www.googleapis.com/oauth2/v1/userinfo').json())

    def automatic_refresh(self):
        """Refreshing an OAuth 2 token using a refresh token.
        """

        # We force an expiration by setting expired at in the past.
        # This will trigger an automatic refresh next time we interact with
        # Googles API.
        self.token['expires_at'] = time() - 10

        extra = {
            'client_id': client_id,
            'client_secret': client_secret,
        }

        def token_updater(token):
            self.token = token

        google = OAuth2Session(client_id,
                               token=self.token,
                               auto_refresh_kwargs=extra,
                               auto_refresh_url=refresh_url,
                               token_updater=token_updater)

        # Trigger the automatic refresh
        return google.get('https://www.googleapis.com/oauth2/v1/userinfo').json()


    def manual_refresh(self):
        """Refreshing an OAuth 2 token using a refresh token.
        """

        extra = {
            'client_id': client_id,
            'client_secret': client_secret,
        }

        google = OAuth2Session(client_id, token=self.token)
        self.token = google.refresh_token(refresh_url, **extra)
        return self.token

    def validate(self):
        """Validate a token with the OAuth provider Google.
        """

        # Defined at https://developers.google.com/accounts/docs/OAuth2LoginV1#validatingtoken
        validate_url = ('https://www.googleapis.com/oauth2/v1/tokeninfo?'
                        'access_token=%s' % self.token['access_token'])

        # No OAuth2Session is needed, just a plain GET request
        return requests.get(validate_url).json()

    def get_auto(self):
        extra = {
            'client_id': client_id,
            'client_secret': client_secret,
        }

        def token_updater(token):
            self.token = token

        return OAuth2Session(client_id,
                               token=self.token,
                               auto_refresh_kwargs=extra,
                               auto_refresh_url=refresh_url,
                               token_updater=token_updater)

    def rmcredentials(self):
        os.remove(self.credentials_path)

    @staticmethod
    def filelistgenerator(params, google):
        assert("nextPageToken" in str(params))
        apiurl = 'https://www.googleapis.com/drive/v3/files'
        nextPageToken = True
        while nextPageToken:
            obj = google.get(apiurl, params=params).json()
            nextPageToken = obj.get('nextPageToken')
            params['pageToken'] = nextPageToken
            for e in obj['files']:
                yield e

    def flow(self, openbrowser):
        #self.__init__(self.credentialspath)
        if os.path.isfile(self.credentials_path):
            self.load(self.credentials_path)
        else:
            openbrowser(self.ask())
            self.wait_callback()
        self.save(self.credentials_path)
        return self.get_auto()
        #oa.play()
        #oa.ask()
        #oa.wait_callback()
        #oa.automatic_refresh()

if __name__ == "__main__":
    oa = OA()
    #oa.flow()
