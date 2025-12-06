@echo off
call pyspark-310\Scripts\activate.bat
echo.
echo ========================================
echo PySpark Environment Activated (Python 3.10)
echo ========================================
echo.
echo Python version:
python --version
echo.
echo PySpark version: 3.5.3
echo Kernel: PySpark-310-Fixed
echo.
echo Available commands:
echo   jupyter notebook  - Start Jupyter Notebook
echo   jupyter lab       - Start Jupyter Lab (install with: pip install jupyterlab)
echo   deactivate        - Exit environment
echo.
cmd /k
