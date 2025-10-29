# Launch Shiny Application
# This function launches the Shiny app included in this package.
# The app demonstrates basic data visualization capabilities.

# @return No return value, called for side effects
# @export
#
# @examples
# \dontrun{
# run_app()
# }
run_app <- function() {
  appDir <- system.file("shinyapp", package = "assignment4bsingh")
  if (appDir == "") {
    stop("Could not find app directory. Try re-installing the package.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}
