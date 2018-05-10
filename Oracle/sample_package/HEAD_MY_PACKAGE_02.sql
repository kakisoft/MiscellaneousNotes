create or replace PACKAGE MY_PACKAGE_02 IS

  type TYPE_NUM_LIST       is table of number        index by binary_integer;
  type TYPE_CHAR_LIST      is table of VARCHAR2(20)  index by binary_integer;
  type TYPE_LONG_CHAR_LIST is table of VARCHAR2(255) index by binary_integer;
  type TYPE_TIMESTAMP_LIST is table of TIMESTAMP     index by binary_integer;

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
  );

  --/////////////////////////////
  --             参照
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_2 (
     IN_NUM_LIST_PARAM_1        IN  TYPE_NUM_LIST
    ,OUT_RETURN_CODE            OUT NUMBER
  );

  --/////////////////////////////
  --     配列データをテーブル化
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_3 (
     IN_NUM_LIST_PARAM_1        IN  TYPE_NUM_LIST
    ,OUT_RETURN_CODE            OUT NUMBER
  );

  --/////////////////////////////
  --  配列をデータをINに渡して参照
  --/////////////////////////////
  PROCEDURE MY_PROCEDURE_02_4 (
     IN_NUM_LIST      IN  TYPE_NUM_LIST
    ,OUT_LIST         OUT SYS_REFCURSOR     
    ,OUT_RETURN_CODE  OUT NUMBER
  );

END MY_PACKAGE_02;
