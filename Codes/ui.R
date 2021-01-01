# Define UI for application that draws a histogram
shinyUI(
    fluidPage(
        useShinyjs(),
        
        titlePanel("Assignment 1 - Visualising a dataset_Shi Chen"
        ),
        tabsetPanel(
            tabPanel("Summary",
                     verbatimTextOutput(outputId = "SummaryA1"),
                     verbatimTextOutput(outputId = "SummaryA2")
                     
            ),
            
            tabPanel("Raw Data",
                     DT::dataTableOutput(outputId = "car_table")
            ),
            tabPanel("Missing Value",
                     shinycssloaders::withSpinner(
                     plotOutput(outputId = "Missing")
                     ),
                     checkboxInput(inputId = "cluster", label = "Cluster missingness", value = TRUE)
            ),
            tabPanel("Corrgram",
                     shinycssloaders::withSpinner(
                     plotOutput(outputId = "Corrgram")
                     ),
                     checkboxInput(inputId = "abs", label = "Uses absolute correlation", value = TRUE),
                     selectInput(inputId = "CorrMeth", label = "Correlation method", choices = c("pearson","spearman","kendall"), selected = "pearson"),
                     selectInput(inputId = "Group", label = "Grouping method", choices = list("none"=FALSE,"OLO"="OLO","GW"="GW","HC"="HC"), selected = "OLO"),
            ),
            

            tabPanel("Mixed Pairs set1",
                     selectizeInput(inputId = "pairs", label = "Select variable set:", choices = colname_pairs_set, multiple = TRUE, selected = colname_pairs_set[1:11]),
                     shinycssloaders::withSpinner(
                         plotOutput(outputId = "MixedPairs")
                     )
            ),
            
            
            tabPanel("Mixed Pairs set2",
                     selectizeInput(inputId = "pairs2", label = "Select variable set:", choices = colname_pairs_set2, multiple = TRUE, selected = colname_pairs_set2[1:10]),
                     shinycssloaders::withSpinner(
                         plotOutput(outputId = "MixedPairs2")
                     )
            ),
            
            tabPanel("Mixed Pairs set3",
                     selectizeInput(inputId = "pairs3", label = "Select variable set:", choices = colname_pairs_set3, multiple = TRUE, selected = colname_pairs_set3[1:9]),
                     shinycssloaders::withSpinner(
                         plotOutput(outputId = "MixedPairs3")
                     )
            ),
            
            tabPanel("Mixed Pairs set4",
                     selectizeInput(inputId = "pairs4", label = "Select variable set:", choices = colname_pairs_set4, multiple = TRUE, selected = colname_pairs_set4[1:13]),
                     shinycssloaders::withSpinner(
                         plotOutput(outputId = "MixedPairs4")
                     )
            ),
            
            tabPanel("Boxplot & Outliers",
                     shinycssloaders::withSpinner(
                         plotOutput(outputId = "Boxplot", height = 600)
                     ),
                     checkboxInput(inputId = "standardise", label = "Show standardized", value = FALSE),
                     checkboxInput(inputId = "outliers", label = "Show outliers", value = TRUE),
                     sliderInput(inputId = "range", label = "IQR Multiplier", min = 0, max = 5, step = 0.1, value = 1.5),
            ),
            
            
            tabPanel("Rising Value",
                     selectizeInput(inputId = "rising", label = "Select variable set:", choices = choicesC, multiple = TRUE, selected = choicesB[c(1,17,18,21,27,31,36,38,41)]),
                     plotOutput(outputId = "RisingValue")
            ),
            
            tabPanel("Mosaic",
                     selectizeInput(inputId = "Mosaic", label = "Show variables:", choices = choicesA, multiple = TRUE, selected = choicesA[c(2,5,9)],options = list(maxItems = 4)),
                     plotOutput(outputId = "Mosaic")
            )
        )
        
    )
    
)

        
            

   
    

