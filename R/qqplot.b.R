
qqplotClass <- if (requireNamespace('jmvcore')) R6::R6Class(
    "qqplotClass",
    inherit = qqplotBase,
    private = list(
        #### run function ----
        .run = function() {
            
            if ( ! is.null(self$options$vars)) {
                
                data <- private$.cleanData()
                private$.prepareQQPlots(data)
                
            }
        },
        
        #### Plot function ----
        .prepareQQPlots = function(data) {
            
            vars <- self$options$vars
            images <- self$results$qqPlots
            
            for (var in vars) {
                
                image <- images$get(var)
                
                qqVar <- jmvcore::naOmit(data[[var]])   # Data to examine
                qqVar <- scale(qqVar)                   # Standardize values
                plotData <- data.frame(y=qqVar)         # Assemble DF for plotting
                
                image$setState(plotData)    
            }
        },
        .qqPlot = function(image, ggtheme, theme, ...) {
            
            if (is.null(image$state))
                return(FALSE)
            
            p <- ggplot(image$state) +
                geom_abline(slope=1, intercept=0, linetype=2, colour=theme$color[1]) +
                stat_qq(aes(sample=y), size=2, colour=theme$color[1]) +
                labs(x='Theoretical Quantiles', y='Standardized Sample Quantiles') +
                ggtheme # Adds the jamovi plot theme
            
            print(p)
            
            TRUE
        },
        
        #### Helper functions ----
        .cleanData = function() {
            
            vars <- self$options$vars

            data <- list()
            for (var in vars)
                data[[var]] <- jmvcore::toNumeric(self$data[[var]])
            
            attr(data, 'row.names') <- seq_len(length(data[[1]]))
            attr(data, 'class') <- 'data.frame'

            return(data)
        })
)
