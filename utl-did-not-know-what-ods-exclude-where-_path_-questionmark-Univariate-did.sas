%let pgm=utl-did-not-know-what-ods-exclude-where-_path_-questionmark-Univariate-did;

%stop_submission;

 I did not know what ods exclude where=(_path_ ? 'Univariate') did

  PROBLEM (gives you finer control of ods output then "ods exclude all")

    1 running without ods exclude where=(_path_ ? 'Univariate')
    2 running with ods exclude where=(_path_ ? 'Univariate')
    3 ods exclude all
    4 perplexity explanation (be sceptical)

  SOLUTION BY
     Keintz, Mark
     mkeintz@outlook.com

github
https://tinyurl.com/yuke7nxz
https://github.com/rogerjdeangelis/utl-did-not-know-what-ods-exclude-where-_path_-questionmark-Univariate-did

/**************************************************************************************************************************/
/*           PROCESS                                                 LOG                                                  */
/*           =======                                                 =----                                                */
/*                                                                                                                        */
/*                                                                                                                        */
/*   1 without ods exclude where=(_path_ ? 'Univariate')     NOTICE: THE HTML OUTPUT                                      */
/*   ====================================================                                                                 */
/*                                                                                                                        */
/*   ods output extremeobs=want (keep=high name_high         11081  ods output extremeobs=want (keep=high name_high       */
/*        rename=(high=age name_high=name));                 11082       rename=(high=age name_high=name));               */
/*   proc univariate data=sashelp.class(keep=name age)       11083  proc univariate data=sashelp.class(keep=name age)     */
/*     nextrobs=5 ;                                                                                                       */
/*     var age;                                              NOTE: Writing HTML Body file: sashtml5.htm                   */
/*     id name;                                                                                                           */
/*   run;                                                    11084    nextrobs=5 ;                                        */
/*   ods exclude none;                                       11085    var age;                                            */
/*   ods output clear;                                       11086    id name;                                            */
/*                                                           11087  run;                                                  */
/*                                                                                                                        */
/*                                                           NOTE: The data set WORK.WANT has 5 observations              */
/*                                                                                                                        */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                                                                                                                        */
/*   2 with ods exclude where=(_path_ ? 'Univariate')        NOTICE: NO HTML OUTPUT                                       */
/*   ================================================                                                                     */
/*                                                                                                                        */
/*   ods exclude where=(_path_ ? 'Univariate');              11090  ods exclude where=(_path_ ? 'Univariate');            */
/*   ods output extremeobs=want (keep=high name_high         11091  ods output extremeobs=want (keep=high name_high       */
/*        rename=(high=age name_high=name));                 11092       rename=(high=age name_high=name));               */
/*   proc univariate data=sashelp.class(keep=name age)       11093  proc univariate data=sashelp.class(keep=name age)     */
/*     nextrobs=5 ;                                          11094    nextrobs=5 ;                                        */
/*     var age;                                              11095    var age;                                            */
/*     id name;                                              11096    id name;                                            */
/*   run;                                                    11097  run;                                                  */
/*   ods exclude none;                                                                                                    */
/*   ods output clear;                                       NOTE: The data set WORK.WANT has 5 observations and 2 variabl*/
/*                                                                                                                        */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                                                                                                                        */
/*   3 with ods exclude all                                  NOTICE: ALSO NO HTML OUTPUT                                  */
/*   ======================                                                                                               */
/*                                                                                                                        */
/*   ods exclude all;                                        11090  ods exclude where=(_path_ ? 'Univariate');            */
/*   ods output extremeobs=want (keep=high name_high         11091  ods output extremeobs=want (keep=high name_high       */
/*        rename=(high=age name_high=name));                 11092       rename=(high=age name_high=name));               */
/*   proc univariate data=sashelp.class(keep=name age)       11093  proc univariate data=sashelp.class(keep=name age)     */
/*     nextrobs=5 ;                                          11094    nextrobs=5 ;                                        */
/*     var age;                                              11095    var age;                                            */
/*     id name;                                              11096    id name;                                            */
/*   run;                                                    11097  run;                                                  */
/*   ods select all;                                                                                                      */
/*   ods output clear;                                       NOTE: The data set WORK.WANT has 5 observations and 2 variabl*/
/**************************************************************************************************************************/

/*  _                           _           _ _                          _       _
| || |    _ __   ___ _ __ _ __ | | _____  _(_) |_ _   _   _____  ___ __ | | __ _(_)_ __  ___
| || |_  | `_ \ / _ \ `__| `_ \| |/ _ \ \/ / | __| | | | / _ \ \/ / `_ \| |/ _` | | `_ \/ __|
|__   _| | |_) |  __/ |  | |_) | |  __/>  <| | |_| |_| ||  __/>  <| |_) | | (_| | | | | \__ \
   |_|   | .__/ \___|_|  | .__/|_|\___/_/\_\_|\__|\__, | \___/_/\_\ .__/|_|\__,_|_|_| |_|___/
         |_|             |_|                      |___/           |_|


The SAS statement `ods exclude where=(_path_ ? 'Univariate');` is used to suppress or exclude
specific output objects from being sent to the active ODS (Output Delivery System) destinations.
Here's what it does:

 1. **Exclusion Based on Path**: The `where=(_path_ ? 'Univariate')`
    condition specifies that only output objects whose `_path_` attribute contains the string
    `'Univariate'` will be excluded. The `_path_` is a metadata attribute that identifies the
    hierarchical path of an output object, often including the procedure name and other details[1][5].


 2. **Effect**: By excluding these objects, any output generated by the `PROC UNIVARIATE`
  procedure (or similar outputs with `'Univariate'` in their path) will not appear in the designated
  ODS destinations, such as HTML, PDF, or LISTING[3][5].

 This statement is particularly useful
  for suppressing unwanted outputs when working with procedures that generate extensive results,
  allowing users to focus on specific outputs or streamline their reporting.

 Citations:
 [1] http://www.math.wpi.edu/saspdf/ods/c03.pdf
 [2] https://documentation.sas.com/doc/en/odsug/latest/p1b72ff70v3obrn16aanp1r9q2bu.htm
 [3]  https://sasnrd.com/sas-ods-trace-select-exclude/
 [4]  https://documentation.sas.com/doc/es/pgmsascdc/v_049/odsug/p0oxrbinw6fjuwn1x23qam6dntyd.htm
 [5]  https://www.sfu.ca/sasdoc/sashtml/ods/z0407002.htm
 [6]  https://www.mwsug.org/proceedings/2019/SP/MWSUG-2019-SP-057.pdf
 [7]  https://documentation.sas.com/doc/en/odsug/9.4/n0edvjbwu4y1bun1qgmzbk3s3vix.htm
 [8]  https://documentation.sas.com/doc/en/odsug/9.4/n1ovhlum2jap2nn1gy6w5c93kknh.htm
 [9]  https://documentation.sas.com/doc/en/statug/latest/statug_ods_examples03.htm

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
