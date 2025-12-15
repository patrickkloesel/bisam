# ensure R uses your local library
.libPaths(c("/home/patrickk/R/x86_64-pc-linux-gnu-library/4.3", .libPaths()))

# remove loaded version if present
try(detach("package:mombf", unload = TRUE), silent = TRUE)

# correct local package directory (including nested folder)
pkg_dir <- "Functions/mombf_3.5.4/mombf"

# compile attributes if needed
Rcpp::compileAttributes(pkgdir = pkg_dir)

# install package from local folder
remotes::install_local(pkg_dir, force = TRUE, dependencies = FALSE)

# load it
library(mombf)

