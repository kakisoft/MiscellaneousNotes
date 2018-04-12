create or replace PACKAGE BODY MY_PACKAGE_01 IS

  --===================================
  --
  --          MY_PROCEDURE_01
  --
  --===================================
  PROCEDURE MY_PROCEDURE_01 IS
    privateNumber number := 100;
    privateString varchar2(255);

    --///////////////
    -- カーソル定義１  
    --///////////////
    CURSOR cur_sample01 IS
        SELECT 'value01' as column01 FROM dual;
        
    --///////////////
    -- カーソル定義２
    --///////////////
    CURSOR cur_sample02(P_DATA_2 VARCHAR2 := 'CURSOR param') IS
                  SELECT 'value02' as column02 FROM DUAL
        UNION ALL SELECT P_DATA_2  as column02 FROM DUAL ;
    vRec_sample02  cur_sample02%ROWTYPE;
  BEGIN

    null;
    ------------------
    --  コンソール出力
    ------------------
    DBMS_OUTPUT.PUT_LINE('Output to console');
    DBMS_OUTPUT.PUT_LINE('privateNumber:' || privateNumber );

    ------------------
    -- 値をセット(INTO)
    ------------------
    SELECT 'value02' as column02 INTO privateString  
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
    --            明示カーソル
    ---///////////////////////////////////////
    FOR rec IN cur_sample01 LOOP
        --値を抽出
        SYS.DBMS_OUTPUT.PUT_LINE(rec.column01);

        --カーソルISOPEN=出力
        If (cur_sample01%ISOPEN) THEN
            SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=true');
        ELSE
            SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=false');
        END IF;
        --カーソルROWCOUNT出力
        SYS.DBMS_OUTPUT.PUT_LINE('フェッチした件数:ROWCOUNT=' || cur_sample01%ROWCOUNT);

    END LOOP;

    --カーソルISOPEN=出力
    If (cur_sample01%ISOPEN) THEN
        SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=true');
    ELSE
        SYS.DBMS_OUTPUT.PUT_LINE('ISOPEN=false');
    END IF;


    ---///////////////////////////////////////
    --      明示カーソル（オープン/フェッチ）
    ---///////////////////////////////////////
    -- 引数付きのカーソルをオープン
    OPEN cur_sample02('yyy');
    LOOP
      -- カーソルの内容をフェッチ
      FETCH cur_sample02 INTO vRec_sample02;
      EXIT WHEN cur_sample02%NOTFOUND;
      DBMS_OUTPUT.PUT(cur_sample02%ROWCOUNT || ':');
      DBMS_OUTPUT.PUT_LINE(vRec_sample02.column02);
    END LOOP;


    ---///////////////////////////////////////
    --      暗黙カーソル（カーソルを宣言しない）
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
  --
  --          MY_PROCEDURE_02
  --
  --===================================
  PROCEDURE MY_PROCEDURE_02 (
                               IN_PARAM1 IN NUMBER
                              ,IN_PARAM2 IN NVARCHAR2
                             ) IS
    CURSORSQL  varchar2(32767);
    EXECUTESQL varchar2(32767);

    --//////////////
    -- カーソル定義１
    --//////////////
    cur_sample01 SYS_REFCURSOR;
    f_COLNAME1 int;
    f_COLNAME2 varchar2(10);

    --//////////////
    -- カーソル定義２
    --//////////////
    TYPE cur_typ IS REF CURSOR;
    cur_sample02 cur_typ;
    f_COLNAME3 int;
    f_COLNAME4 varchar2(10);

  BEGIN

    ------------------
    --    動的SQL
    ------------------
    CURSORSQL := '';
    CURSORSQL := CURSORSQL || 'CALL DBMS_OUTPUT.PUT_LINE(''動的SQL実行'')';

    EXECUTE IMMEDIATE CURSORSQL;

    ------------------
    --  動的カーソル１
    ------------------
    OPEN cur_sample01 FOR 'select 1 as COLNAME1, ''2'' as COLNAME2 from dual ';
    LOOP
      FETCH cur_sample01 INTO f_COLNAME1, f_COLNAME2;
      EXIT WHEN cur_sample01%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('f_COLNAME1:' || f_COLNAME1);
      DBMS_OUTPUT.PUT_LINE('f_COLNAME2:' || f_COLNAME2);
    END LOOP;
    CLOSE cur_sample01;

    ------------------
    --  動的カーソル２
    ------------------
    CURSORSQL := '';
    CURSORSQL := CURSORSQL || 'select                                                               ' || NLC;
    CURSORSQL := CURSORSQL || '    COLNAME3                                                         ' || NLC;
    CURSORSQL := CURSORSQL || '   ,COLNAME4                                                         ' || NLC;
    CURSORSQL := CURSORSQL || 'from                                                                 ' || NLC;
    CURSORSQL := CURSORSQL || '    (                                                                ' || NLC;
    CURSORSQL := CURSORSQL || '                select 3 as COLNAME3, ''3-1'' as COLNAME4 from dual  ' || NLC;
    CURSORSQL := CURSORSQL || '      union all select 4 as COLNAME3, ''4-1'' as COLNAME4 from dual  ' || NLC;
    CURSORSQL := CURSORSQL || '    )                                                                ' || NLC;
    --CURSORSQL := CURSORSQL || '          AND SUBSTR(col1,1,1) in (' || '''ア''' ||  ')            ' || NLC;

    OPEN cur_sample02 FOR CURSORSQL;
    LOOP
      FETCH cur_sample02 INTO f_COLNAME3, f_COLNAME4;
      EXIT WHEN cur_sample02%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('f_COLNAME3:' || f_COLNAME3);
      DBMS_OUTPUT.PUT_LINE('f_COLNAME4:' || f_COLNAME4);
    END LOOP;

    -----< カーソルの内容をチェック >-----
    DBMS_OUTPUT.PUT_LINE(CURSORSQL);

    -----< 件数チェック >-----
    DBMS_OUTPUT.PUT_LINE(cur_sample02%ROWCOUNT);


  END MY_PROCEDURE_02;

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
                             ) IS
    f_column01 varchar2(10);
    --f_column01 TABLE01.COLUMN01%TYPE;

  BEGIN

    -----------------------
    --  SYS_REFCURSOR（戻り値となるカーソル）に値をセット
    ------------------------
    open OUT_LIST for 
                SELECT 'value01' as column01 FROM dual
      union all SELECT 'value02' as column01 FROM dual
    ;

    -----< フェッチ >-----
    LOOP
      FETCH OUT_LIST INTO f_column01;
      EXIT WHEN OUT_LIST%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('f_column01:' || f_column01);
    END LOOP;

    -----< 件数チェック  >-----　　※フェッチしないと件数が取れないというゴミ仕様
    DBMS_OUTPUT.PUT_LINE(OUT_LIST%ROWCOUNT);


  END MY_PROCEDURE_03;

  --===================================
  --
  --          MY_PROCEDURE_04
  --
  --===================================
  PROCEDURE MY_PROCEDURE_04 (
                               IN_PARAM1 IN NUMBER
                              ,OUT_RETURN_CD OUT NUMBER
                             ) IS
    vNum    NUMBER(2);
  BEGIN

    null;
    
    BEGIN

      -- IN_PARAM1 に 0を入れると、ZERO DIVIDE EXCEPTION が発生
      vNum := 1 / IN_PARAM1;
    EXCEPTION
      WHEN OTHERS THEN
        OUT_RETURN_CD := -1;
        DBMS_OUTPUT.PUT_LINE('エラーコード:'||SQLCODE);
        DBMS_OUTPUT.PUT_LINE('エラーメッセージ:'||SQLERRM);
        DBMS_OUTPUT.PUT_LINE('Exception occured. ');
    END;
    
  EXCEPTION
    WHEN OTHERS THEN
      RAISE;

  END MY_PROCEDURE_04;

  --===================================
  --
  --          MY_PROCEDURE_05
  --
  --===================================
  PROCEDURE MY_PROCEDURE_05 (
                               IN_PARAM1 IN NUMBER
                              ,NUMBER_OF_RESULT OUT NUMBER
                             ) IS
    vNum    NUMBER(2);
  BEGIN

    -----< 何らかの処理 >-----
    update  TABLE1 
       set  COLUMN1 = 'updated'
     where  1=1
       and  ID = nvl(IN_PARAM1,ID)
    ;

    -----< 処理結果の件数を確認 >-----
    NUMBER_OF_RESULT := SQL%ROWCOUNT;
    
    
    DBMS_OUTPUT.PUT_LINE(NUMBER_OF_RESULT);

  END MY_PROCEDURE_05;

  --===================================
  --
  --          MY_PROCEDURE_06
  --
  --===================================
  PROCEDURE MY_PROCEDURE_06 (
                               IN_PARAM1         IN NUMBER
                              ,UPDATE_PLAN_COUNT IN NUMBER
                              ,NUMBER_OF_RESULT OUT NUMBER
                             ) IS
  BEGIN

  SET TRANSACTION NAME 'MY_PROCEDURE_06'; 

    -----< 何らかの処理 >-----
    update  TABLE1 
       set  COLUMN1 = 'updated2'
     where  1=1
       and  ID = nvl(IN_PARAM1,ID)
    ;
    -----< 処理結果が、更新予定件数と同一ならコミット >-----
    If SQL%ROWCOUNT = UPDATE_PLAN_COUNT THEN
      NUMBER_OF_RESULT := SQL%ROWCOUNT;
      DBMS_OUTPUT.PUT_LINE('コミットしました。');
      COMMIT;
    ELSE
      NUMBER_OF_RESULT := 0;
      DBMS_OUTPUT.PUT_LINE('ロールバックしました。');
      ROLLBACK;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE(NUMBER_OF_RESULT);
    
  EXCEPTION
    WHEN OTHERS THEN
      NUMBER_OF_RESULT := 0;
      ROLLBACK;
      RAISE;

  END MY_PROCEDURE_06;

  --===================================
  --
  --          MY_PROCEDURE_07
  --
  --===================================
  PROCEDURE MY_PROCEDURE_07 (
                               IN_PARAM1_LIST IN NUM_TYPE_LIST
                              ,IN_PARAM2_LIST IN CHAR_TYPE_LIST
                            ) IS

    privateNumberList  NUM_TYPE_LIST;
    
    type CHAR_TYPE_LIST_LOCAL is table of varchar2(3);
    privateCharList CHAR_TYPE_LIST_LOCAL := CHAR_TYPE_LIST_LOCAL('S1','S2','S3'); --※indexは 1から開始！

  BEGIN

    privateNumberList(0) := 1;
    privateNumberList(1) := 22;
    privateNumberList(2) := 333;
    
    -- 配列の要素数分ループする
    for i in 0..privateNumberList.count -1 loop
      DBMS_OUTPUT.PUT_LINE('i:' || privateNumberList(i) );
    end loop;
    

    -- 配列の要素数分ループする（初期化と同時に値を挿入した配列）
    for i in 1..privateCharList.count loop
      DBMS_OUTPUT.PUT_LINE('i:' || privateCharList(i) );
    end loop;

    DBMS_OUTPUT.PUT_LINE(privateCharList.COUNT);
    
    DBMS_OUTPUT.PUT_LINE(IN_PARAM1_LIST.COUNT);

  END MY_PROCEDURE_07;

  --===================================
  --
  --       MY_PROCEDURE_07_debug
  --
  --===================================
  PROCEDURE MY_PROCEDURE_07_debug IS
    argNumberList  NUM_TYPE_LIST;
    argCharList    CHAR_TYPE_LIST;

  BEGIN

    argNumberList(0) := 1;
    argNumberList(1) := 22;
    argNumberList(2) := 333;
    argNumberList(3) := 4444;
    argNumberList(4) := 55555;

    MY_PACKAGE_01.MY_PROCEDURE_07(argNumberList, argCharList);
    
  END MY_PROCEDURE_07_debug;


END MY_PACKAGE_01;
