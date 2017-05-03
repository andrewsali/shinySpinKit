# shinySpinKit

A lightweight wrapper to use [SpinKit](http://tobiasahlin.com/spinkit/) loading animations from Shiny Outputs (e.g. plots, tables) in an automated fashion. Loading animations leverage on [Shiny JS events](https://shiny.rstudio.com/articles/js-events.html) and will show whilst the output value is 'out-of-date' (i.e. has been invalidated and the client hasn't received the new value).

You can use it for any type of shiny output, by wrapping the UI element with the `withSpinner` tag:

```
# load the library
library(shinySpinKit)

...

withSpinner(plotOutput("my_plot")) 
# if you have `%>%` loaded, you can do plotOutput("my_plot") %>% withSpinner()

...
```

## Installation

The package is not yet on CRAN, you can use the `devtools` package to install it from github directly:

```
devtools::install_github('andrewsali/shinySpinKit')
```
## Demo

To see how this works in action, you can run the example application from github directly:

```
shiny::runGitHub('andrewsali/shinySpinKit')
```
## Changing the spinner colour

You can specify a spinner colour for each output or set a variable globally. Alternatively you can use css to style the colours as well.

### Locally for each output

Just add `color` attribute to `withSpinner`:

```
plotOutput("my_plot") %>% withSpinner(color="rgb(100,100,100)")
```

### Globally

You can use `options(spinner.color="rgb(100,100,100)")` to set the global colour.

### Using CSS

See [here](https://github.com/Urigo/angular-spinkit/issues/10)
