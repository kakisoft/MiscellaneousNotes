create or replace PACKAGE BODY MY_PACKAGE_01 IS

  --===================================
  --          MY_PROCEDURE_01
  --===================================
  PROCEDURE MY_PROCEDURE_01 IS

  BEGIN

    null;
    DBMS_OUTPUT.PUT_LINE('Output to console');
    null;

  END MY_PROCEDURE_01;

  --===================================
  --          MY_PROCEDURE_02
  --===================================
  PROCEDURE MY_PROCEDURE_02 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                             ) IS

  BEGIN

    null;

  END MY_PROCEDURE_02;

  --===================================
  --          MY_PROCEDURE_03
  --===================================
  PROCEDURE MY_PROCEDURE_03 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                              ,OUT_LIST1     OUT SYS_REFCURSOR
                              ,OUT_RETURN_CD OUT NUMBER
                             ) IS

  BEGIN

    open OUT_LIST1 for 
      select
        *
      from
        dual
    ;

  END MY_PROCEDURE_03;

END MY_PACKAGE_01;