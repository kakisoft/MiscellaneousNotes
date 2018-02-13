CREATE TABLE TABLE3
(
    ID          NUMBER(10,0) DEFAULT 0 NOT NULL
   ,COLUMN1     VARCHAR2(50)
   ,COLUMN2     VARCHAR2(50)
   ,COLUMN3     VARCHAR2(50)
   ,COLUMN4     VARCHAR2(50)
   ,COLUMN5     VARCHAR2(50)
   ,CONSTRAINT TABLE3_PK PRIMARY KEY (ID) USING INDEX
        PCTFREE 10
        INITRANS 2
        MAXTRANS 255
        --TABLESPACE KAKIP1
        STORAGE(INITIAL 64K MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
        LOGGING
)
PCTFREE 5
MAXTRANS 255
--TABLESPACE KAKIP1
STORAGE(INITIAL 6M MINEXTENTS 1 MAXEXTENTS 2147483645 BUFFER_POOL DEFAULT)
NOCACHE
LOGGING
;
COMMENT ON TABLE TABLE3 IS 'TABLE3';
COMMENT ON COLUMN TABLE3.COLUMN1 IS 'COLUMN1';
COMMENT ON COLUMN TABLE3.COLUMN2 IS 'COLUMN2';
COMMENT ON COLUMN TABLE3.COLUMN3 IS 'COLUMN3';
COMMENT ON COLUMN TABLE3.COLUMN4 IS 'COLUMN4';
COMMENT ON COLUMN TABLE3.COLUMN5 IS 'COLUMN5';
