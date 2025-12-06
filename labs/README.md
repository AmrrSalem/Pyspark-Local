# Lab Notebooks

This directory contains Jupyter notebooks for Big Data laboratory exercises using PySpark.

## Available Labs

### 1. Data Processing
- **Data Processing.ipynb** - Introduction to data processing with PySpark
- **Data_processing_using_PySpark.ipynb** - Comprehensive data processing techniques

### 2. Linear Regression
- **Linear_Regression_short.ipynb** - Linear regression implementation with PySpark MLlib
- Dataset: `Linear_regression_dataset.csv` (in datasets folder)

### 3. Logistic Regression
- **Logistic_Regression_Pyspark.ipynb** - Binary classification using logistic regression
- Dataset: `Log_Reg_dataset.csv` (in datasets folder)

### 4. Random Forests
- **Random_Forests.ipynb** - Ensemble learning with Random Forest classifier

### 5. Template
- **notebook_template.ipynb** - Starting template for new notebooks

## Usage Instructions

1. **Start the environment**:
   ```cmd
   start_pyspark_env.bat
   ```

2. **Launch Jupyter Notebook**:
   ```cmd
   jupyter notebook
   ```

3. **Select the correct kernel**:
   - Open any notebook
   - Click Kernel → Change Kernel → "PySpark-310-Fixed"

4. **Run the initialization cell**:
   - Always execute the first cell with environment setup
   - This configures PySpark to use the correct Python interpreter

## Important Notes

- All notebooks require the **PySpark-310-Fixed** kernel
- Execute cells in order from top to bottom
- The initialization cell must be run first in every session
- Datasets are located in the `../datasets/` directory

## Lab Workflow

Each lab notebook follows this structure:

1. **Initialization**: Environment setup and imports
2. **Data Loading**: Read datasets from the datasets folder
3. **Data Exploration**: Examine data structure and statistics
4. **Data Transformation**: Clean and prepare data
5. **Model Training**: Build and train machine learning models
6. **Evaluation**: Assess model performance
7. **Visualization**: Display results

## Getting Help

If you encounter issues:
- Verify you're using the PySpark-310-Fixed kernel
- Ensure the initialization cell was executed
- Check that datasets are in the correct location
- Restart the kernel and run all cells from the beginning
