##################################################################################
library(shiny)
library(ChemmineR)
library(ggplot2)
#################################################################################
load("YAWYE_sdfset.rda")
load("YAWYE_fpset.rda")
YAWYE<-read.table("YAWYE.csv", sep=",", header=T)
attach(YAWYE)
################################################
shinyServer(function(input,output){
#################################################
################################################
output$compound_matrixB<-renderPlot({
fpset<-fpset[names(fpSim(fpset[input$cmp_view], fpset, method="Tanimoto", cutoff=input$vote, top=input$hits))]
sdfset<-sdfset[cid(sdfset)%in%cid(fpset)]
plot(sdfset[1:input$hits], print_cid=cid(sdfset[1:input$hits]), print=TRUE)
})
#################################################
#output$YAWYE_out<-renderPrint({
#YAWYE<-YAWYE[,2]
#print(YAWYE[input$choice]) 
#})
#################################################
#output$pie_chart<-renderPlot({
#(pie <- ggplot(YAWYE[input$choice,], aes(x = factor(1), fill =factor(ffff))) + geom_bar(width = 1))
#plot(pie + coord_polar(theta = "y"))
#})
#################################################
})
###################################################################################

