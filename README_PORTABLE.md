# PySpark Portable Environment for Big Data Labs

## Overview
This is a portable PySpark environment designed for Big Data labs. It uses Python 3.10 and PySpark 3.5.3 to avoid compatibility issues with UDFs.

## What's Included
```
LocalPySparkNoVmWare_v4/
├── setup_portable.bat          # Automated setup script
├── start_pyspark_env.bat       # Environment activation script
├── notebook_template.ipynb     # Template notebook with examples
├── pyspark_fix.py             # Helper for Python path configuration
├── test_udf.py                # UDF test script
├── SETUP_INSTRUCTIONS.txt     # Detailed instructions
├── README_PORTABLE.md         # This file
└── [your .ipynb files]        # Your lab notebooks
```

## Quick Start for Your Colleagues

### Prerequisites
1. **Python 3.10.11** - Direct download: [python-3.10.11-amd64.exe](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)
   - **IMPORTANT:** Check "Add Python to PATH" during installation
2. **Java 17** - Download from https://adoptium.net/
   - PySpark requires Java to run

### Installation Steps

1. **Copy the folder** to any location on your machine:
   ```
   Example: D:\BigDataLabs\LocalPySparkNoVmWare_v4
   ```

2. **Open Command Prompt** and navigate to the folder:
   ```cmd
   cd D:\BigDataLabs\LocalPySparkNoVmWare_v4
   ```

3. **Run the setup script**:
   ```cmd
   setup_portable.bat
   ```
   This will:
   - Create a Python 3.10 virtual environment
   - Install PySpark 3.5.3 and all dependencies
   - Register the Jupyter kernel

4. **Start the environment**:
   ```cmd
   start_pyspark_env.bat
   ```

5. **Launch Jupyter Notebook**:
   ```cmd
   jupyter notebook
   ```

6. **Select the correct kernel**:
   - In Jupyter, click on "Kernel" → "Change Kernel" → "PySpark-310-Fixed"

## Usage

### Starting a New Notebook

Use the provided `notebook_template.ipynb` as a starting point. It includes:
- Proper environment setup
- Common imports
- Example DataFrame operations
- Example UDF usage

### Required Imports (First Cell)

Every notebook should start with this cell:

```python
import sys
import os

# Configure PySpark
os.environ["PYSPARK_PYTHON"] = sys.executable
os.environ["PYSPARK_DRIVER_PYTHON"] = sys.executable

from pyspark.sql import SparkSession
from pyspark.sql.functions import udf, col, when, lit
from pyspark.sql.types import StringType, IntegerType, FloatType

# Create Spark Session
spark = SparkSession.builder \
    .appName("Big Data Lab") \
    .master("local[*]") \
    .config("spark.ui.enabled", "false") \
    .getOrCreate()

print(f"Python: {sys.version}")
print(f"PySpark: {spark.version}")
```

### Working with UDFs

```python
# Define your function
def classify_age(age):
    if age < 18:
        return "Minor"
    elif age < 65:
        return "Adult"
    else:
        return "Senior"

# Create the UDF
classify_age_udf = udf(classify_age, StringType())

# Use the UDF
df = df.withColumn('age_group', classify_age_udf(col('age')))
```

## Troubleshooting

### "Python worker exited unexpectedly"
- Make sure you're using the **PySpark-310-Fixed** kernel
- Verify the first cell with environment setup was executed
- Restart the kernel and run all cells from the top

### "ModuleNotFoundError: No module named 'pyspark'"
- Wrong kernel selected
- Switch to **PySpark-310-Fixed** kernel

### "name 'udf' is not defined"
- Missing imports
- Run the first cell with all imports

### Setup script fails
- Verify Python 3.10 is installed: `py -3.10 --version`
- Verify Java is installed: `java -version`
- Delete `pyspark-310` folder and re-run `setup_portable.bat`

## Sharing with Others

### What to Share:
1. The entire `LocalPySparkNoVmWare_v4` folder
2. Make sure to include:
   - `setup_portable.bat`
   - `start_pyspark_env.bat`
   - `SETUP_INSTRUCTIONS.txt`
   - `notebook_template.ipynb`
   - Your lab notebook files

### What NOT to Share:
- The `pyspark-310` folder (each user creates their own)
- The `pyspark-easy`, `pyspark-easy-new`, `pyspark-light` folders (old/broken environments)

### For Your Colleagues:
Just tell them to:
1. Extract the folder
2. Run `setup_portable.bat`
3. Follow the prompts

## Technical Details

- **Python Version**: 3.10.0
- **PySpark Version**: 3.5.3
- **Jupyter Kernel Name**: PySpark-310-Fixed
- **Virtual Environment**: `pyspark-310` (created locally on each machine)

## Why Python 3.10?

Python 3.12 has compatibility issues with PySpark's worker processes, causing UDFs to crash. Python 3.10 is the stable, recommended version for PySpark 3.5.x.

## Files Generated During Setup

```
pyspark-310/              # Virtual environment (DO NOT share)
├── Scripts/
│   ├── python.exe       # Python 3.10 interpreter
│   ├── jupyter.exe      # Jupyter launcher
│   └── activate.bat     # Environment activation
└── Lib/
    └── site-packages/   # Installed packages
```

## Additional Resources

- PySpark Documentation: https://spark.apache.org/docs/latest/api/python/
- Python 3.10 Download: https://www.python.org/downloads/
- Java Download: https://adoptium.net/

## Support

If you encounter issues:
1. Check SETUP_INSTRUCTIONS.txt
2. Verify all prerequisites are installed
3. Delete `pyspark-310` and re-run setup
4. Check that you're using the PySpark-310-Fixed kernel
