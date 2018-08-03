#need to install TMB on system before TMB package will work:
#https://github.com/kaskr/adcomp/wiki/Download

install.packages('TMB')
library(TMB)

#test installation
runExample(all=TRUE)


setwd('C:/Users/vlahm/Desktop/tmb_dfa_example')

#load this script if using error structures 'DE' (diagonal and equal), 'DUE'
#(diag and uneq), or 'UNC' (unconstrained)
source('00_tmb_uncor_Rmat_DE_DUE_UNC.R')

#load this script instead for 'EVCV' (equal var covar)
source('00_tmb_uncor_Rmat_EVCV.R')


d = readRDS('d.rds')
y = readRDS('y.rds')

dfa = runDFA(obs=y, NumStates=2, ErrStruc='DE', EstCovar=TRUE, Covars=d)
