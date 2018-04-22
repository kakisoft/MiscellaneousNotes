【 CREATE 】

CREATE TABLE DEVLOG
(
    ID       NUMBER(19,0) DEFAULT 0, 
    MESSAGE  NVARCHAR2(5000) 
)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
【 DROP 】

drop table DEVLOG purge;

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
【 INSERT 】

insert into DEVLOG (MESSAGE) values ('aaa');

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
【 SELECT 】

select * from DEVLOG

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
〓【 PL/SQL 】〓

＜IS と BEGINの間＞
errmessage varchar2(5000) := ' ';


errmessage := substr(SQLERRM,1,5000);
insert into DEVLOG (MESSAGE) values (errmessage);


※insert文に直接 SQLERRM を使用できない。


※※トランザクションを使用している場合、Rollbackを解除しておく！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━




