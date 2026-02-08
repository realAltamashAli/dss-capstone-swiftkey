# NLP Next Word Predictor: SwiftKey Capstone
Built as the final project for the Johns Hopkins Data Science Specialization (DSS).

[![JHU Certified](https://img.shields.io/badge/Certified-Johns_Hopkins_University-002D72?logo=johnshopkins&logoColor=white)](https://www.coursera.org/account/accomplishments/specialization/03JY70ZMOKVJ)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

## Live Links
* **Professional Pitch Deck:** [RPubs Presentation](https://rpubs.com/altamashali/swiftkey-predictor)  
  *A 5-slide executive summary of the project.*
  
* **Interactive Shiny App:** [Predictive Text Engine](https://altamashali.shinyapps.io/swiftkey-predictor/)  
  *Experience the model in real-time.*
  
* **Technical Milestone Report:** [Exploratory Data Analysis](https://realaltamashali.github.io/dss-capstone-swiftkey/)  
  *Detailed look at the data cleaning, n-gram distributions, and NLP strategy.*

## Project Overview
The goal of this project was to build a predictive text engine similar to SwiftKey. The application takes a user-inputted phrase and predicts the most likely next word in real-time.

### Key Features:
- **Katz Back-off Algorithm:** Uses a tiered approach checking 4-grams, 3-grams, and 2-grams.
- **High Performance:** Optimized `.rds` data structures ensure predictions in <0.1 seconds.
- **Cleaning & Tokenization:** Handled via the `tidytext` and `stringr` packages.

## Tech Stack
- **Language:** R
- **Framework:** Shiny
- **Packages:** dplyr, tidytext, stringr, knitr

## Repository Contents
- `app.R`: The complete Shiny application code.
- `ngram_data.rds`: The compiled N-gram frequency tables.
- `milestone_report.Rmd`: Exploratory Data Analysis of the HC Corpora dataset.
- `pitch.Rpres`: Source code for the professional 5-slide pitch.
