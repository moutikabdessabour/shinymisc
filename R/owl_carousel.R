#' Title
#'
#' Description
#'
#' @import htmlwidgets
#'
#' @export
owl_carousel <- function(id, ...) {

  # tag <- htmltools::tags$div(id = id, class = "slider owl-carousel") %>%
  #   htmltools::tagAppendChildren(...)

  # dep_jquery <- htmlDependency(
  #   "jquery", "3.5.1", c("href" = "inst/htmlwidgets/jquery/"),
  #   script = "jquery.min.js"
  # )
  # style_css <- htmlDependency(
  #   "style", "1.0", c("href" = "inst/htmlwidgets/"),
  #   script = "style.css"
  # )
  #
  # tag <- attachDependencies(
  #   tag,
  #   dep_jquery
  # )

  tag <- htmltools::tags$div(
    id = id,
    class = "slider owl-carousel",
    ...
  )

  htmltools::tagList(
    tag,
    html_dependency_owlcarousel()
  )

  # htmlwidgets::createWidget(
  #   name = 'owl_carousel',
  #   tag,
  #   package = 'shinymisc'
  # )

}


# owl_carousel <- function(message, width = NULL, height = NULL, elementId = NULL) {
#
#   x = list(
#     message = message
#   )
#
#   htmlwidgets::createWidget(
#     name = 'owl_carousel',
#     x,
#     width = width,
#     height = height,
#     package = 'shinymisc',
#     elementId = elementId
#   )
# }











#' Shiny bindings for owl_carousel
#'
#' Output and render functions for using owl_carousel within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a owl_carousel
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name owl_carousel-shiny
#'
#' @export
owl_carouselOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'owl_carousel', width, height, package = 'shinymisc')
}

#' @rdname owl_carousel-shiny
#' @export
renderOwl_carousel <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, owl_carouselOutput, env, quoted = TRUE)
}
