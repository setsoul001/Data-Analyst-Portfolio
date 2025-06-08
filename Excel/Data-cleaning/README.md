# Excel Data Cleaning Projects

This repository contains files and methods used for cleaning, formatting, and transforming Excel datasets for further analysis or reporting.

## 📌 Project Overview
Data cleaning is a critical step in the data analysis process. This project provides a structured approach to identifying and resolving common data quality issues in Excel files, including:
- Removing duplicates
- Handling missing values
- Standardizing column formats
- Correcting data types
- Splitting/merging columns
- Removing unnecessary rows/columns

## 📁 Files in This Repository
Each file in this repository contains 3 sheets:
- The raw data
- The raw data and calculation
- The clean data

  - ## [US President Dataset](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Excel/Data-cleaning/US-Presidents-Data.xlsx)
    This dataset contains information on U.S. Presidents, including their vices, political affiliation, and salary. The following data cleaning tasks were completed:
    - Date normalization: All date fields were converted to a consistent format.(All eventually dropped)
    - Text standardization: Presidents and their vices names, and party affiliations were cleaned for casing and spacing consistency.
    - Column integrity: Removed duplicate rows and unnecessary columns.
    - Party label correction: Unified party name variants (e.g., "Republicans" corrected to "Republican") for accurate grouping.
   
   - ## [Sales Dataset](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Excel/Data-cleaning/Sales-Data.xlsx)
    This dataset contains information on order ID, shipping mode, segment, and sales. The raw data was jumbled up and required to be arranged with consistency.
    - The IFS statement was crucial in arranging the data properly
    - Text and number standardization was carried out to ensure consistency in each columns.

    - ## [Customer details Dataset](https://github.com/setsoul001/Data-Analyst-Portfolio/blob/main/Excel/Data-cleaning/Customers-Details.xlsx)
    This dataset contained inconsistencies and mixed-format entries. Notably, one column combined Name, Address, Age and Gender in a single field, making the data difficult to analyze. The following steps were taken to clean and restructure the data:
    - Split mixed data column: Extracted Name, Date, and Age from a single combined field into three separate columns using string parsing and pattern recognition.
    - Age conversion: Cleaned and converted the extracted Age values to numeric data types for demographic analysis.
    - Name normalization: Standardized name formatting to improve readability and enable matching or grouping.
    - Error handling: Flagged and reviewed entries with ambiguous or corrupted formatting to prevent misclassification.
