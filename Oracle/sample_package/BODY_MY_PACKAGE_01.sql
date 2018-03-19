create or replace PACKAGE BODY MY_PACKAGE_01 IS

  --===================================
  --          MY_PROCEDURE_01
  --===================================
  PROCEDURE MY_PROCEDURE_01 IS
    privateNumber number        := 100;
    privateString varchar2(255) := 'varchar2';
  BEGIN

    null;
    DBMS_OUTPUT.PUT_LINE('Output to console');

    DBMS_OUTPUT.PUT_LINE('privateNumber:' || privateNumber );
    DBMS_OUTPUT.PUT_LINE('privateString:' || privateString );


    FOR i IN 1..3 LOOP
      DBMS_OUTPUT.PUT_LINE('ループ変数 i = ' || i);
    END LOOP;

    ------------------------------------------
    --  暗黙カーソル（カーソルを宣言しない）
    ------------------------------------------
    FOR vRec IN ( select 'data1' COLNAME1 from dual  union all
                  select 'data2' COLNAME1 from dual
                ) LOOP

        DBMS_OUTPUT.PUT(NVL(TO_CHAR(SQL%ROWCOUNT),'NULL') || ':');
        DBMS_OUTPUT.PUT_LINE(vRec.COLNAME1);
    END LOOP;


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
