
# This file is a generated template, your changes will not be overwritten

qqplotClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "qqplotClass",
    inherit = qqplotBase,
    private = list(
        .run = function() {

            # `self$data` contains the data
            # `self$options` contains the options
            # `self$results` contains the results object (to populate)
          
          qqvar <- self$data[,self$options$var]
          qqdata <- qqnorm(qqvar, plot.it=FALSE)
          plotData <- data.frame(x=qqdata$x, y=qqdata$y)

        },
    
    .plot=function(image, ...) {  # <-- the plot function
      
        })
)
