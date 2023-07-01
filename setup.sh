echo "Setting up Insomniac..."
pip install virtualenv
python -m venv env
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
        source env/bin/activate
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        source env/bin/activate
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        # CMD or Powershell
        env/Scripts/activate.bat || env/Scripts/Activate.ps1
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        # CMD or Powershell
        env/Scripts/activate.bat || env/Scripts/Activate.ps1
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        # CMD or Powershell
        env/Scripts/activate.bat || env/Scripts/Activate.ps1
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
        source env/bin/activate
else
        # Unknown.
        echo "unknown operating system"
fi

pip install -r requirements.txt
python app_gui.py