function(input, output) {
  # --- Menu Info ---
  # Modal
  observeEvent(input$show, {
    showModal(modalDialog(
      title = "Info Data",
      p("Source: https://www.kaggle.com/lava18/google-play-store-apps"),
      h4("Plot 1"),
      p("Ingin tahu kategori apa yang di install banyak users dengan rating tertinggi tapi size nya kecil"),
      easyClose = TRUE,
      footer = NULL
    ))
  })
  
  # Datatable Google Playstore
  output$dt_gp <- renderDataTable({
    datatable(gp, options = list(
      scrollX = T, 
      pageLength = 5,
      lengthMenu = c(5, 10, 15, 20)
    )
    )
  })
  
  # --- Menu Plotting ---
  # Plot 1
  # Ingin tahu kategori apa yang di install banyak users dengan rating tertinggi
  output$plot_1 <- renderPlotly({
    
    plot1 <- ggplot(gp_fresh, aes(x = Rating, 
                                  y = Installs)) +
      geom_point(aes(col = Genres)) +
      #geom_smooth(method = "auto") +
      labs(x = "Rating",
           y = "Installs",
           title = "Plot 1") +
      scale_color_brewer(palette = "Set3") +
      theme(legend.position = "none") +
      theme_dark() 
    ggplotly(plot1)
  })
}