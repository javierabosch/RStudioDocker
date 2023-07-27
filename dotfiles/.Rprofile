options(prompt = "> ", continue = "  ")

.First <- function(){
    message("You are currently working in ", getwd())

    # additional display options
    options(
        dplyr.print_max = 100,
        scipen=99,
        digits=8,
        menu.graphics = FALSE
    )

    r <- getOption("repos")
    r["MRAN"] <- "https://packagemanager.posit.co/cran/2023-04-25"
    r <- r["MRAN"]
    options(repos = r)

}