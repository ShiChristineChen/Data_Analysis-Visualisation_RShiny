
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    output$SummaryA1 <- renderPrint({
        skimr::skim(data_frame_car)
    })
    
    output$SummaryA2 <- renderPrint({
        summary(data_frame_car)
    })



    output$car_table <- DT::renderDataTable({
        DT::datatable(data = data_frame_car)
    })
    # 
    output$Missing <- renderPlot({
        vis_miss(data_frame_car, cluster = input$cluster) +
            labs(title = "Missingness of car data")
    })

    output$Corrgram <- renderPlot({
        corrgram(data_frame_car,
                 order = input$Group,
                 abs = input$abs,
                 cor.method = input$CorrMeth,
                 text.panel = panel.txt,
                 main = "Correlation of car data")
    })
    
    
    output$MixedPairs <- renderPlot({
        GGally::ggpairs(data = pairs_set,  
                        mapping = ggplot2::aes(colour = "rainbowl"), 
                        title = "Pairs of set1", progress = FALSE)
    })
    
    output$MixedPairs2 <- renderPlot({
        GGally::ggpairs(data = pairs_set2,  
                        mapping = ggplot2::aes(colour = "rainbowl"), 
                        title = "Pairs of set2", progress = FALSE)
    })
    
    output$MixedPairs3 <- renderPlot({
        GGally::ggpairs(data = pairs_set3,  
                        mapping = ggplot2::aes(colour = "rainbowl"), 
                        title = "Pairs of set3", progress = FALSE)
    })
    
    output$MixedPairs4 <- renderPlot({
        GGally::ggpairs(data = pairs_set4,  
                        mapping = ggplot2::aes(colour = "rainbowl"), 
                        title = "Pairs of set4", progress = FALSE)
    })

    output$Boxplot <- renderPlot({
        data <- data_frame_car[,c(1,15:44)]
        data <- scale(data, center = input$standardise, scale = input$standardise)
        car::Boxplot(formula =~., data = data, use.cols = TRUE, notch = FALSE, varwidth = FALSE,
                horizontal = FALSE, outline = input$outliers, ylab = NA,las = 2,
                col = brewer.pal(n = dim(data_frame_car)[2], name = "RdBu"),
                range = input$range, main = "Boxplots of car data",
                id = list(n=Inf, location="avoid"))
    })
    

    output$RisingValue <- renderPlot({
        d<-data_frame_car[,input$rising]
        for (col in 1:ncol(d)) {
            d[,col] <- d[order(d[,col]),col] #sort each column in ascending order
        }
        d <- scale(x = d, scale = TRUE)  # scale so they can be graphed with a shared Y axis
        mypalette <- rainbow(ncol(d))
        matplot(x = seq(1, 100, length.out = nrow(d)), y = d, type = "l", xlab = "Percentile", ylab = "Values", lty = 1, lwd = 1, col = mypalette, main = "Rising value chart")
        legend(legend = colnames(d), x = "topleft", y = "top", lty = 1, lwd = 1, col = mypalette, ncol = round(ncol(d)^0.3))
     })
    
    
    output$Mosaic <- renderPlot({
        formula <- as.formula(paste("~",paste(input$Mosaic, collapse = " + ")))
        vcd::mosaic(formula, data = data_frame_car,
                    main = "Any common or uncommon", shade = TRUE, legend = TRUE)
    })
    
    

})
