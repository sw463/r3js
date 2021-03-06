
# r3js

This is the project directory for the r3js, a package to provide R and javascript functions to allow WebGL-based 3D plotting in R using the three.js javascript library. Simple interactivity through roll-over highlighting and toggle buttons is also supported.

Plots are built as html widgets, using the RStudio viewer panel to display the plots interactively. Plots can also be exported using the functions provided in the htmlwidgets package.

## Installation

Dowload the latest release from github:

```R
devtools::install_github("shwilks/r3js")
```


## Example usage

Generally, r3js works by generating an object containing the plotting data and then continuously updating it as new features are added to the plot (similar to plotly).  For a simple 3D scatterplot however, the `plot3js` function handles all of the plotting setup for you. Plotting syntax is intended to be similar to the base plotting functions in R, and that used in the RGL package.


```R
# Generate and view a simple 3D scatterplot
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x, y)
  
plot3js(x, y, z, col = rainbow(1000))
```


You can also build up a plot step by step using the lower level functions for initiating 3D plots:

```R
# Generate data
x <- runif(20, 0, 10)
y <- runif(20, 0, 20)
z <- runif(20, 0, 1)

# Initialise new plot
data3js <- plot3js.new()

# Set plot dimensions and aspect ratios
data3js <- plot3js.window(
  data3js,
  xlim = c(0,10),
  ylim = c(0,20),
  zlim = c(0,1),
  aspect = c(0.5,1,0.5)
)

# Add box
data3js <- box3js(data3js, col = "grey50")

# Add axes
data3js <- axis3js(data3js, side = "x")
data3js <- axis3js(data3js, side = "y")
data3js <- axis3js(data3js, side = "z")

# Add axes grids
data3js <- grid3js(data3js, col = "grey80")

# Plot points
data3js <- points3js(data3js, x, y, z, col = rainbow(20))

# Show the plot
r3js(data3js)
```

## Interactivity
Several ways to add interactivity to plots are currently supported, namely labels, highlighting on rollover and toggle buttons.

### Labels
Labels can be added simply by providing a string or string vector as input to the plotting function for the `label` argument:

```R
plot3js(
  x = runif(100),
  y = runif(100),
  z = runif(100),
  col = rainbow(100),
  label = paste("Point", 1:100)
)
```


### Rollover highlighting
Features of a plotted object can be programmed to change upon rollover simply by passing the arguments you wish to update on 
rollover as a list to the `highlight` argument:

```R
plot3js(
  x = runif(100),
  y = runif(100),
  z = runif(100),
  col = rainbow(100),
  highlight = list(
    size = 1.5,
    col = rev(rainbow(100)),
    mat = "basic"
  )
)
```


### Toggle buttons
To associate an object with a toggle button simply pass the desired toggle label to the `toggle` argument:

```R
x <- runif(100)
y <- runif(100)
z <- runif(100)

col <- c(
  rep("blue", 50),
  rep("red", 50)
)

toggle <- paste(col, "points")

plot3js(
  x = x,
  y = y,
  z = z,
  col = col,
  toggle = toggle
)
```
