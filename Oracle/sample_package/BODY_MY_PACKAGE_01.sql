create or replace PACKAGE BODY MY_PACKAGE_01 IS

  --===================================
  --          MY_PROCEDURE_01
  --===================================
  PROCEDURE MY_PROCEDURE_01 IS
    privateNumber number        := 100;
    privateString varchar2(255);

    --//////////////
    -- カーソル定義  
    --//////////////
    CURSOR c_sample01 IS
        SELECT * FROM dual;
  BEGIN

    null;
    ------------------
    --  コンソール出力
    ------------------
    DBMS_OUTPUT.PUT_LINE('Output to console');
    DBMS_OUTPUT.PUT_LINE('privateNumber:' || privateNumber );
    
    ------------------
    --   値をセット
    ------------------
    SELECT 'value01' as column01 INTO privateString  
        FROM dual
        WHERE 1=1;
    
    DBMS_OUTPUT.PUT_LINE('privateString:' || privateString );


    ------------------
    --    ループ
    ------------------
    FOR i IN 1..3 LOOP
      DBMS_OUTPUT.PUT_LINE('ループ変数 i = ' || i);
    END LOOP;

    ---///////////////////////////////////////
    --  暗黙カーソル（カーソルを宣言しない）
    ---///////////////////////////////////////
    FOR icRec IN ( select 'data1' COLNAME1 from dual ) LOOP

        --値を抽出
        DBMS_OUTPUT.PUT_LINE(icRec.COLNAME1);
        
        --ISOPEN属性の確認  
        IF (SQL%ISOPEN) THEN  
            SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=true');  
        ELSE  
            SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=false');  
        END IF;  
        
        --FOUND属性の確認  
        IF (SQL%FOUND) THEN  
            SYS.DBMS_OUTPUT.PUT_LINE('FOUND=true');  
        ELSE  
            SYS.DBMS_OUTPUT.PUT_LINE('FOUND=false');  
        END IF;  
        
        --ROWCOUNT属性の確認  
        SYS.DBMS_OUTPUT.PUT_LINE('ROWCOUNT=' || SQL%ROWCOUNT);  
          
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
                select * from dual
      union all select * from dual
    ;


        DBMS_OUTPUT.PUT_LINE(OUT_LIST1%ROWCOUNT);


  END MY_PROCEDURE_03;

END MY_PACKAGE_01;
