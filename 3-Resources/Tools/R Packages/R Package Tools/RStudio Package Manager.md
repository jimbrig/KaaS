---
Date: 2022-01-10
Author: Jimmy Briggs <jimmy.briggs@jimbrig.com>
Tags: ["#Type/Slipbox", "#Topic/Dev/R"]
Alias: ["RStudio Package Manager", "RSPM"]
---

# RStudio Package Manager

*Source: [RStudio Package Manager](https://packagemanager.rstudio.com/client/#/repos/1/overview)*

## Setup

See Also: [Quick Start Guide](https://packagemanager.rstudio.com/__docs__/admin/getting-started/user-interface-overview/#getting-frozen-urls-for-improving-reproducibility)

Before you begin, check to see if R is already configured to use this repository. Run `options('repos')` in an R console to identify where R will look for packages. If this doesn't show a URL to your RSPM instance, like `https://packagemanager.rstudio.com/all`, or if you'd like to change to a different snapshot, read on.

Use this URL to work with the latest source packages: <https://packagemanager.rstudio.com/all/latest>.

## Configuration

To configure R outside of RStudio, set the [`repos` option](http://stat.ethz.ch/R-manual/R-devel/library/base/html/options.html) in R to include the repository URL at the top of the page.

## Repository Setup Code

```R
options(repos = c(REPO_NAME = "https://packagemanager.rstudio.com/all/latest"))
```

We recommend adding this to your R startup file (`Rprofile.site` or `.Rprofile`) to maintain the configuration across R sessions. More information about managing R startup files is available in [this article](https://support.rstudio.com/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf).

## System Requirements

```bash
# rriskDistributions requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# RWebLogo requirements:
yum install -y python

# gdata requirements:
yum install -y perl

# DeducerText requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gbp requirements:
yum install -y make

# dataframes2xls requirements:
yum install -y python

# SBRect requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# ezknitr requirements:
yum install -y epel-release
yum install -y pandoc

# networkreporting requirements:
yum install -y make

# coxinterval requirements:
yum install -y make

# helloJavaWorld requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# skm requirements:
yum install -y make

# multibiplotGUI requirements:
yum install -y bwidget
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# tutorial requirements:
yum install -y epel-release
yum install -y pandoc

# forensim requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# Deducer requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# MDSGUI requirements:
yum install -y bwidget

# edeR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# PortfolioEffectHFT requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# minqa requirements:
yum install -y make

# simplexreg requirements:
yum install -y gsl-devel

# elexr requirements:
yum install -y python

# RFreak requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# Rdroolsjars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# BiBitR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# SBSA requirements:
yum install -y make

# RKEA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RNetLogo requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# collUtils requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# Plasmidprofiler requirements:
yum install -y epel-release
yum install -y pandoc

# PreKnitPostHTMLRender requirements:
yum install -y epel-release
yum install -y pandoc

# x.ent requirements:
yum install -y perl

# png requirements:
yum install -y libpng-devel

# PortfolioEffectEstim requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# coreNLP requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# planar requirements:
yum install -y make

# mallet requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# rJython requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# PhViD requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# DeducerSpatial requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# kerasR requirements:
yum install -y python

# cncaGUI requirements:
yum install -y bwidget
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# Rpoppler requirements:
yum install -y glib2-devel
yum install -y poppler-devel

# ABC.RAP requirements:
yum install -y make

# orQA requirements:
yum install -y make

# extraTrees requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# cycleRtools requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RNCBIEUtilsLibs requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# lightsout requirements:
yum install -y epel-release
yum install -y pandoc

# poisbinom requirements:
yum install -y fftw-devel

# subspace requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# DALY requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# tcltk2 requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# openNLPdata requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RSurvey requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# slowraker requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# specklestar requirements:
yum install -y fftw-devel

# rGroovy requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# mutossGUI requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# geno2proteo requirements:
yum install -y perl

# bartMachineJARs requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# corehunter requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RH2 requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# Rbgs requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RcppMeCab requirements:
yum install -y make

# designmatch requirements:
yum install -y epel-release
yum install -y glpk-devel

# redux requirements:
yum install -y epel-release
yum install -y hiredis-devel

# TAQMNGR requirements:
yum install -y zlib-devel

# idm requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# rtkore requirements:
yum install -y make

# ChoR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# rhli requirements:
yum install -y make

# genotypeR requirements:
yum install -y perl

# qualpalr requirements:
yum install -y make

# GreedyExperimentalDesignJARs requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# ADMMsigma requirements:
yum install -y make

# SCPME requirements:
yum install -y make

# rJPSGCS requirements:
yum install -y java-1.8.0-openjdk-devel
yum install -y zlib-devel
R CMD javareconf

# libstableR requirements:
yum install -y gsl-devel

# CommonJavaJars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# beanz requirements:
yum install -y make

# readbitmap requirements:
yum install -y libjpeg-turbo-devel
yum install -y libpng-devel

# blandr requirements:
yum install -y epel-release
yum install -y pandoc

# DeLorean requirements:
yum install -y make

# pysd2r requirements:
yum install -y epel-release
yum install -y python34

# RMOAjars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# ssMousetrack requirements:
yum install -y make

# sequenza requirements:
yum install -y epel-release
yum install -y pandoc

# Rlda requirements:
yum install -y make

# RPyGeo requirements:
yum install -y python

# ruta requirements:
yum install -y python

# rchie requirements:
yum install -y epel-release
yum install -y v8-devel

# Rglpk requirements:
yum install -y epel-release
yum install -y glpk-devel

# metaMix requirements:
yum install -y openmpi-devel

# MADPop requirements:
yum install -y make

# dfpk requirements:
yum install -y make

# r.blip requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# NestedCategBayesImpute requirements:
yum install -y make

# CPAT requirements:
yum install -y make

# aphid requirements:
yum install -y make

# Scalelink requirements:
yum install -y make

# PBSmodelling requirements:
yum install -y bwidget

# StMoSim requirements:
yum install -y make

# rPref requirements:
yum install -y make

# represtools requirements:
yum install -y make

# igate requirements:
yum install -y epel-release
yum install -y pandoc

# otsad requirements:
yum install -y epel-release
yum install -y python
yum install -y python34

# visit requirements:
yum install -y make

# LeafArea requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# MixAll requirements:
yum install -y make

# Rlgt requirements:
yum install -y make

# cloudml requirements:
yum install -y python

# biplotbootGUI requirements:
yum install -y bwidget
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# OpenStreetMap requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# rCBA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# jSDM requirements:
yum install -y gsl-devel

# libsoc requirements:
yum install -y libxml2-devel

# openNLP requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RWekajars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# greta requirements:
yum install -y python

# ggExtra requirements:
yum install -y epel-release
yum install -y pandoc

# RKEAjars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# nbconvertR requirements:
yum install -y epel-release
yum install -y pandoc
yum install -y python

# BayesVarSel requirements:
yum install -y gsl-devel

# YPPE requirements:
yum install -y make

# dtwclust requirements:
yum install -y make

# publipha requirements:
yum install -y make

# ced requirements:
yum install -y make

# rDEA requirements:
yum install -y epel-release
yum install -y glpk-devel

# conStruct requirements:
yum install -y make

# scaffolder requirements:
yum install -y python

# kza requirements:
yum install -y fftw-devel

# chebpol requirements:
yum install -y fftw-devel
yum install -y gsl-devel

# disaggregation requirements:
yum install -y make

# registr requirements:
yum install -y make

# cppRouting requirements:
yum install -y make

# easyNCDF requirements:
yum install -y epel-release
yum install -y netcdf-devel

# GRANBase requirements:
yum install -y git

# PopGenome requirements:
yum install -y zlib-devel

# ndjson requirements:
yum install -y zlib-devel

# matchingMarkets requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# botor requirements:
yum install -y python

# REPLesentR requirements:
yum install -y epel-release
yum install -y pandoc

# SGP requirements:
yum install -y texlive

# qmix requirements:
yum install -y make

# LCMCR requirements:
yum install -y gsl-devel

# rblt requirements:
yum install -y epel-release
yum install -y hdf5-devel

# RJSDMX requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# rpostgis requirements:
yum install -y postgresql-devel

# webshot requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# bfw requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gdalUtils requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal

# rapidjsonr requirements:
yum install -y make

# pandocfilters requirements:
yum install -y epel-release
yum install -y pandoc

# Orcs requirements:
yum install -y make

# pdSpecEst requirements:
yum install -y make

# rsparkling requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# dti requirements:
yum install -y gsl-devel

# spsurv requirements:
yum install -y make

# tsmp requirements:
yum install -y make

# oceanmap requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# meltt requirements:
yum install -y python

# irace requirements:
yum install -y make

# rscala requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# moveVis requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# gMCP requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# conflr requirements:
yum install -y epel-release
yum install -y pandoc

# reproj requirements:
yum install -y epel-release
yum install -y proj-devel
yum install -y proj-epsg

# switchr requirements:
yum install -y git

# patternplot requirements:
yum install -y make

# osmose requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# concaveman requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# blastula requirements:
yum install -y epel-release
yum install -y pandoc

# glmulti requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# DCPO requirements:
yum install -y make

# bioimagetools requirements:
yum install -y fftw-devel
yum install -y libcurl-devel
yum install -y libtiff-devel
yum install -y openssl-devel

# CausalQueries requirements:
yum install -y make

# texreg requirements:
yum install -y epel-release
yum install -y texlive
yum install -y pandoc

# pdfminer requirements:
yum install -y python

# bellreg requirements:
yum install -y make

# bigMap requirements:
yum install -y make

# YPBP requirements:
yum install -y make

# uavRmp requirements:
yum install -y make

# rstantools requirements:
yum install -y epel-release
yum install -y pandoc

# DNAtools requirements:
yum install -y make

# glmmfields requirements:
yum install -y make

# roll requirements:
yum install -y make

# breathteststan requirements:
yum install -y make

# MUACz requirements:
yum install -y make

# rstanarm requirements:
yum install -y epel-release
yum install -y make
yum install -y pandoc-citeproc
yum install -y pandoc

# camtrapR requirements:
yum install -y epel-release
yum install -y perl-Image-ExifTool

# image.CannyEdges requirements:
yum install -y fftw-devel
yum install -y libpng-devel

# modeLLtest requirements:
yum install -y make

# bsem requirements:
yum install -y make

# microclass requirements:
yum install -y make

# MaOEA requirements:
yum install -y python

# IOHexperimenter requirements:
yum install -y make

# uchardet requirements:
yum install -y make

# RODBC requirements:
yum install -y unixODBC-devel

# XML requirements:
yum install -y libxml2-devel

# hadron requirements:
yum install -y gsl-devel

# inlmisc requirements:
yum install -y epel-release
yum install -y pandoc

# arrangements requirements:
yum install -y gmp-devel

# rdataretriever requirements:
yum install -y python

# FLSSS requirements:
yum install -y make

# tables requirements:
yum install -y epel-release
yum install -y pandoc

# rmdcev requirements:
yum install -y make

# devEMF requirements:
yum install -y freetype-devel
yum install -y libXft-devel
yum install -y zlib-devel

# rjdmarkdown requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# HDPenReg requirements:
yum install -y make

# SAR requirements:
yum install -y make

# rTorch requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc
yum install -y python

# cbq requirements:
yum install -y make

# cleanNLP requirements:
yum install -y python

# MrSGUIDE requirements:
yum install -y make

# trialr requirements:
yum install -y make

# BeastJar requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# kantorovich requirements:
yum install -y gmp-devel

# milr requirements:
yum install -y make

# JavaGD requirements:
yum install -y make
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# FlexReg requirements:
yum install -y make

# colorizer requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# sudachir requirements:
yum install -y python

# xlsx requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# varitas requirements:
yum install -y perl

# bayesGAM requirements:
yum install -y make

# GWnnegPCA requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# potential requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# qCBA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# mwa requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# rstanemax requirements:
yum install -y make

# rmdfiltr requirements:
yum install -y epel-release
yum install -y pandoc

# mRpostman requirements:
yum install -y libcurl-devel
yum install -y openssl-devel

# ggdemetra requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# streamMOA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# wordnet requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gitcreds requirements:
yum install -y git

# dynBiplotGUI requirements:
yum install -y make

# GreedyExperimentalDesign requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# loo requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc

# bpcs requirements:
yum install -y make

# coveffectsplot requirements:
yum install -y epel-release
yum install -y pandoc

# motifr requirements:
yum install -y python

# text requirements:
yum install -y python

# GetoptLong requirements:
yum install -y perl

# DataExplorer requirements:
yum install -y epel-release
yum install -y pandoc

# bartMachine requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# StanHeaders requirements:
yum install -y epel-release
yum install -y pandoc

# gdtools requirements:
yum install -y cairo-devel
yum install -y fontconfig-devel
yum install -y freetype-devel

# FFD requirements:
yum install -y bwidget

# frequency requirements:
yum install -y epel-release
yum install -y pandoc

# adimpro requirements:
yum install -y dcraw
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# neptune requirements:
yum install -y python

# RcppBigIntAlgos requirements:
yum install -y gmp-devel

# prettydoc requirements:
yum install -y epel-release
yum install -y pandoc

# staplr requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# GeneralizedUmatrix requirements:
yum install -y epel-release
yum install -y pandoc

# NACHO requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc

# altair requirements:
yum install -y python

# ECOSolveR requirements:
yum install -y make

# rubias requirements:
yum install -y make

# extRatum requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# feamiR requirements:
yum install -y python

# causact requirements:
yum install -y python

# proj4 requirements:
yum install -y epel-release
yum install -y proj-devel
yum install -y proj-epsg

# idem requirements:
yum install -y make

# topicmodels requirements:
yum install -y gsl-devel

# rTRNG requirements:
yum install -y make

# EvidenceSynthesis requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# worcs requirements:
yum install -y epel-release
yum install -y pandoc

# Crossover requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# survHE requirements:
yum install -y make

# mfbvar requirements:
yum install -y make

# SymbolicDeterminants requirements:
yum install -y gmp-devel

# ech requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# shinyloadtest requirements:
yum install -y epel-release
yum install -y pandoc

# PoolTestR requirements:
yum install -y make

# metagear requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# rkeops requirements:
yum install -y cmake

# svglite requirements:
yum install -y libpng-devel

# CBSr requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# tiler requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y python

# MIRES requirements:
yum install -y make

# mlr requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y mesa-libGLU-devel
yum install -y gmp-devel
yum install -y gsl-devel
yum install -y mpfr-devel
yum install -y openmpi-devel
yum install -y proj-devel
yum install -y proj-epsg

# Boom requirements:
yum install -y make

# multibridge requirements:
yum install -y make
yum install -y mpfr-devel

# rsubgroup requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# spatsoc requirements:
yum install -y epel-release
yum install -y geos-devel

# rmsb requirements:
yum install -y make

# PRIMME requirements:
yum install -y make

# scModels requirements:
yum install -y gmp-devel
yum install -y mpfr-devel

# RPushbullet requirements:
yum install -y which
[ $(which google-chrome) ] || curl -fsSL -o /tmp/google-chrome.rpm https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
[ $(which google-chrome) ] || yum install -y /tmp/google-chrome.rpm
rm -f /tmp/google-chrome.rpm

# fftwtools requirements:
yum install -y fftw-devel

# forImage requirements:
yum install -y python

# phonfieldwork requirements:
yum install -y epel-release
yum install -y pandoc

# ondisc requirements:
yum install -y make

# CTD requirements:
yum install -y gmp-devel

# rchallenge requirements:
yum install -y epel-release
yum install -y pandoc

# gastempt requirements:
yum install -y make

# govdown requirements:
yum install -y epel-release
yum install -y pandoc

# LMMELSM requirements:
yum install -y make

# pkgnews requirements:
yum install -y epel-release
yum install -y pandoc

# metaBMA requirements:
yum install -y make

# DataPackageR requirements:
yum install -y epel-release
yum install -y pandoc

# multinma requirements:
yum install -y make

# baseflow requirements:
yum install -y epel-release
yum install -y make
yum install -y rust
yum install -y cargo

# exifr requirements:
yum install -y perl

# r2pmml requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# plumberDeploy requirements:
yum install -y libssh2-devel

# drf requirements:
yum install -y make

# prophet requirements:
yum install -y make

# HierDpart requirements:
yum install -y make

# WriteXLS requirements:
yum install -y perl

# ProcData requirements:
yum install -y python

# brinton requirements:
yum install -y epel-release
yum install -y pandoc

# sasfunclust requirements:
yum install -y make

# modeltime.h2o requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# bmggum requirements:
yum install -y make

# rapport requirements:
yum install -y epel-release
yum install -y pandoc

# AWR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# mixture requirements:
yum install -y gsl-devel

# quantdr requirements:
yum install -y make

# breathtestcore requirements:
yum install -y epel-release
yum install -y pandoc

# foieGras requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y pandoc
yum install -y proj-devel
yum install -y proj-epsg

# gifski requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# pivmet requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc

# juicr requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# TCIU requirements:
yum install -y make

# rsvg requirements:
yum install -y librsvg2-devel

# ssh requirements:
yum install -y libssh2-devel

# hBayesDM requirements:
yum install -y make

# rzmq requirements:
yum install -y epel-release
yum install -y zeromq-devel

# strm requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# xslt requirements:
yum install -y libxslt-devel

# pdftools requirements:
yum install -y poppler-devel

# ropenblas requirements:
yum install -y make

# RGF requirements:
yum install -y python

# sass requirements:
yum install -y make

# rviewgraph requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# detrendr requirements:
yum install -y make

# RKEEL requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# cubature requirements:
yum install -y make

# huxtable requirements:
yum install -y texlive

# h2o4gpu requirements:
yum install -y python

# markovchain requirements:
yum install -y make

# lamW requirements:
yum install -y make

# ClusterR requirements:
yum install -y fftw-devel

# dialr requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# cit requirements:
yum install -y gsl-devel

# bayesZIB requirements:
yum install -y make

# unmarked requirements:
yum install -y make

# RcppAlgos requirements:
yum install -y gmp-devel

# autocart requirements:
yum install -y make

# GMKMcharlie requirements:
yum install -y make

# HiClimR requirements:
yum install -y epel-release
yum install -y netcdf-devel

# rapidraker requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# ip2location requirements:
yum install -y python

# flan requirements:
yum install -y gsl-devel

# BivRec requirements:
yum install -y make

# mapview requirements:
yum install -y make

# entropart requirements:
yum install -y epel-release
yum install -y pandoc

# mbbefd requirements:
yum install -y make

# units requirements:
yum install -y epel-release
yum install -y udunits2-devel

# seqinr requirements:
yum install -y zlib-devel

# nucim requirements:
yum install -y fftw-devel
yum install -y libcurl-devel
yum install -y libtiff-devel
yum install -y openssl-devel

# BINtools requirements:
yum install -y make

# crandep requirements:
yum install -y epel-release
yum install -y pandoc

# pander requirements:
yum install -y epel-release
yum install -y pandoc

# diversitree requirements:
yum install -y fftw-devel
yum install -y gsl-devel

# bayesplot requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc

# rextendr requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# bayesforecast requirements:
yum install -y make

# GGally requirements:
yum install -y openssl-devel

# ggquickeda requirements:
yum install -y epel-release
yum install -y pandoc

# curl requirements:
yum install -y libcurl-devel
yum install -y openssl-devel

# bdpar requirements:
yum install -y python

# RcppRedis requirements:
yum install -y epel-release
yum install -y hiredis-devel

# sen2r requirements:
yum install -y epel-release
yum install -y cairo-devel
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y libxml2-devel
yum install -y netcdf-devel
yum install -y openssl-devel
yum install -y proj-devel
yum install -y proj-epsg
yum install -y v8-devel

# tkRplotR requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# textmineR requirements:
yum install -y make

# ijtiff requirements:
yum install -y libjpeg-turbo-devel
yum install -y libtiff-devel
yum install -y zlib-devel

# ROpenCVLite requirements:
yum install -y cmake

# caracas requirements:
yum install -y python

# hpa requirements:
yum install -y make

# jackalope requirements:
yum install -y make

# FCPS requirements:
yum install -y epel-release
yum install -y pandoc

# sdmApp requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# smam requirements:
yum install -y make
yum install -y gsl-devel

# textrecipes requirements:
yum install -y make

# DA requirements:
yum install -y make

# magickGUI requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# rater requirements:
yum install -y make

# grf requirements:
yum install -y make

# seewave requirements:
yum install -y libsndfile-devel

# iMRMC requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# SDMtune requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# bayesbr requirements:
yum install -y make

# PlanetNICFI requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal

# AovBay requirements:
yum install -y make

# MetaStan requirements:
yum install -y make

# jpeg requirements:
yum install -y libjpeg-turbo-devel

# OpenCL requirements:
yum install -y epel-release
yum install -y ocl-icd
yum install -y opencl-headers

# ctsem requirements:
yum install -y make

# PoissonBinomial requirements:
yum install -y fftw-devel

# ergm requirements:
yum install -y openmpi-devel

# tidysq requirements:
yum install -y make

# blockcluster requirements:
yum install -y make

# findInGit requirements:
yum install -y git

# cld3 requirements:
yum install -y protobuf-devel
yum install -y protobuf-compiler

# protolite requirements:
yum install -y protobuf-devel
yum install -y protobuf-compiler

# fRLR requirements:
yum install -y gsl-devel

# haven requirements:
yum install -y make
yum install -y zlib-devel

# InSilicoVA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# reprex requirements:
yum install -y epel-release
yum install -y pandoc

# excerptr requirements:
yum install -y python

# concatipede requirements:
yum install -y make

# reportfactory requirements:
yum install -y epel-release
yum install -y pandoc

# sysfonts requirements:
yum install -y freetype-devel
yum install -y libpng-devel
yum install -y zlib-devel

# showtext requirements:
yum install -y freetype-devel
yum install -y libpng-devel
yum install -y zlib-devel

# rmumps requirements:
yum install -y make

# caviarpd requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# geouy requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# websocket requirements:
yum install -y make
yum install -y openssl-devel

# sentometrics requirements:
yum install -y make

# magick requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel

# ip2proxy requirements:
yum install -y python

# densEstBayes requirements:
yum install -y make

# RNetCDF requirements:
yum install -y epel-release
yum install -y netcdf-devel
yum install -y udunits2-devel

# dbmss requirements:
yum install -y epel-release
yum install -y make
yum install -y pandoc

# bridger requirements:
yum install -y texlive

# ubiquity requirements:
yum install -y perl

# OpenMx requirements:
yum install -y make

# arulesNBMiner requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# fishflux requirements:
yum install -y make

# ecochange requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal

# CNVRG requirements:
yum install -y make

# bookdown requirements:
yum install -y epel-release
yum install -y pandoc

# link2GI requirements:
yum install -y make

# fuzzywuzzyR requirements:
yum install -y python

# OpenImageR requirements:
yum install -y fftw-devel
yum install -y libjpeg-turbo-devel
yum install -y libpng-devel

# nmslibR requirements:
yum install -y epel-release
yum install -y python34

# GeoMongo requirements:
yum install -y python

# walker requirements:
yum install -y make

# R2SWF requirements:
yum install -y freetype-devel
yum install -y libpng-devel
yum install -y zlib-devel

# strawr requirements:
yum install -y libcurl-devel
yum install -y openssl-devel

# rmarkdown requirements:
yum install -y epel-release
yum install -y pandoc

# rmBayes requirements:
yum install -y make

# hsstan requirements:
yum install -y make

# OncoBayes2 requirements:
yum install -y epel-release
yum install -y make
yum install -y pandoc-citeproc
yum install -y pandoc

# RODBC requirements:
yum install -y unixODBC-devel

# rbioacc requirements:
yum install -y make

# rmcfs requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# XML requirements:
yum install -y libxml2-devel

# RCurl requirements:
yum install -y make
yum install -y libcurl-devel

# SimInf requirements:
yum install -y gsl-devel

# reticulate requirements:
yum install -y python

# httpgd requirements:
yum install -y cairo-devel
yum install -y fontconfig-devel
yum install -y freetype-devel
yum install -y libpng-devel

# nlrx requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y java-1.8.0-openjdk-devel
yum install -y libxml2-devel
yum install -y openssl-devel
yum install -y pandoc
yum install -y proj-devel
yum install -y proj-epsg
yum install -y udunits2-devel
R CMD javareconf

# glmmTMB requirements:
yum install -y make

# specmine requirements:
yum install -y python

# DesignCTPB requirements:
yum install -y openssl-devel

# clinUtils requirements:
yum install -y epel-release
yum install -y pandoc

# orderly requirements:
yum install -y git

# IncDTW requirements:
yum install -y make

# lgpr requirements:
yum install -y make

# pcFactorStan requirements:
yum install -y make

# thurstonianIRT requirements:
yum install -y make

# trackdem requirements:
yum install -y epel-release
yum install -y perl-Image-ExifTool
yum install -y python

# catSurv requirements:
yum install -y make

# data.table requirements:
yum install -y zlib-devel

# Thermimage requirements:
yum install -y epel-release
yum install -y perl-Image-ExifTool
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel
yum install -y perl

# RMOA requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# bayes4psy requirements:
yum install -y make

# bistablehistory requirements:
yum install -y make

# inTextSummaryTable requirements:
yum install -y epel-release
yum install -y pandoc

# patientProfilesVis requirements:
yum install -y texlive

# bayesdfa requirements:
yum install -y make

# s2 requirements:
yum install -y openssl-devel

# bmlm requirements:
yum install -y make

# CoNI requirements:
yum install -y epel-release
yum install -y python34

# idiogramFISH requirements:
yum install -y epel-release
yum install -y pandoc

# XLConnect requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# mrbayes requirements:
yum install -y make

# clinDataReview requirements:
yum install -y epel-release
yum install -y pandoc

# TriDimRegression requirements:
yum install -y make

# redist requirements:
yum install -y gmp-devel
yum install -y libxml2-devel
yum install -y openmpi-devel
yum install -y python

# BayesSenMC requirements:
yum install -y make

# eggCounts requirements:
yum install -y make

# Rssa requirements:
yum install -y fftw-devel

# landsepi requirements:
yum install -y gsl-devel

# seqR requirements:
yum install -y make

# animation requirements:
yum install -y ImageMagick
yum install -y ImageMagick-c++-devel
yum install -y texlive

# lwgeom requirements:
yum install -y epel-release
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# Rlibeemd requirements:
yum install -y gsl-devel

# RcppGSL requirements:
yum install -y gsl-devel

# vapour requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y proj-devel
yum install -y proj-epsg

# RQuantLib requirements:
yum install -y epel-release
yum install -y QuantLib-devel

# coga requirements:
yum install -y gsl-devel

# VBLPCM requirements:
yum install -y gsl-devel

# StanMoMo requirements:
yum install -y make

# nimble requirements:
yum install -y make

# PandemicLP requirements:
yum install -y make

# ridge requirements:
yum install -y gsl-devel

# GWmodel requirements:
yum install -y make

# switchboard requirements:
yum install -y tcl
yum install -y tk
yum install -y tk-devel

# dataMaid requirements:
yum install -y epel-release
yum install -y git
yum install -y pandoc

# PReMiuM requirements:
yum install -y make

# dismo requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# survSNP requirements:
yum install -y gsl-devel

# saotd requirements:
yum install -y gsl-devel
yum install -y mpfr-devel

# textshaping requirements:
yum install -y freetype-devel
yum install -y fribidi-devel
yum install -y harfbuzz-devel

# systemfonts requirements:
yum install -y fontconfig-devel
yum install -y freetype-devel

# landmap requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# bioacoustics requirements:
yum install -y fftw-devel
yum install -y make

# dodgr requirements:
yum install -y make

# pharmr requirements:
yum install -y python

# MFPCA requirements:
yum install -y fftw-devel

# rminizinc requirements:
yum install -y epel-release
yum install -y pandoc

# rcdk requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# slasso requirements:
yum install -y make

# XBRL requirements:
yum install -y libxml2-devel

# econetwork requirements:
yum install -y gsl-devel

# digitalDLSorteR requirements:
yum install -y python

# SuperGauss requirements:
yum install -y fftw-devel

# BayesXsrc requirements:
yum install -y make

# rpf requirements:
yum install -y make

# rcbayes requirements:
yum install -y make

# epidemia requirements:
yum install -y make

# CoordinateCleaner requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal

# QF requirements:
yum install -y gsl-devel

# BrailleR requirements:
yum install -y python

# sodium requirements:
yum install -y epel-release
yum install -y libsodium-devel

# r5r requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# apcf requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel

# pRecipe requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y proj-devel
yum install -y proj-epsg

# rmatio requirements:
yum install -y zlib-devel

# Rmpfr requirements:
yum install -y gmp-devel
yum install -y mpfr-devel

# gwsem requirements:
yum install -y make

# mwaved requirements:
yum install -y fftw-devel

# glpkAPI requirements:
yum install -y epel-release
yum install -y glpk-devel

# bigGP requirements:
yum install -y openmpi-devel

# tsapp requirements:
yum install -y fftw-devel

# minidown requirements:
yum install -y epel-release
yum install -y pandoc

# pbdZMQ requirements:
yum install -y epel-release
yum install -y zeromq-devel

# webp requirements:
yum install -y libwebp-devel

# fftw requirements:
yum install -y fftw-devel

# gmp requirements:
yum install -y gmp-devel

# gsl requirements:
yum install -y gsl-devel

# PKI requirements:
yum install -y openssl-devel

# PTXQC requirements:
yum install -y epel-release
yum install -y pandoc

# datasailr requirements:
yum install -y make

# clustermq requirements:
yum install -y epel-release
yum install -y zeromq-devel

# tiff requirements:
yum install -y libjpeg-turbo-devel
yum install -y libtiff-devel

# jqr requirements:
yum install -y epel-release
yum install -y jq-devel

# BGVAR requirements:
yum install -y make

# pbdMPI requirements:
yum install -y openmpi-devel

# scs requirements:
yum install -y make

# mongolite requirements:
yum install -y openssl-devel
yum install -y cyrus-sasl-devel

# seqminer requirements:
yum install -y make
yum install -y zlib-devel

# rasciidoc requirements:
yum install -y python

# asbio requirements:
yum install -y bwidget

# hoopR requirements:
yum install -y epel-release
yum install -y pandoc-citeproc
yum install -y pandoc

# openCR requirements:
yum install -y make

# dataReporter requirements:
yum install -y epel-release
yum install -y git
yum install -y pandoc

# RJDemetra requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# PMCMRplus requirements:
yum install -y gmp-devel
yum install -y mpfr-devel

# memoiR requirements:
yum install -y epel-release
yum install -y pandoc

# autoharp requirements:
yum install -y epel-release
yum install -y pandoc

# MapeBay requirements:
yum install -y make

# zoid requirements:
yum install -y make

# hdf5r requirements:
yum install -y epel-release
yum install -y hdf5-devel

# RSiena requirements:
yum install -y make

# pathfindR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# officedown requirements:
yum install -y epel-release
yum install -y pandoc

# RWeka requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# cartogramR requirements:
yum install -y fftw-devel

# Statsomat requirements:
yum install -y epel-release
yum install -y texlive
yum install -y pandoc
yum install -y python

# dynr requirements:
yum install -y make

# rcdd requirements:
yum install -y gmp-devel

# DatabaseConnector requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# exiftoolr requirements:
yum install -y perl

# imager requirements:
yum install -y fftw-devel
yum install -y libtiff-devel

# adass requirements:
yum install -y make

# N2R requirements:
yum install -y make

# arrow requirements:
yum install -y libcurl-devel
yum install -y openssl-devel

# rgl requirements:
yum install -y epel-release
yum install -y freetype-devel
yum install -y mesa-libGLU-devel
yum install -y libpng-devel
yum install -y mesa-libGL-devel
yum install -y pandoc
yum install -y zlib-devel

# MIMSunit requirements:
yum install -y libxml2-devel
yum install -y openssl-devel

# xgboost requirements:
yum install -y make

# ctrdata requirements:
yum install -y perl

# string2path requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# git2r requirements:
yum install -y libgit2-devel
yum install -y libssh2-devel
yum install -y openssl-devel
yum install -y zlib-devel

# ltable requirements:
yum install -y gsl-devel

# symengine requirements:
yum install -y cmake
yum install -y gmp-devel
yum install -y make
yum install -y mpfr-devel

# matrixprofiler requirements:
yum install -y make

# Rmixmod requirements:
yum install -y make

# terra requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# RBesT requirements:
yum install -y epel-release
yum install -y make
yum install -y pandoc-citeproc
yum install -y pandoc

# Rserve requirements:
yum install -y make

# bootUR requirements:
yum install -y make

# blavaan requirements:
yum install -y make

# argparse requirements:
yum install -y python

# bssm requirements:
yum install -y epel-release
yum install -y pandoc

# GWpcor requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# stplanr requirements:
yum install -y make

# fsdaR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# neuronorm requirements:
yum install -y cmake

# RAQSAPI requirements:
yum install -y epel-release
yum install -y pandoc

# keyring requirements:
yum install -y libsecret-devel

# credentials requirements:
yum install -y git

# stringi requirements:
yum install -y libicu-devel

# odbc requirements:
yum install -y make
yum install -y unixODBC-devel

# xml2 requirements:
yum install -y libxml2-devel

# rflsgen requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# remotes requirements:
yum install -y git

# EpiSignalDetection requirements:
yum install -y epel-release
yum install -y pandoc

# ubms requirements:
yum install -y make

# GeoFIS requirements:
yum install -y gmp-devel
yum install -y make
yum install -y mpfr-devel

# archive requirements:
yum install -y libarchive-devel

# opencpu requirements:
yum install -y epel-release
yum install -y pandoc

# stringfish requirements:
yum install -y make

# bcTSNE requirements:
yum install -y make

# dialrjars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# vitae requirements:
yum install -y epel-release
yum install -y pandoc

# GPBayes requirements:
yum install -y gsl-devel

# rkafka requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# pkgdown requirements:
yum install -y epel-release
yum install -y pandoc

# KSgeneral requirements:
yum install -y fftw-devel

# exactextractr requirements:
yum install -y epel-release
yum install -y geos-devel

# leidenAlg requirements:
yum install -y make

# rkafkajars requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gdalcubes requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y netcdf-devel

# mailR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# RCzechia requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# ragg requirements:
yum install -y freetype-devel
yum install -y libjpeg-turbo-devel
yum install -y libpng-devel
yum install -y libtiff-devel

# tesseract requirements:
yum install -y epel-release
yum install -y leptonica-devel
yum install -y tesseract-devel

# salso requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# paws.common requirements:
yum install -y epel-release
yum install -y pandoc

# sdcTable requirements:
yum install -y epel-release
yum install -y glpk-devel

# anticlust requirements:
yum install -y epel-release
yum install -y glpk-devel
yum install -y pandoc

# fs requirements:
yum install -y make

# DIZutils requirements:
yum install -y postgresql-devel

# SimJoint requirements:
yum install -y make

# rJava requirements:
yum install -y make
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# EPP requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y openssl-devel
yum install -y proj-devel
yum install -y proj-epsg

# RcppCWB requirements:
yum install -y glib2-devel
yum install -y make

# rTLS requirements:
yum install -y make

# spcosa requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gpg requirements:
yum install -y epel-release
yum install -y gpgme-devel
yum install -y haveged-devel

# emayili requirements:
yum install -y epel-release
yum install -y pandoc

# gslnls requirements:
yum install -y gsl-devel

# RMySQL requirements:
yum install -y mariadb-devel

# tmbstan requirements:
yum install -y make

# RDieHarder requirements:
yum install -y gsl-devel

# conleyreg requirements:
yum install -y make

# tidycwl requirements:
yum install -y epel-release
yum install -y pandoc

# rticles requirements:
yum install -y make

# precommit requirements:
yum install -y git

# bmgarch requirements:
yum install -y make

# pema requirements:
yum install -y make

# ncdf4 requirements:
yum install -y epel-release
yum install -y netcdf-devel

# rgeos requirements:
yum install -y epel-release
yum install -y geos-devel

# ggiraph requirements:
yum install -y libpng-devel

# rgdal requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y proj-devel
yum install -y proj-epsg

# pagedown requirements:
yum install -y epel-release
yum install -y pandoc

# knitr requirements:
yum install -y epel-release
yum install -y pandoc

# RProtoBuf requirements:
yum install -y protobuf-devel
yum install -y protobuf-compiler

# rtmpt requirements:
yum install -y gsl-devel

# isotracer requirements:
yum install -y make

# RPostgres requirements:
yum install -y postgresql-devel

# mwcsr requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# sf requirements:
yum install -y epel-release
yum install -y gdal-devel
yum install -y gdal
yum install -y geos-devel
yum install -y proj-devel
yum install -y proj-epsg

# biblio requirements:
yum install -y epel-release
yum install -y pandoc

# RMariaDB requirements:
yum install -y mariadb-devel

# openssl requirements:
yum install -y openssl-devel

# tiledb requirements:
yum install -y cmake
yum install -y git

# blogdown requirements:
yum install -y epel-release
yum install -y pandoc

# rstan requirements:
yum install -y epel-release
yum install -y make
yum install -y pandoc

# redland requirements:
yum install -y redland-devel

# workflowr requirements:
yum install -y epel-release
yum install -y pandoc

# gfilogisreg requirements:
yum install -y gmp-devel

# Cairo requirements:
yum install -y cairo-devel

# eaf requirements:
yum install -y make
yum install -y gsl-devel

# V8 requirements:
yum install -y epel-release
yum install -y v8-devel

# IRkernel requirements:
yum install -y python

# JGR requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# simplermarkdown requirements:
yum install -y epel-release
yum install -y pandoc

# surveil requirements:
yum install -y make

# h2o requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# gert requirements:
yum install -y libgit2-devel

# cogmapr requirements:
yum install -y libcurl-devel
yum install -y openssl-devel

# h3jsr requirements:
yum install -y epel-release
yum install -y v8-devel

# igraph requirements:
yum install -y epel-release
yum install -y glpk-devel
yum install -y gmp-devel
yum install -y libxml2-devel

# baggr requirements:
yum install -y make

# bspm requirements:
yum install -y python

# ftExtra requirements:
yum install -y epel-release
yum install -y pandoc

# httpuv requirements:
yum install -y make
yum install -y zlib-devel

# TDA requirements:
yum install -y gmp-devel

# RcppParallel requirements:
yum install -y make

# secr requirements:
yum install -y make

# MFSIS requirements:
yum install -y python

# udunits2 requirements:
yum install -y epel-release
yum install -y udunits2-devel

# ymd requirements:
yum install -y epel-release
yum install -y rust
yum install -y cargo

# rego requirements:
yum install -y make

# bfp requirements:
yum install -y make

# psrwe requirements:
yum install -y make

# soilhypfit requirements:
yum install -y gmp-devel
yum install -y mpfr-devel

# SqlRender requirements:
yum install -y java-1.8.0-openjdk-devel
R CMD javareconf

# abn requirements:
yum install -y gsl-devel
```




***

#### Related

- [[Development]]
- [[R]]


*Backlinks:*

```dataview
list from [[RStudio Package Manager]] AND -"Changelog"
```