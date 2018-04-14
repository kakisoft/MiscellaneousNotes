## 配列を引数に渡す

Oracle SQL Developerデバッグの、PL/SQLブロックにて、値をセットできる。
```sql
DECLARE
  IN_PARAM1_LIST KAKIP2.MY_PACKAGE_01.NUM_TYPE_LIST;
  IN_PARAM2_LIST KAKIP2.MY_PACKAGE_01.CHAR_TYPE_LIST;
BEGIN
  IN_PARAM1_LIST(0) := 0;
  IN_PARAM1_LIST(1) := 11;

  -- Modify the code to initialize the variable
  -- IN_PARAM1_LIST := NULL;
  -- Modify the code to initialize the variable
  -- IN_PARAM2_LIST := NULL;

  MY_PACKAGE_01.MY_PROCEDURE_07(
    IN_PARAM1_LIST => IN_PARAM1_LIST,
    IN_PARAM2_LIST => IN_PARAM2_LIST
  );
--rollback; 
END;
```
