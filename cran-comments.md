## Test environments
???  local Windows 11 x64 install (x86_64-w64-mingw32): R 4.5.3
???  local OS X install (Sequoia 15.7.5): R 4.5.0
-  virtual HPC Linux install (Ubuntu 24.04.3 LTS): R 4.5.1

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs.

## Downstream dependencies
I have also run R CMD check on downstream dependencies of modeldiagramR.
All packages that were available were checking passed except for:

-  webshot: with message "Package suggested but not available for checking"
