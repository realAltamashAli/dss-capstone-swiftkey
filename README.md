# NLP Next Word Predictor: SwiftKey Capstone
Built as the final project for the Johns Hopkins Data Science Specialization (DSS).

## Live Links
* **Shiny Web Application:** [https://altamashali.shinyapps.io/swiftkey-predictor/](https://altamashali.shinyapps.io/swiftkey-predictor/)
* **RPubs Pitch Deck:** [https://rpubs.com/altamashali/swiftkey-predictor](https://rpubs.com/altamashali/swiftkey-predictor)

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
