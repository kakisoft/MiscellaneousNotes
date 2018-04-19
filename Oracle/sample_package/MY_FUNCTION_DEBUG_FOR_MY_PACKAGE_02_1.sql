create or replace FUNCTION MY_FUNCTION_DEBUG_FOR_MY_PACKAGE_02_1
RETURN NUMBER IS
  i number := 0;  --indexを1から開始させる

  IN_NUM_LIST_PARAM_1        KAKIP2.MY_PACKAGE_02.TYPE_NUM_LIST;
  IN_CHAR_LIST_PARAM_1       KAKIP2.MY_PACKAGE_02.TYPE_CHAR_LIST;
  IN_LONG_CHAR_LIST_PARAM_1  KAKIP2.MY_PACKAGE_02.TYPE_LONG_CHAR_LIST;
  IN_TIMESTAMP_LIST_PARAM_1  KAKIP2.MY_PACKAGE_02.TYPE_TIMESTAMP_LIST;
  OUT_RETURN_CODE            NUMBER;
  OUT_SQLERRM                VARCHAR2(200);
  OUT_SQLCODE                NUMBER;

BEGIN

i := i + 1;
IN_NUM_LIST_PARAM_1(i)       := 1;
IN_CHAR_LIST_PARAM_1(i)      := '11';
IN_LONG_CHAR_LIST_PARAM_1(i) := '111';
--IN_TIMESTAMP_LIST_PARAM_1(i) := SYSTIMESTAMP;


i := i + 1;
IN_NUM_LIST_PARAM_1(i)       := 2;
IN_CHAR_LIST_PARAM_1(i)      := '22';
IN_LONG_CHAR_LIST_PARAM_1(i) := '222';
--IN_TIMESTAMP_LIST_PARAM_1(i) := SYSTIMESTAMP;

i := i + 1;
IN_NUM_LIST_PARAM_1(i)       := 3;
IN_CHAR_LIST_PARAM_1(i)      := '33';
IN_LONG_CHAR_LIST_PARAM_1(i) := '333';
--IN_TIMESTAMP_LIST_PARAM_1(i) := SYSTIMESTAMP;
--select (max(POSITION_CODE) + 0) into IN_PARAM2_LIST(i)  from  USERS;  --外部キー制約あり

  MY_PACKAGE_02.MY_PROCEDURE_02_1(
    IN_NUM_LIST_PARAM_1       => IN_NUM_LIST_PARAM_1,
    IN_CHAR_LIST_PARAM_1      => IN_CHAR_LIST_PARAM_1,
    IN_LONG_CHAR_LIST_PARAM_1 => IN_LONG_CHAR_LIST_PARAM_1,
    IN_TIMESTAMP_LIST_PARAM_1 => IN_TIMESTAMP_LIST_PARAM_1,
    OUT_RETURN_CODE           => OUT_RETURN_CODE,
    OUT_SQLERRM               => OUT_SQLERRM,
    OUT_SQLCODE               => OUT_SQLCODE
  );

DBMS_OUTPUT.PUT_LINE(OUT_SQLERRM);

  RETURN  SQLCODE;

EXCEPTION
    WHEN OTHERS THEN
    --DBMS_OUTPUT.PUT_LINE('エラーコード:'||SQLCODE);
    --DBMS_OUTPUT.PUT_LINE(SQLERRM);
    RETURN SQLCODE;
END;
