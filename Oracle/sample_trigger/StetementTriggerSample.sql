CREATE OR REPLACE TRIGGER TRIGGER2
AFTER INSERT OR UPDATE 
ON TABLE1
REFERENCING OLD AS OLD NEW AS NEW
declare
    -- ローカル変数
    is_xxx    boolean;
    param1    varchar2(1);
begin

    if INSERTING then
        insert into TABLE2 (id, column1, column2) values ( 1 , 'a', 'b');

    elsif UPDATING then
        update  TABLE2
           set  COLUMN1 = 'st1'
               ,COLUMN2 = 'st2'
--         where  id = :new.id
        ;

    end if;

exception
    when others then
        raise;
end;
/

