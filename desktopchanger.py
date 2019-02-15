# desktop changer
from time import sleep
import subprocess
from os import listdir, path

# identify -format "%wx%h" ~/Pictures/VIAJE\ EUROPA/Sesion/00001-M\&L-1526.jpg

def get_file_list(''):
    pass


def is_wide():
    p = subprocess.Popen(pargs, stdout=subprocess.PIPE)
    newtime = float(p.stdout.read().strip())


def main():
    while True:
        change_random()
        sleep(5)


if __name__ == '__main__':
    main()
