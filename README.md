qdap
====

[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Build Status](https://travis-ci.org/trinker/qdap.svg?branch=master)](https://travis-ci.org/trinker/qdap) [![DOI](https://zenodo.org/badge/5398/trinker/qdap.svg)](http://dx.doi.org/10.5281/zenodo.11124)
[![Version](https://img.shields.io/badge/Version-2.2.1-orange.svg)](https://img.shields.io/badge/Version-2.2.1-orange.svg)

![qdapicon](https://dl.dropbox.com/u/61803503/qdapicon.png)   
[qdap](http://trinker.github.com/qdap_dev/) (Quantitative Discourse Analysis Package) is an R package designed to assist in quantitative discourse analysis.  The package stands as a bridge between qualitative transcripts of dialogue and statistical analysis & visualization.

## Installation

To download the development version of qdap:

Download the [zip ball](https://github.com/trinker/qdap/zipball/master) or [tar ball](https://github.com/trinker/qdap/tarball/master), decompress and run `R CMD INSTALL` on it, or use the **pacman** package to install the development version (The user may want to install the [dev version of reports](https://github.com/trinker/reports) first):


```r
if (!require("pacman")) install.packages("pacman")
pacman::p_load_gh(
    "trinker/qdapDictionaries",
    "trinker/qdapRegex",
    "trinker/qdapTools",
    "trinker/qdap"
)
```

**Note**: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](http://CRAN.R-project.org/package=devtools) to install this way.

**Note**: Mac users might be required to install the appropriate version [XTools](https://developer.apple.com/xcode/) from the [Apple Developer site](https://developer.apple.com/) in order to install the development version.  You may need to [register as an Apple developer](https://developer.apple.com/programs/register/).  An older version of XTools may also be required.

## Help

- [Web Page](http://trinker.github.com/qdap/) 
- Vignettes:     
  - [HTML Vignette: Introduction to qdap](http://trinker.github.io/qdap/vignettes/qdap_vignette.html)        
  - [PDF Vignette: qdap-tm Package Compatibility](http://trinker.github.io/qdap/vignettes/tm_package_compatibility.pdf)   
  - [PDF Vignette: Cleaning Text & Debugging](http://trinker.github.io/qdap_dev/vignettes/cleaning_and_debugging.pdf)      
- [Package PDF Help Manual](https://dl.dropbox.com/u/61803503/qdap.pdf)

## Contact

You are welcome to:
* submit suggestions and bug-reports at: <https://github.com/trinker/qdap/issues>
* send a pull request on: <https://github.com/trinker/qdap/>
* compose a friendly e-mail to: <tyler.rinker@gmail.com>

*<b>Note:</b> If you are reporting a bug make sure you have first read the [Cleaning Text & Debugging vignette](http://trinker.github.io/qdap_dev/vignettes/cleaning_and_debugging.pdf)*
