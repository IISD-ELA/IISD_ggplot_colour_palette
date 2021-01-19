###################################################################
#################     IISD Colour Palettes  ######################
###################################################################

## Aproach modified from https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2


iisd_cols <- c(`navy_blue`    = "#083266", 
               `bright_blue`  = "#29c3ec",
               `orange_red`   = "#e1472e",
               `bright_orange`= "#f18820",
               `yellow`       = "#f7b43c",
               `bright_green` = "#97c848",
               `mint_green`   = "#5abc89",
               `deep_teal`    = "#074e63",
               `light_grey`   = "#ced0d0",
               `deep_grey`    = "#8e9192",
               `black`        = "#000000"
)


#' Function to extract iisd colours as hex codes
#'
#' @param ... Character names of iisd_colours 
#'

iisd_colours <- function(...){
 
  cols <- c(...)
  
  if (is.null(cols))
    return (iisd_cols)
  
  iisd_cols[cols]

}


iisd_pals <- list(
  `iisd_logo` = iisd_colours("navy_blue", "bright_blue"),
  `iisd_main` = iisd_colours("navy_blue", "bright_blue", "orange_red",
                             "bright_orange", "yellow", "bright_green",
                             "mint_green", "deep_teal"),
  `iisd_greyscale` = iisd_colours("black", "deep_grey", "light_grey"))


#' Return function to interpolate a iisd colour palette
#'
#' @param palette Character name of palette in iisd_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colourRampPalette()
#'

iisd_palettes <- function(palette = "iisd_main", reverse = FALSE, ...) {
    
  pal <- iisd_pals[[palette]]
  
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}
  

#' colour scale constructor for iisd colours
#'
#' @param palette Character name of palette in iisd_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_colour_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_colour_iisd <- function(palette = "iisd_main", discrete = TRUE, reverse = FALSE, ...) {
  
  pal <- iisd_palettes(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("iisd_", palette), palette = pal, ...)
  } else {
    scale_colour_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for iisd colours
#'
#' @param palette Character name of palette in iisd_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_iisd <- function(palette = "iisd_main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- iisd_palettes(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("iisd_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}