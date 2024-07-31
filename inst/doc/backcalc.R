## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(WhiteLabRt)

## -----------------------------------------------------------------------------
data("sample_report_dates")
data("sample_onset_dates")

## ----casecounts2--------------------------------------------------------------
my_linelist <- create_linelist(report_dates = sample_report_dates,
                                onset_dates = sample_onset_dates)
head(my_linelist)

## ----serial, fig.width=6.75, dev='png'----------------------------------------
sip <- si(14, 4.29, 1.18)
plot(sip, type = 'l')

## ----backcalc1,eval=F---------------------------------------------------------
#  out_list_demo <- run_backnow(my_linelist, sip = sip, chains = 1)

## ----plot1,fig.width=6.75,dev='png'-------------------------------------------
data("out_list_demo")
plot(out_list_demo, "est")

## ----plot2, fig.width=6.75,dev='png'------------------------------------------
data("out_list_demo")
plot(out_list_demo, "rt")

## ----example1-----------------------------------------------------------------
data("sample_dates")
data("sample_location")
data("sample_cases")

head(sample_dates)
head(sample_cases)
head(sample_location)

## ----casecounts---------------------------------------------------------------
caseCounts <- create_caseCounts(date_vec = sample_dates,
                                location_vec = sample_location,
                                cases_vec = sample_cases)
head(caseCounts)

## -----------------------------------------------------------------------------
my_linelist <- convert_to_linelist(caseCounts, 
                                   reportF = rnbinom, 
                                   reportF_args = list(size = 3, mu = 9),
                                   reportF_missP = 0.6)
head(my_linelist)

## ----serial2,fig.width=6.75, dev='png'----------------------------------------
sip <- si(14, 4.29, 1.18)

## ----backcalc2, eval=FALSE----------------------------------------------------
#  options(mc.cores = 4)
#  
#  out_list_demo <- run_backnow(my_linelist, sip = sip)

