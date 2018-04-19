create or replace PACKAGE BODY MY_PACKAGE_02 IS

  --//////////////////////
  --         登録
  --//////////////////////
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

    --窓口購入情報を登録
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

    --窓口購入座席を登録　　※MADO_ORDER_ZASEKI_CODE は、テーブル定義にてデフォルト値を「SQ_MADO_ORDER_ZASEKI.NEXTVAL」とする事で対応しています。
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

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      --DBMS_OUTPUT.PUT_LINE(SQLERRM);
      OUT_RETURN_CODE := -1;
      OUT_SQLERRM := SQLERRM;
      OUT_SQLCODE := SQLCODE;
      ROLLBACK;

  END MY_PROCEDURE_02_1;

END MY_PACKAGE_02;
