# MTG Meta Analysis (Python + SQL)

<img width="1305" height="721" alt="image" src="https://github.com/user-attachments/assets/689a2cd9-af24-4602-81da-af4d0c901bd1" />









## Overview
This project analyzes **Magic: The Gathering (MTG)** card/meta trends using **Python + SQL**.  
It focuses on extracting insights from card frequency data and generating visual outputs to highlight patterns in the evolving MTG meta.

## Features
- **Data Processing (ETL-style workflow)**: Loads and transforms MTG card frequency data for analysis.
- **SQL Aggregations**: Uses SQL queries to calculate card counts and frequency-based metrics.
- **Analysis + Insights**: Computes summary statistics and trends from the dataset.
- **Visualization**: Generates charts/outputs to communicate results clearly.

## Technologies Used
- **Python**
- **SQL**
- **Pandas / NumPy**
- **Matplotlib** *(update this if you used something else)*

## Project Structure
- `Main.py` — main entry point (runs the analysis workflow)
- `Transfer.py` — helper script for data transformation/loading
- `Cardcount.sql` — SQL query logic for aggregation
- `cardfrequency.csv` — dataset used for analysis
- `BiasedTest.py` — experimental/testing script

## Installation
1. Clone the repository:
```sh
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
