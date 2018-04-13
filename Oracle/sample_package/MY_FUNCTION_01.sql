CREATE OR REPLACE FUNCTION MY_FUNCTION_01 (
   p_VERSION        IN VARCHAR2
  ,p_OWNER_CODE     IN VARCHAR2
  ,p_OPERATOR_CODE  IN VARCHAR2
  ,p_TERMINAL_CODE  IN VARCHAR2
  ,p_PROGRAM_ID     IN VARCHAR2
  ,p_MESSAGE_ID     IN VARCHAR2
  ,p_MESSAGE_TEXT   IN VARCHAR2)
RETURN NUMBER IS

--//////////////////////////////////////////////////////////////////////////////
--
--  FUNCTION_NAME   : MY_FUNCTION_01     メッセージログ出力
--  AURGMENTS       : p_PROGRAM_ID        I   プログラムＩＤ
--                  : p_MESSAGE_ID        I   イベント名称
--                  : p_MESSAGE_TEXT      I   処理メッセージ
--
--  RETURN          : SQLCODE
--  CREATE DATE     : 2018.04.13
--  NOTE            : ログテーブルにログを出力します。
--                    TIME_STAMPがVARCHAR2なのは、ローカルの言語設定の影響を避けるため。
--
--//////////////////////////////////////////////////////////////////////////////

    --=================================
    --         変数定義
    --=================================
    w_VERSION       MY_SYSTEM_LOG.VERSION%TYPE;
    w_OWNER_CODE    MY_SYSTEM_LOG.OWNER_CODE%TYPE;
    w_OPERATOR_CODE MY_SYSTEM_LOG.OPERATOR_CODE%TYPE;
    w_TERMINAL_CODE MY_SYSTEM_LOG.TERMINAL_CODE%TYPE;
    w_PROGRAM_ID    MY_SYSTEM_LOG.PROGRAM_ID%TYPE;
    w_MESSAGE_ID    MY_SYSTEM_LOG.MESSAGE_ID%TYPE;
    w_MESSAGE_TEXT  MY_SYSTEM_LOG.MESSAGE_TEXT%TYPE;

BEGIN

    w_VERSION       := SUBSTRB(p_VERSION       ,1,10 );
    w_OWNER_CODE    := SUBSTRB(p_OWNER_CODE    ,1,2  );
    w_OPERATOR_CODE := SUBSTRB(p_OPERATOR_CODE ,1,10 );
    w_TERMINAL_CODE := SUBSTRB(p_TERMINAL_CODE ,1,4  );
    w_PROGRAM_ID    := SUBSTRB(p_PROGRAM_ID    ,1,30 );
    w_MESSAGE_ID    := SUBSTRB(p_MESSAGE_ID    ,1,4  );
    w_MESSAGE_TEXT  := SUBSTRB(p_MESSAGE_TEXT  ,1,999);

    ----------------------------
    --       ログ出力
    ----------------------------
    INSERT INTO MY_SYSTEM_LOG
        (
          RECNO
         ,TIME_STAMP
         ,VERSION
         ,OWNER_CODE
         ,OPERATOR_CODE
         ,TERMINAL_CODE
         ,PROGRAM_ID
         ,MESSAGE_ID
         ,MESSAGE_TEXT
        )
    VALUES
        (
          MY_SYSTEM_LOGSEQ.NEXTVAL                           -- RECNO
         ,TO_CHAR(SYSTIMESTAMP,'yyyy/mm/dd hh24:mi:ss.ff3')  -- TIME_STAMP
         ,NVL(w_VERSION,' ')                                 -- VERSION
         ,NVL(w_OWNER_CODE  ,' ')                            -- OWNER_CODE
         ,NVL(w_OPERATOR_CODE  ,' ')                         -- OPERATOR_CODE
         ,NVL(w_TERMINAL_CODE ,' ')                          -- TERMINAL_CODE
         ,NVL(w_PROGRAM_ID  ,' ')                            -- PROGRAM_ID
         ,NVL(w_MESSAGE_ID  ,' ')                            -- MESSAGE_ID
         ,NVL(w_MESSAGE_TEXT,' ')                            -- MESSAGE_TEXT
        );

    COMMIT;

    RETURN  SQLCODE;

EXCEPTION
    WHEN OTHERS THEN
    --DBMS_OUTPUT.PUT_LINE('エラーコード:'||SQLCODE);
    DBMS_OUTPUT.PUT_LINE(SQLERRM);
    RETURN SQLCODE;
END;
