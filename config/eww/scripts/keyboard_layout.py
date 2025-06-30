#!/bin/python

import os
import signal
import subprocess
import time

PID_FILE = "/tmp/keyboard_layout.pid"

def get_layout():
    result = subprocess.run(["xkb-switch"], capture_output=True, text=True)
    return result.stdout.strip().upper()

def print_label():
    layout = get_layout()
    print(f'(label :width 2 :class "keyboard-layout" :text "{layout}")', flush=True)

def cleanup_old_process():
    if os.path.exists(PID_FILE):
        try:
            with open(PID_FILE, "r") as f:
                old_pid = int(f.read().strip())
            os.kill(old_pid, signal.SIGTERM)
        except Exception:
            pass

def main():
    cleanup_old_process()
    
    with open(PID_FILE, "w") as f:
        f.write(str(os.getpid()))

    signal.signal(signal.SIGUSR1, lambda sig, frame: print_label())

    print_label()

    while True:
        signal.pause()

if __name__ == "__main__":
    main()
