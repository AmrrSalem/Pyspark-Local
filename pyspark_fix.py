# Not Required in Big Data Course
# Helper to configure PySpark to use the current Python interpreter (Jupyter/kernel venv)
# Students should STILL write the full SparkSession code in the notebook.

import os
import sys

def configure_pyspark():
    """Force PySpark to use the same Python executable as the current process.

    Call this BEFORE creating SparkSession.
    """
    python_exe = sys.executable
    os.environ["PYSPARK_PYTHON"] = python_exe
    os.environ["PYSPARK_DRIVER_PYTHON"] = python_exe
    print(f"Configured PYSPARK_PYTHON = {python_exe}")
