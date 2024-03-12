# Project 3 - DATA 607: Which are the most valued data science skills?

**Authors**: Naomi Buell, Nick Kunze, Kaylie Evans  
**Date**: `r Sys.Date()`  

## Overview

This project aims to answer the question, "which are the most value data science skills?" The process involves selecting a data set, normalizing the data, cleaning and tidying data, and performaing an analysis.

## Setup

### Required Packages

This project utilizes several R packages, including:
- dplyr
- tidyverse
- readr
- janitor

Ensure that these packages are installed and loaded before running the code.

## Data Import

The job data is imported from a CSV file hosted on GitHub. The `read_csv` function from the `readr` package is used for data import, and the `clean_names` function from the `janitor` package is applied to automatically clean column names.

## Cleaning, Tidying, and Standardizing Variables of Interest

### Title Extraction

- The `title` column is processed to extract additional details into a new column called `analyst_detail`.
- Qualifiers such as "Remote," "Hybrid," and "Onsite" are identified and stored in the `analyst_detail_onsite_remote` column.

### Standardization

- Job titles are standardized by removing extraneous information such as "analyst," remote/onsite qualifiers, and special characters.
- The cleaned job titles are stored in the `title_clean` column.

## Location Data

### Extraction

- Location details are extracted from the `location` column into separate columns for city (`location_1`) and state (`location_2`).

### Verification

- The uniqueness and accuracy of location data are verified by examining the levels of `location_1` and `location_2`.

## Conclusion

This README provides an overview of the project process. For detailed implementation and code snippets, refer to the R script.
