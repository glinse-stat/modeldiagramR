## Test environments

*  local Windows 11 x64 install (x86_64-w64-mingw32): R 4.5.3  
*  local OS X install (Sequoia 15.7.5): R 4.5.0  
*  virtual HPC Linux install (Ubuntu 24.04.3 LTS): R 4.5.1  

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs.

## Checking Examples
Checking examples now takes 20.4s and R CMD check indicates this is OK. To make examples
run faster, some model diagrams are created for simplified models. Full
models are included but not tested. Exploratory data plots are also included
in the documentation for datasets but excluded from testing as the code
uses standard ggplot2 functions.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of modeldiagramR.
All packages that were available were checking passed except for:

-  webshot: with message "Package suggested but not available for checking"

## CRAN feedback
Per CRAN instructions, placed the 'DiagrammeR' package name in single quotes in 
the "Description" field of the DESCRIPTION file.

Addressed the additional CRAN feedback as listed in the "News.md" file.
