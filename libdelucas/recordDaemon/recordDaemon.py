import signal, os, sys

#todo
#keyboardInterrupt
#rotar archivos

def handler(signum, frame):
    print 'Signal handler called with signal', signum
signal.signal(signal.SIGALRM, handler)

segundos = 10
cantidad_archivos = 3
path = 'a'

def record(segundos, path):
    record_command = "timeout {} rec {}.wav -q silence 1 0.1 0.5% -1 3.0 0.5%".format(segundos, path)
    convert_command = "lame -V2 {}.wav {}.mp3".format(path, path)
    print("Recording...")
    os.system(record_command)
    print("End Recording...")
    os.system(convert_command)
    os.remove(path + ".wav")

if __name__ == "__main__":
    record(segundos, path)
