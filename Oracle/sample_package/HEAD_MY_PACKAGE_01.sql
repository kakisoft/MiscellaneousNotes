create or replace PACKAGE MY_PACKAGE_01 IS

  --===================================
  --          MY_PROCEDURE_01
  --===================================
  PROCEDURE MY_PROCEDURE_01;

  --===================================
  --          MY_PROCEDURE_02
  --===================================
  PROCEDURE MY_PROCEDURE_02 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                            );

  --===================================
  --          MY_PROCEDURE_03
  --===================================
  PROCEDURE MY_PROCEDURE_03 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                              ,OUT_LIST1     OUT SYS_REFCURSOR
                              ,OUT_RETURN_CD OUT NUMBER
                            );

END MY_PACKAGE_01;
