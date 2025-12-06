# Datasets

This directory contains datasets used in the laboratory exercises.

## Available Datasets

### 1. affairs.csv
- **Size**: ~90 KB
- **Description**: Dataset for relationship analysis
- **Used in**: Data processing labs

### 2. customer_data.csv
- **Size**: ~130 KB
- **Description**: Customer information and transaction data
- **Used in**: Data processing and analysis labs

### 3. Linear_regression_dataset.csv
- **Size**: ~35 KB
- **Description**: Dataset for linear regression exercises
- **Used in**: Linear_Regression_short.ipynb

### 4. Log_Reg_dataset.csv
- **Size**: ~494 KB
- **Description**: Binary classification dataset
- **Used in**: Logistic_Regression_Pyspark.ipynb

### 5. sample_data.csv
- **Size**: ~0.5 KB
- **Description**: Small sample dataset for testing
- **Used in**: Various example notebooks

## Loading Data in Notebooks

### Using Relative Paths

From a notebook in the `labs/` folder:

```python
# Load dataset
df = spark.read.csv("../datasets/customer_data.csv", header=True, inferSchema=True)
```

### Using Absolute Paths

```python
import os

# Get the base directory
base_dir = os.path.dirname(os.path.dirname(os.getcwd()))
dataset_path = os.path.join(base_dir, "datasets", "customer_data.csv")

# Load dataset
df = spark.read.csv(dataset_path, header=True, inferSchema=True)
```

### Common Read Options

```python
# CSV with header and schema inference
df = spark.read.csv("path/to/file.csv",
                    header=True,
                    inferSchema=True)

# CSV with custom delimiter
df = spark.read.csv("path/to/file.csv",
                    header=True,
                    sep=";",
                    inferSchema=True)

# Handle missing values
df = spark.read.csv("path/to/file.csv",
                    header=True,
                    inferSchema=True,
                    nullValue="NA")
```

## Data Exploration

After loading, always explore your data:

```python
# Show first few rows
df.show(5)

# Display schema
df.printSchema()

# Get summary statistics
df.describe().show()

# Count rows
print(f"Total rows: {df.count()}")

# Check for null values
from pyspark.sql.functions import col, sum as _sum

df.select([_sum(col(c).isNull().cast("int")).alias(c)
           for c in df.columns]).show()
```

## Dataset Guidelines

- **Do not modify** the original CSV files
- All datasets are in CSV format with headers
- Use appropriate read options for your analysis
- Consider caching DataFrames for repeated operations

## Adding Your Own Datasets

To add custom datasets:

1. Place CSV files in this directory
2. Use consistent naming (lowercase, underscores)
3. Include headers in your CSV files
4. Document the dataset structure in your notebook
