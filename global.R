#Library
library(shiny)
library(shinydashboard)
library(tidyverse)
library(plotly)
library(glue)
library(DT)
library(ggplot2)

#Fresh Data
gp <- read.csv("data/googleplaystore.csv")

# Hapus NA yang ada di rating
gp_fresh <- gp %>% 
  filter(Rating <= 5.0)%>% 
  drop_na(Rating)