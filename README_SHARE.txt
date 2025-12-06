========================================
PySpark Portable Environment - SHARE PACKAGE
========================================

WHAT'S IN THIS FOLDER:
----------------------
This folder contains everything your colleagues need to set up the PySpark environment.

FILES INCLUDED:
---------------
1. setup_portable.bat        - Automated installation script
2. start_pyspark_env.bat     - Environment launcher
3. pyspark_fix.py           - Helper module for Python paths
4. notebook_template.ipynb  - Template notebook with examples
5. SETUP_INSTRUCTIONS.txt   - Quick setup guide
6. README_PORTABLE.md       - Complete documentation
7. README_SHARE.txt         - This file

HOW TO SHARE:
-------------
1. Copy this entire "shared" folder to your colleagues
   OR
2. Zip this folder and send it via email/network

WHAT YOUR COLLEAGUES SHOULD DO:
--------------------------------
1. Extract/copy the folder to their desired location
   Example: D:\BigDataLabs\LocalPySparkNoVmWare_v4

2. Make sure they have:
   - Python 3.10.11 installed
     Direct download: https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe
     IMPORTANT: Check "Add Python to PATH" during installation
   - Java 17 installed
     Download from: https://adoptium.net/

3. Open Command Prompt in the folder and run:
   setup_portable.bat

4. Follow the prompts

5. When setup completes, run:
   start_pyspark_env.bat

6. Then run:
   jupyter notebook

7. In Jupyter, select kernel: "PySpark-310-Fixed"

IMPORTANT NOTES:
----------------
- Each person must run setup_portable.bat on their own machine
- The setup creates a local "pyspark-310" virtual environment
- The environment is NOT portable itself, but the setup scripts are
- All required packages will be downloaded during setup

TROUBLESHOOTING:
----------------
If setup fails, check:
1. Python 3.10 is installed: py -3.10 --version
2. Java is installed: java -version
3. Internet connection (for downloading packages)

See README_PORTABLE.md for detailed documentation.

========================================
Questions? Check README_PORTABLE.md or SETUP_INSTRUCTIONS.txt
========================================
