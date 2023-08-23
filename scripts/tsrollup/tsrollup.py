# ANSI color codes:
RED="\x1b[0;31m"
GREEN="\x1b[0;32m"
BLUE="\x1b[0;34m"
YELLOW="\x1b[0;33m"
RESET="\x1b[0;m"

import os as os

def check_pkgjson()->(bool|None):
    cwd = os.getcwd()
    pkgjson_path = os.path.abspath(cwd+"/package.json")
    is_pkgjson = os.path.exists(pkgjson_path)
    if (is_pkgjson):
        return True
    else:
        print(f"{RED}Error: {GREEN}package.json{RESET} does not exist in {BLUE+cwd+RESET}\n\tFile {BLUE}{pkgjson_path}{RESET} does not exist")
        return
    
    