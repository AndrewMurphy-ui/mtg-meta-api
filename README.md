MTG Meta Analysis (Python + SQL)
Overview

This project analyzes Magic: The Gathering (MTG) card/meta trends using Python + SQL.
It focuses on extracting insights from card frequency data and generating visual outputs to highlight patterns in the evolving MTG meta.

Features

Data Processing (ETL-style workflow): Loads and transforms MTG card frequency data for analysis.

SQL Aggregations: Uses SQL queries to calculate card counts and frequency-based metrics.

Analysis + Insights: Computes summary statistics and trends from the dataset.

Visualization: Generates charts/outputs to communicate results clearly.

Technologies Used

Python

SQL

Pandas / NumPy

Matplotlib (or update this to what you actually used)

Project Structure

Main.py — main entry point (runs the analysis workflow)

Transfer.py — helper script for data transformation/loading

Cardcount.sql — SQL query logic for aggregation

cardfrequency.csv — dataset used for analysis

BiasedTest.py — experimental/testing script

Installation

Clone the repository:

git clone https://github.com/YOUR_USERNAME/REPO_NAME.git


Navigate to the project directory:

cd REPO_NAME


(Optional) Create and activate a virtual environment:

python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`


Install dependencies:

pip install -r requirements.txt

Usage

Run the project with:

python Main.py

Output

This project produces visualizations and summary insights such as:

Most frequently occurring cards

Distribution trends based on frequency data

Aggregated metrics from SQL queries

(See the included screenshot in this repo.)

Next Improvements

Add a FastAPI API layer to expose results through endpoints

Add unit tests for analysis functions

Containerize with Docker for easy setup

License

This project is licensed under the MIT License.

Contact

For questions or suggestions, feel free to reach out via GitHub.
