/* Adapted from the repo's PROC UNIVARIATE + ODS OUTPUT ExtremeObs demonstration.
   Runs the same analysis on sashelp.class (name/age), applies the repo's
   ods exclude where=(_path_ ? 'Univariate') statement, captures the
   Extreme Observations table with ods output, and prints the captured dataset. */

ods exclude where=(_path_ ? 'Univariate');
ods output extremeobs=want;
proc univariate data=sashelp.class(keep=name age)
  nextrobs=5 ;
  var age;
  id name;
run;
ods exclude none;
ods output clear;

proc print data=want;
run;
