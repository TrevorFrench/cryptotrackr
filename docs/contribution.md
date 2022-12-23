# Contribution Guide

## Adding a Function

1.  Function should be added to it's respective exchange file

2.  Functions should be structured as follows:

    ``` r
    #-------------------------------------------------------------------------------
    #------------------------------PLAIN TEXT DESCRIPTION---------------------------
    #-------------------------------------------------------------------------------
    #' function_name
    #'
    #' @param param_name all parameters declared and described
    #' @param param_name all parameters declared and described
    #'
    #' @return a description of what is returned by the function
    #' @export
    #'
    #' @examples
    #' \dontrun{
    #' an example of how one might use the function}

    function_name <- function() {
    }
    ```

3.  Each function should then be recorded in the respective doc file and structured as follows:

    ### function_name(param_name, param_name)

    -   Description of what function returns.

    -   param_name: description of parameter

    -   param_name: description of parameter

    -   Description of the following function example.

    ``` r
    example <- function_name(param_name, param_name)
    ```

## Helpful Tips/Resources

You can learn more about package authoring with RStudio at:

<http://r-pkgs.had.co.nz/>

Some useful keyboard shortcuts for package authoring:

Install Package: 'Ctrl + Shift + B'

Check Package: 'Ctrl + Shift + E'

Test Package: 'Ctrl + Shift + T'

Document Functions: 'devtools::document()'

-   <https://tinyheero.github.io/jekyll/update/2015/07/26/making-your-first-R-package.html>
-   <https://web.mit.edu/insong/www/pdf/rpackage_instructions.pdf>
