# app.R
library(shiny)
library(dplyr)
library(stringr)

# Load the model (Must be in the same folder)
ngram_model <- readRDS("ngram_data.rds")
bigrams <- ngram_model$bigrams
trigrams <- ngram_model$trigrams
quadgrams <- ngram_model$quadgrams

# --- Prediction Logic (Katz Back-off) ---
predict_next_word <- function(input_text) {
  # Clean input
  clean_text <- tolower(input_text)
  clean_text <- str_replace_all(clean_text, "[^a-z\\s]", "")
  words <- unlist(str_split(clean_text, "\\s+"))
  words <- words[words != ""] # Remove empty strings
  
  n <- length(words)
  
  # 1. Try Quadgram (uses last 3 words)
  if (n >= 3) {
    w1 <- words[n-2]; w2 <- words[n-1]; w3 <- words[n]
    match <- quadgrams %>% filter(word1 == w1, word2 == w2, word3 == w3) %>% head(1)
    if (nrow(match) > 0) return(match$word4)
  }
  
  # 2. Try Trigram (uses last 2 words)
  if (n >= 2) {
    w1 <- words[n-1]; w2 <- words[n]
    match <- trigrams %>% filter(word1 == w1, word2 == w2) %>% head(1)
    if (nrow(match) > 0) return(match$word3)
  }
  
  # 3. Try Bigram (uses last 1 word)
  if (n >= 1) {
    w1 <- words[n]
    match <- bigrams %>% filter(word1 == w1) %>% head(1)
    if (nrow(match) > 0) return(match$word2)
  }
  
  # 4. Default fallback (most common word)
  return("the")
}

# --- Shiny UI ---
ui <- fluidPage(
  
  # Adding custom CSS to match the professional blue theme from the presentation
  tags$head(
    tags$style(HTML("
      body { background-color: #f0f8ff; color: #333333; }
      .well { background-color: #ffffff; border: 1px solid #003366; box-shadow: 3px 3px 5px rgba(0,0,0,0.1); }
      h1, h2, h3, h4 { color: #003366; font-family: 'Helvetica', sans-serif; }
      .shiny-input-container { color: #333333; }
      #prediction { 
        color: #0066cc; 
        font-weight: bold; 
        font-size: 24px; 
        background-color: #e6f2ff; 
        border: 1px solid #b3d9ff;
        padding: 15px;
        border-radius: 5px;
      }
      .footer-link { font-size: 0.9em; color: #666; margin-top: 30px; border-top: 1px solid #ccc; padding-top: 10px; }
    "))
  ),
  
  titlePanel("SwiftKey Text Predictor"),
  
  sidebarLayout(
    sidebarPanel(
      h4("User Input"),
      helpText("Enter a partial sentence below to see the next word prediction."),
      textInput("user_input", "Your Text:", value = "The quick brown"),
      hr(),
      h4("About the Model"),
      p("This application uses a ", strong("Katz Back-off NLP model"), "to predict the next word in a sequence."),
      p("The algorithm analyzes the last 1 to 3 words typed and compares them against frequency tables derived from a large corpus of English text."),
      tags$ul(
        tags$li("Blue theme matches project specs."),
        tags$li("Optimized for speed and accuracy.")
      ),
      br(),
      p(em("Developed by Altamash Ali"))
    ),
    
    mainPanel(
      h3("Predicted Next Word"),
      verbatimTextOutput("prediction"),
      br(),
      h4("Current Phrase Context:"),
      textOutput("original_text"),
      
      # Footer with RPubs link
      div(class = "footer-link",
          p("View the full Pitch Deck on ", 
            a("RPubs", href="https://rpubs.com/altamashali/swiftkey-predictor", target="_blank"))
      )
    )
  )
)

# --- Shiny Server ---
server <- function(input, output) {
  
  prediction <- reactive({
    req(input$user_input)
    predict_next_word(input$user_input)
  })
  
  output$prediction <- renderText({
    prediction()
  })
  
  output$original_text <- renderText({
    input$user_input
  })
}

shinyApp(ui = ui, server = server)