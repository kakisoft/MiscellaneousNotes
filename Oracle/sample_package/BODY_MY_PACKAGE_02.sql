create or replace PACKAGE BODY MY_PACKAGE_02 IS

  --/////////////////////////////
  --             登録
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_1 (
     IN_NUM_LIST_PARAM_1        IN  TYPE_NUM_LIST
    ,IN_CHAR_LIST_PARAM_1       IN  TYPE_CHAR_LIST
    ,IN_LONG_CHAR_LIST_PARAM_1  IN  TYPE_LONG_CHAR_LIST
    ,IN_TIMESTAMP_LIST_PARAM_1  IN  TYPE_TIMESTAMP_LIST
    ,OUT_RETURN_CODE            OUT NUMBER
    ,OUT_SQLERRM                OUT VARCHAR2
    ,OUT_SQLCODE                OUT NUMBER
  ) IS
  
  -- 【※重要※】 .NETの配列を引数に渡したとき、インデックスは１から開始する
  headerIndex number := 1;
  BEGIN

    --登録データがなかった場合、-1を返して終了する
    IF (IN_NUM_LIST_PARAM_1.COUNT <= 0) THEN
      OUT_RETURN_CODE := -99;
      RETURN;
    END IF;

    --トランザクション開始
    SET TRANSACTION NAME 'TRANSACTION_MY_PROCEDURE_02_1'; 

    --ヘッダ情報を登録
    INSERT INTO TABLE1
      ( 
         ID
        ,COLUMN1
      )
    VALUES
      ( 
         IN_NUM_LIST_PARAM_1(headerIndex)
        ,IN_CHAR_LIST_PARAM_1(headerIndex)
      );

    --明細情報を登録（バルクinsert）
    forall i in headerIndex..IN_NUM_LIST_PARAM_1.count
      INSERT INTO TABLE2
        ( 
           ID
          ,COLUMN1
          ,TIMESTAMP1
        )
      VALUES
        ( 
           IN_NUM_LIST_PARAM_1(i)
          ,IN_CHAR_LIST_PARAM_1(i)
          --,IN_TIMESTAMP_LIST_PARAM_1(i)
          ,null
        );

    --更新（まとめてupdate）
    forall i in headerIndex..IN_NUM_LIST_PARAM_1.count
      update  TABLE2
         set  COLUMN2 = IN_NUM_LIST_PARAM_1(i)
             ,COLUMN3 = IN_CHAR_LIST_PARAM_1(i) 
       where  1=1
         and  COLUMN1 = IN_CHAR_LIST_PARAM_1(i)
         and  COLUMN4 is null
       ;
  

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      --DBMS_OUTPUT.PUT_LINE(SQLERRM);
      OUT_RETURN_CODE := -1;
      OUT_SQLERRM := SQLERRM;
      OUT_SQLCODE := SQLCODE;
      ROLLBACK;

  END MY_PROCEDURE_02_1;

  --/////////////////////////////
  --             参照
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_2 (
     IN_NUM_LIST_PARAM_1        IN  TYPE_NUM_LIST
    ,OUT_RETURN_CODE            OUT NUMBER
  ) IS

  COMMA_JOIN_NUM_CODE varchar2(32767) := '';
  EXECUTESQL varchar2(32767);
  NLC CONSTANT NVARCHAR2(10) := CHR(13) || CHR(10); --改行文字（デバッグ用。発行されたカーソルSQLの確認。）
  headerIndex number := 1;  -- 【※重要※】 .NETの配列を引数に渡したとき、インデックスは１から開始する
  BEGIN

    --登録データがなかった場合、-1を返して終了する
    IF (IN_NUM_LIST_PARAM_1.COUNT <= 0) THEN
      OUT_RETURN_CODE := -99;
      RETURN;
    END IF;

    -- 対象条件をSQLで使用できる形に整形
    FOR i IN headerIndex..IN_NUM_LIST_PARAM_1.COUNT LOOP
      COMMA_JOIN_NUM_CODE := COMMA_JOIN_NUM_CODE || IN_NUM_LIST_PARAM_1(I);
      IF i <> IN_NUM_LIST_PARAM_1.COUNT THEN
        COMMA_JOIN_NUM_CODE := COMMA_JOIN_NUM_CODE || ',';
      END IF;
    END LOOP;

    --トランザクション開始
    SET TRANSACTION NAME 'TRANSACTION_MY_PROCEDURE_02_1'; 

    -- SQL発行
    EXECUTESQL := ''; 
    EXECUTESQL := EXECUTESQL || 'update TABLE2                                  ' || NLC;
    EXECUTESQL := EXECUTESQL || '   set COLUMN1 = 0                             ' || NLC;
    EXECUTESQL := EXECUTESQL || '      ,COLUMN2 = ''M''                         ' || NLC;
    EXECUTESQL := EXECUTESQL || ' where 1=1                                     ' || NLC;
    EXECUTESQL := EXECUTESQL || '   and ID in (' || COMMA_JOIN_NUM_CODE ||')    ' || NLC;
    EXECUTE IMMEDIATE EXECUTESQL;

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      --DBMS_OUTPUT.PUT_LINE(SQLERRM);
      OUT_RETURN_CODE := -1;
      ROLLBACK;

  END MY_PROCEDURE_02_2;

  --/////////////////////////////
  --  配列をデータをINに渡して参照
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_3 (
     IN_NUM_LIST_PARAM_1        IN  TYPE_NUM_LIST
    ,OUT_RETURN_CODE            OUT NUMBER
  ) IS

      f_column01 NUMBER;
      OUT_LIST    SYS_REFCURSOR;

  BEGIN

    open OUT_LIST for 
      SELECT * FROM TABLE(IN_NUM_LIST_PARAM_1)
    ;


    -----< フェッチ >-----
    LOOP
      FETCH OUT_LIST INTO f_column01;
      EXIT WHEN OUT_LIST%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('f_column01:' || f_column01);
    END LOOP;

   -----< 件数チェック  >-----　　※フェッチしないと件数が取れないというゴミ仕様
    DBMS_OUTPUT.PUT_LINE(OUT_LIST%ROWCOUNT);


  EXCEPTION
    WHEN OTHERS THEN
      --DBMS_OUTPUT.PUT_LINE(SQLERRM);
      OUT_RETURN_CODE := -1;
      ROLLBACK;

  END MY_PROCEDURE_02_3;

  --/////////////////////////////
  --  配列をデータをINに渡して参照
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_4 (
     IN_NUM_LIST      IN  TYPE_NUM_LIST
    ,OUT_LIST         OUT SYS_REFCURSOR     
    ,OUT_RETURN_CODE  OUT NUMBER
  ) IS

  BEGIN

    open OUT_LIST for 
      select
          *
      from
          TABLE1
      where  1=1
        and  ID in (SELECT * FROM TABLE(IN_NUM_LIST) )
    ;

  EXCEPTION
    WHEN OTHERS THEN
      OUT_RETURN_CODE := -1;
      ROLLBACK;

  END MY_PROCEDURE_02_4;

END MY_PACKAGE_02;
