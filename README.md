# PySpark Portable Environment

A portable, self-contained PySpark environment for Big Data laboratory exercises and coursework. This package provides a consistent, reproducible development environment using Python 3.10.11 and PySpark 3.5.3.

## Overview

This environment addresses common compatibility issues between Python 3.12+ and PySpark's worker processes, particularly when working with User-Defined Functions (UDFs). By using Python 3.10.11, we ensure stable and reliable execution of PySpark operations in a local development setting.

## System Requirements

- **Operating System**: Windows 10 or later
- **Python**: Version 3.10.11 (64-bit)
  - Download: [python-3.10.11-amd64.exe](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)
- **Java**: Version 17
  - Download: [Adoptium OpenJDK 17](https://adoptium.net/)
- **Disk Space**: Approximately 500 MB for the virtual environment

## Installation

### 1. Install Prerequisites

Before proceeding, ensure both Python 3.10.11 and Java 17 are installed on your system.

**Python Installation:**
- Download and run the installer
- **Important**: Check the box "Add Python to PATH" during installation
- Verify installation: `py -3.10 --version`

**Java Installation:**
- Download and install OpenJDK 17 from Adoptium
- Verify installation: `java -version`

### 2. Setup Environment

1. Extract or clone this repository to your desired location
2. Open Command Prompt and navigate to the directory:
   ```cmd
   cd path\to\Pyspark-Local
   ```
3. Run the automated setup script:
   ```cmd
   setup_portable.bat
   ```

The setup script will:
- Create a Python 3.10 virtual environment (`pyspark-310`)
- Install PySpark 3.5.3 and required dependencies
- Register a Jupyter kernel named "PySpark-310-Fixed"
- Verify the installation

### 3. Launch Environment

To start working:
```cmd
start_pyspark_env.bat
```

Then launch Jupyter Notebook:
```cmd
jupyter notebook
```

## Usage

### Creating a New Notebook

Use the provided `notebook_template.ipynb` as a starting point. This template includes:
- Environment configuration code
- Common PySpark imports
- Example DataFrame operations
- UDF implementation examples

### Essential Setup Code

Every notebook must begin with this initialization cell:

```python
import sys
import os

# Configure PySpark to use the correct Python interpreter
os.environ["PYSPARK_PYTHON"] = sys.executable
os.environ["PYSPARK_DRIVER_PYTHON"] = sys.executable

from pyspark.sql import SparkSession
from pyspark.sql.functions import udf, col, when, lit, sum, count, avg
from pyspark.sql.types import StringType, IntegerType, FloatType, DoubleType

# Initialize Spark Session
spark = SparkSession.builder \
    .appName("Big Data Lab") \
    .master("local[*]") \
    .config("spark.ui.enabled", "false") \
    .getOrCreate()

# Verify environment
print(f"Python Version: {sys.version}")
print(f"PySpark Version: {spark.version}")
```

### Working with User-Defined Functions

Example of creating and using a UDF:

```python
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def categorize_value(value):
    """Categorizes a numeric value into ranges."""
    if value < 0:
        return "Negative"
    elif value < 100:
        return "Low"
    elif value < 1000:
        return "Medium"
    else:
        return "High"

# Register the UDF
categorize_udf = udf(categorize_value, StringType())

# Apply to DataFrame
df_categorized = df.withColumn('category', categorize_udf(col('value')))
```

## Project Structure

```
Pyspark-Local/
├── setup_portable.bat          # Automated environment setup
├── start_pyspark_env.bat       # Environment activation script
├── pyspark_fix.py             # Python path configuration helper
├── README_PORTABLE.md         # This file
├── SETUP_INSTRUCTIONS.txt     # Quick reference guide
├── labs/                      # Laboratory notebooks
│   ├── Data Processing.ipynb
│   ├── Data_processing_using_PySpark.ipynb
│   ├── Linear_Regression_short.ipynb
│   ├── Logistic_Regression_Pyspark.ipynb
│   ├── Random_Forests.ipynb
│   ├── notebook_template.ipynb
│   └── README.md
├── datasets/                  # Data files for labs
│   ├── affairs.csv
│   ├── customer_data.csv
│   ├── Linear_regression_dataset.csv
│   ├── Log_Reg_dataset.csv
│   ├── sample_data.csv
│   └── README.md
└── pyspark-310/               # Virtual environment (created during setup)
    ├── Scripts/
    └── Lib/
```

## Troubleshooting

### Common Issues

**Error: "Python worker exited unexpectedly (crashed)"**
- Solution: Ensure you are using the "PySpark-310-Fixed" kernel
- Verify that the initialization cell was executed
- Restart the kernel and re-run all cells from the beginning

**Error: "ModuleNotFoundError: No module named 'pyspark'"**
- Solution: Incorrect kernel selected
- Change kernel to "PySpark-310-Fixed" via Kernel → Change Kernel menu

**Error: "name 'udf' is not defined"**
- Solution: Import statements missing
- Execute the initialization cell with all required imports

**Setup Script Fails**
- Verify Python 3.10 installation: `py -3.10 --version`
- Verify Java installation: `java -version`
- Remove the `pyspark-310` directory and re-run `setup_portable.bat`

### Getting Help

If you encounter issues not covered here:
1. Review `SETUP_INSTRUCTIONS.txt` for detailed setup steps
2. Verify all system requirements are met
3. Check that the correct Jupyter kernel is selected
4. Ensure the initialization cell has been executed

## Technical Specifications

| Component | Version | Purpose |
|-----------|---------|---------|
| Python | 3.10.11 | Base interpreter |
| PySpark | 3.5.3 | Distributed computing framework |
| Java | 17 | PySpark runtime requirement |
| Jupyter | Latest | Notebook interface |
| Kernel | PySpark-310-Fixed | Isolated execution environment |

## Why Python 3.10?

Python 3.12 introduced changes to the subprocess and pickle modules that are incompatible with PySpark's worker process architecture. This results in "Python worker exited unexpectedly" errors when executing UDFs or other parallel operations. Python 3.10.11 is the recommended stable version for PySpark 3.5.x deployments.

## Distribution and Sharing

### For Instructors/Lab Coordinators

To share this environment with students:

1. **Via GitHub**: Direct students to clone the repository
   ```cmd
   git clone https://github.com/AmrrSalem/Pyspark-Local.git
   ```

2. **Via ZIP File**: Provide a compressed archive of this directory
   - Students should extract to their preferred location
   - Run `setup_portable.bat` to initialize

### What to Share

Include these files:
- All `.bat` scripts
- `notebook_template.ipynb`
- `pyspark_fix.py`
- Documentation files (`.md`, `.txt`)

Do NOT share:
- The `pyspark-310` directory (auto-generated per machine)
- Any personal notebook files or data

## References and Resources

- [Apache Spark Documentation](https://spark.apache.org/docs/latest/api/python/)
- [Python 3.10 Release Information](https://www.python.org/downloads/release/python-31011/)
- [Adoptium OpenJDK Downloads](https://adoptium.net/)
- [Jupyter Documentation](https://jupyter-notebook.readthedocs.io/)

## License and Attribution

This environment configuration is provided for educational purposes. PySpark and its dependencies are subject to their respective licenses.

---

**Note**: This is a local development environment intended for learning and coursework. For production deployments, refer to Apache Spark's official deployment documentation.
