## -
```sql
alter table syain add constraint fk foreign key (bcode) references bumon (code);
alter table 制約をかけるテーブル名 add constraint fk foreign key (制約をかけたいテーブルのカラム名) references 外部テーブル名 (外部テーブルの一意キー);


CONSTRAINT 制約キー制約名 FOREIGN KEY (制約をかけたいテーブルのカラム名) REFERENCES 外部テーブル名 (外部テーブルの一意キー) ENABLE
```
