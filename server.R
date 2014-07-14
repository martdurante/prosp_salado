ppnapp <- data.frame(PPNA=c(656,804,668,603,699,631,734,650,701),
                     feb=c(147,156.5,107.75,64.75,113,136,104.5,109.75,61.75),
                     mar=c(126.5,211.5,88.5,86,87.25,78.25,135,97.25,67))

shinyServer(
  function(input, output) {
      output$ppnaplot <- renderPlot({
        plot(c(1,2),c(500,1000),col=0,xaxt="n",ylab="Oct-Nov grassland productivity (kg/ha)",xlab="")
        # Prediction
        polygon(c(1.2,1.8,1.8,1.2),
               c(rep(predict(lm(PPNA~mar,data=ppnapp),data.frame(mar=input$pp),interval="predict",level=input$confint)[2],2),
                 rep(predict(lm(PPNA~mar,data=ppnapp),data.frame(mar=input$pp),interval="predict",level=input$confint)[3],2)),col="gray90")
        lines(c(1.2,1.8),rep(predict(lm(PPNA~mar,data=ppnapp),data.frame(mar=input$pp),interval="predict",level=input$confint)[1],2),lwd=2)
        # Historical Values        
        lines(c(0,3),rep(min(ppnapp$PPNA),2))
        text(1.05,min(ppnapp$PPNA),"Minimum",pos=3)
        lines(c(0,3),rep(mean(ppnapp$PPNA),2))
        text(1.05,mean(ppnapp$PPNA),"Mean",pos=3)
        lines(c(0,3),rep(max(ppnapp$PPNA),2))
        text(1.05,max(ppnapp$PPNA),"Maximum",pos=3)
    })
  }
)