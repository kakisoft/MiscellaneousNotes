create or replace PACKAGE MY_PACKAGE_01 IS

  NLC CONSTANT NVARCHAR2(10) := CHR(13) || CHR(10);
  
  --===================================
  --
  --          MY_PROCEDURE_01
  --
  --===================================
  PROCEDURE MY_PROCEDURE_01;

  --===================================
  --
  --          MY_PROCEDURE_02
  --
  --===================================
  PROCEDURE MY_PROCEDURE_02 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                            );

  --===================================
  --
  --          MY_PROCEDURE_03
  --
  --===================================
  PROCEDURE MY_PROCEDURE_03 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                              ,OUT_LIST      OUT SYS_REFCURSOR
                              ,OUT_RETURN_CD OUT NUMBER
                            );

  --===================================
  --
  --          MY_PROCEDURE_04
  --
  --===================================
  PROCEDURE MY_PROCEDURE_04 (
                               IN_PARAM1 IN NUMBER
                              ,OUT_RETURN_CD OUT NUMBER
                            );

  --===================================
  --
  --          MY_PROCEDURE_05
  --
  --===================================
  PROCEDURE MY_PROCEDURE_05 (
                               IN_PARAM1 IN NUMBER
                              ,NUMBER_OF_RESULT OUT NUMBER
                            );

  --===================================
  --
  --          MY_PROCEDURE_06
  --
  --===================================
  PROCEDURE MY_PROCEDURE_06 (
                               IN_PARAM1         IN NUMBER
                              ,UPDATE_PLAN_COUNT IN NUMBER
                              ,NUMBER_OF_RESULT OUT NUMBER
                            );

END MY_PACKAGE_01;
