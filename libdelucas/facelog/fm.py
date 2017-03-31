#!/usr/bin/python
# -*- coding: utf-8 -*-

#fm -f -fav yo -m "Buen dia" -e MAIL

#http://stackoverflow.com/questions/31309937/python-mechanize-log-into-facebook-cookie-error
#http://stackoverflow.com/questions/19181994/does-the-browser-instance-from-mechanize-cache
# DATA_DIR
#   data.txt = "[NAME\tUID\n]+"
#   img
#       UID.jpg (profile photos)
import cookielib
import urllib2
import mechanize
import getpass

import os
import sys
import login
import json

#from constants import *

FACE_ID = ""
MENSAJE = ""
ABRIRENFIREFOX = False
CHEQUEAR = True
FUNDADORES = False
DATA_DIR = os.path.expanduser("~/binprivate/db/facelog")
# el profile id se puede sacar de la url de la foto de perfil
# el profile id en la version mobil: alert(document.getElementsByName("id")[0].value)
with open(os.path.expanduser(os.path.join(DATA_DIR, "favs"))) as fd:
    FAV = json.loads(fd.read())

def getScriptPath():
    return os.path.dirname(os.path.realpath(sys.argv[0]))

PROGRAM_DIR = getScriptPath()

COOKIE_FILENAME = "" #default o dejar vacio para no permitir
                            #cargar una cookie anterior extraña

class Log:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def debug(filename):
    try:
        os.makedirs(os.path.join(PROGRAM_DIR, ".debug"))
    except OSError as e:
        if e.errno != os.errno.EEXIST:
            raise
    abs_file = os.path.join(PROGRAM_DIR, ".debug", filename)
    fileobj = open(abs_file, "w+")
    fileobj.write(response.read())
    fileobj.close()
    if ABRIRENFIREFOX:
        os.system("firefox -private-window " + abs_file)

def print_help():
    print "Usage: python message2.py [-uid <uid>|-fav] [-m <mensaje>] [-d] [-f] [-h|--help] [-c|-e]"
    print "    -d     abrir en firefox"
    print "    -f     no preguntar confirmacion"
    print "    -fav   (" + ','.join(FAV.keys()) + ')'
    print "    -fundadores  "
    print "    -c     nombre de archivo de cookie especial"
    print "    -e     mail sirve para el login y tambien se utilizara como nombre de cookie"
    print ""
    print "El selector de contactos se abre por default."

def fatal(txt):
    print Log.FAIL + txt + Log.ENDC
    sys.exit(1)

#if len(sys.argv) == 1:
#    print_help()
#    sys.exit()

def get_face_id():
    print "Seleccione el destinatario (podria haber usado -fav)"
    javaresult = os.popen("java -classpath \""+PROGRAM_DIR+"/contactListJava\" ContactList -dir \""+DATA_DIR+"\"").read().replace("\n","")
    if javaresult == "":
        fatal("java no retorno nada :/")
    print(javaresult)
    split = javaresult.split('\t')
    return (split[0], split[1])

for i,e in enumerate(sys.argv):
    if e == "-fundadores":
        FUNDADORES = True
    if e == "-uid":
        FACE_ID = sys.argv[i+1]
    if e == "-m":
        MENSAJE = sys.argv[i+1]
        print "MENSAJE: " + MENSAJE
    if e == "-d":
        ABRIRENFIREFOX = True
    if e == "-f":
        CHEQUEAR = False
    if e == "-c":
        COOKIE_FILENAME = sys.argv[i+1]
    if e == "-e":
        USER = sys.argv[i+1]
        COOKIE_FILENAME = USER
    if e == "-fav":
        try:
            FACE_ID = FAV[sys.argv[i+1]]
        except KeyError:
            fatal("No reconozco ese favorito.")
    if e == "-h" or e == "--help":
        print_help()
        sys.exit()

if FACE_ID == "" and not FUNDADORES:
    name_id = get_face_id()
    FACE_ID = name_id[1]
    print "Nombre destinatario: " + name_id[0]

assert(FACE_ID != "" or FUNDADORES)
print "FACE_ID: " + FACE_ID

if COOKIE_FILENAME == "":
    USER = raw_input("Mail con el que te pensas logear: ")
    COOKIE_FILENAME = USER

COOKIE_ABS_FILENAME = os.path.join(DATA_DIR, "cookies" , COOKIE_FILENAME)

if MENSAJE == "":
    MENSAJE = raw_input("Mensaje: ")

#ABRIRENFIREFOX = True;

if CHEQUEAR:
    if raw_input(Log.WARNING + "Seguro? (si/otracosa): " + Log.ENDC) != "si":
        sys.exit()

#================CORE=============

br = mechanize.Browser()
cookiejar = cookielib.LWPCookieJar()

#cargar cookiejar si el archivo cookiejar existe
if os.path.isfile(COOKIE_ABS_FILENAME):
    print "Loading cookies from file"
    cookiejar.load(filename=COOKIE_ABS_FILENAME, ignore_discard=False, ignore_expires=False)

br.set_cookiejar( cookiejar )
br.set_handle_equiv( True )
#br.set_handle_gzip( True )
br.set_handle_redirect( True )
br.set_handle_referer( True )
br.set_handle_robots( False )

br.set_handle_refresh( mechanize._http.HTTPRefreshProcessor(), max_time = 1)
br.addheaders = [ ( 'User-agent', 'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.1) Gecko/2008071615 Fedora/3.0.1-1.fc9 Firefox/3.0.1' ) ]

#url = "https://m.facebook.com/login.php"
url = "https://m.facebook.com/"

#Open URL and submit
try:
    response = br.open(url)
except Exception as e:
    raise e
    fatal("Parece que no estas conectado :/ (sino puede que la url este mal)")
#import pdb; pdb.set_trace()
#debug("step0.html")
if br.title() != "Facebook": #entonces no estas adentro papa
    if not USER:
        USER = raw_input("Sender Email: ")
    while login.login(br, USER, debug) == False:
        print "Mmm no habras puesto mal la pass??"
    #print br.title()
#response = br.open("https://m.facebook.com/phoneacqwrite/?s=1&source=m_mobile_mirror_interstitial")
if FUNDADORES:
    response = br.open("https://m.facebook.com/messages/read/?tid=id.1623353027949698")
else:
    response = br.open("https://m.facebook.com/messages/compose/?ids=" + FACE_ID)
br.select_form(nr=1)
br.form['body'] = MENSAJE
debug("step6.html")
response = br.submit()
debug("step7.html")

if "/messages/read/" in br.geturl():
    print Log.OKBLUE + "Parece que todo salio bien :D (/messages/read/ in br.geturl())" + Log.ENDC
else:
    print "Estee no tiene buena pinta..."

#intento guardar cookies
#https://docs.python.org/2/library/cookielib.html#module-cookielib
#http://stackoverflow.com/questions/7510806/how-to-save-mechanize-browser-cookies-to-file
cookiejar.save(filename=COOKIE_ABS_FILENAME, ignore_discard=False, ignore_expires=False)
sys.exit(0)
