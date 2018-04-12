## 配列を引数に渡す

```sql
DECLARE
  IN_PARAM1_LIST KAKIP2.MY_PACKAGE_01.NUM_TYPE_LIST;
  IN_PARAM2_LIST KAKIP2.MY_PACKAGE_01.CHAR_TYPE_LIST;
  
  argNumberList  MY_PACKAGE_01.NUM_TYPE_LIST;
BEGIN
  argNumberList(0) := 1;
  -- Modify the code to initialize the variable
  -- IN_PARAM1_LIST := NULL;
  -- Modify the code to initialize the variable
  -- IN_PARAM2_LIST := NULL;

  MY_PACKAGE_01.MY_PROCEDURE_07(
    IN_PARAM1_LIST => argNumberList,
    IN_PARAM2_LIST => IN_PARAM2_LIST
  );
--rollback; 
END;
```
