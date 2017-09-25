
# This file is a generated template, your changes will not be overwritten

qqplotClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "qqplotClass",
    inherit = qqplotBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
          
          if ( ! is.null(self$options$var)){ # check for var before running analysis
          
          qqvar <- self$data[,self$options$var] # data to examine
          qqdata <- qqnorm(qqvar, plot.it=FALSE) # x & y coords
          plotData <- data.frame(x=qqdata$x, y=qqdata$y) # assembl DF for plotting
          
          image <- self$results$plot #set up for plotting
          image$setState(plotData)
          } 
        },
    
    .plot=function(image, ...) {  # <-- the plot function
      
      plotData <- image$state # grab data
      if ( ! is.null(image$state)){
      # create plot
      qqpl <- ggplot(plotData, aes(x,y)) + geom_point() + labs(x='Theoretical Quantiles', y='Actual Quantiles', title=paste('Q-Q Normal Plot:', self$options$var, sep=' '))
      
      print(qqpl)
      TRUE
      }
        })
)
