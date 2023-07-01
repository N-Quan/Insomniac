import time
import multiprocessing
import pyautogui
import PySimpleGUI as gui

def InsomniacUI():
    gui.theme('Dark')
    layout = [
        [gui.Text('Insomniac is now running.\nMinimise to hide or close to disable it')]
    ]
    window = gui.Window('Insomniac', layout)
    
    volume_toggle_process = multiprocessing.Process(target = keep_alive)
    volume_toggle_process.start()
    
    while True:
        event, values = window.read()
        if event == gui.WIN_CLOSED: # if user closes window or clicks cancel
            if volume_toggle_process.is_alive(): 
                volume_toggle_process.terminate()
            break

def keep_alive():
    while True:
        pyautogui.press('volumedown')
        time.sleep(1)
        pyautogui.press('volumeup')
        time.sleep(300)



if __name__ == '__main__':
    main_process = multiprocessing.Process(target = InsomniacUI)
    main_process.start()


# pip install virtualenv
# python -m venv env
# env/Scripts/Activate.ps1
# pip install -r requirements.txt
# python app_gui.py
