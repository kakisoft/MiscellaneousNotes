CREATE OR REPLACE TRIGGER ABCSYSTEM.TRIGGER1
AFTER INSERT OR UPDATE 
ON ABCSYSTEM.TABLE1
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW WHEN (NEW.ID > 100)
declare
    -- ローカル変数
    is_xxx    boolean;
    param1    varchar2(1);
begin

    if INSERTING then
        insert into TABLE2 (id, column1, column2) values ( :new.id ,
:new.column1, :new.column2);

    elsif UPDATING then
        update  TABLE2
           set  COLUMN1 = :new.column1
               ,COLUMN2 = :old.column2
         where  id = :new.id
        ;

    end if;

exception
    when others then
        raise;
end;
/

