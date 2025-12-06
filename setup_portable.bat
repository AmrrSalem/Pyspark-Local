@echo off
setlocal ENABLEDELAYEDEXPANSION
echo =============================================
echo   PySpark Portable Environment Setup
echo   Python 3.10 + PySpark 3.5.3 + Jupyter
echo =============================================
echo.

REM Check that Python 3.10 is installed
echo [1/7] Checking for Python 3.10...
py -3.10 --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python 3.10 was not found.
    echo Please install Python 3.10 from:
    echo   https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)
py -3.10 --version

REM Check Java installation
echo.
echo [2/7] Checking for Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo [WARNING] Java is not installed or not in PATH
    echo PySpark requires Java 17
    echo Download from: https://adoptium.net/
    echo.
    set /p continue="Continue anyway? (y/n): "
    if /i not "!continue!"=="y" exit /b 1
) else (
    java -version
)

REM Remove old environment if exists
echo.
echo [3/7] Preparing virtual environment...
if exist pyspark-310 (
    echo Found existing pyspark-310 environment.
    set /p overwrite="Remove and recreate? (y/n): "
    if /i "!overwrite!"=="y" (
        echo Removing old environment...
        rmdir /s /q pyspark-310
        py -3.10 -m venv pyspark-310
    ) else (
        echo Using existing environment.
    )
) else (
    echo Creating new virtual environment...
    py -3.10 -m venv pyspark-310
)

REM Activate virtual environment
echo.
echo [4/7] Activating virtual environment...
call pyspark-310\Scripts\activate.bat

REM Upgrade pip
echo.
echo [5/7] Upgrading pip...
python -m pip install --upgrade pip

REM Install packages
echo.
echo [6/7] Installing PySpark 3.5.3 and dependencies...
echo This may take several minutes...
pip install pyspark==3.5.3 jupyter notebook ipython ipykernel pandas matplotlib seaborn findspark pyarrow

REM Register Jupyter kernel
echo.
echo [7/7] Registering Jupyter kernel...
python -m ipykernel install --user --name=pyspark-310 --display-name="PySpark-310-Fixed"

REM Verify installation
echo.
echo ========================================
echo Verifying installation...
echo ========================================
python -c "import pyspark; print(f'PySpark version: {pyspark.__version__}')"
jupyter kernelspec list | findstr pyspark-310

echo.
echo ========================================
echo Installation Complete!
echo ========================================
echo.
echo The environment is ready to use.
echo.
echo Next steps:
echo   1. Run: start_pyspark_env.bat
echo   2. Run: jupyter notebook
echo   3. Select kernel: "PySpark-310-Fixed"
echo.
echo See SETUP_INSTRUCTIONS.txt for more details.
echo.
pause
