set names utf8;
set foreign_key_checks=0;

drop database if exists rosso;
create database if not exists rosso;

use rosso;

create table user_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) unique not null comment "ユーザーID",
password varchar(16) not null comment "パスワード",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
sex tinyint default 0 comment "性別",
email varchar(32) comment "メールアドレス",
status tinyint default 0 comment "ステータス",
logined tinyint not null default 0 comment "ログインフラグ",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="会員情報テーブル"
;

create table product_info(
id int primary key not null auto_increment comment "ID",
product_id int unique not null comment "商品ID",
product_name varchar(100) unique not null comment "商品名",
product_name_kana varchar(100) unique not null comment "商品名かな",
product_description varchar(255) comment "商品詳細",
category_id int not null comment "カテゴリID",
price int not null comment "値段",
image_file_path varchar(100) not null comment "画像ファイルパス",
image_file_name varchar(50) not null comment "画像ファイル名",
release_date datetime comment "発売年月",
release_company varchar(50) comment "発売会社",
status tinyint default 1 comment "ステータス",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment="商品情報テーブル";

create table cart_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="カート情報テーブル"
;

create table purchase_history_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
product_id int not null comment "商品ID",
product_count int not null comment "個数",
price int not null comment "値段",
destination_id int not null comment "宛先情報ID",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id),
foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル"
;

create table destination_info(
id int primary key not null auto_increment comment "ID",
user_id varchar(16) not null comment "ユーザーID",
family_name varchar(32) not null comment "姓",
first_name varchar(32) not null comment "名",
family_name_kana varchar(32) not null comment "姓かな",
first_name_kana varchar(32) not null comment "名かな",
email varchar(32) comment "メールアドレス",
tel_number varchar(13) comment "電話番号",
user_address varchar(50) not null comment "住所",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時",
foreign key(user_id) references user_info(user_id)
)
default charset=utf8
comment="宛先情報テーブル"
;

create table m_category(
id int primary key not null auto_increment comment "ID",
category_id int not null unique comment "カテゴリID",
category_name varchar(20) not null unique comment "カテゴリ名",
category_description varchar(100) comment "カテゴリ詳細",
regist_date datetime  not null comment"登録日時",
update_date datetime comment "更新日時"
)
default charset=utf8
comment="カテゴリマスタテーブル"
;

set foreign_key_checks=1;

insert into user_info values
(1,"guest","guest","インターノウス","ゲストユーザー","いんたーのうす","げすとゆーざー",0,"guest@gmail.com",1,0,now(),now()),
(2,"guest2","guest2","インターノウス","ゲストユーザー2","いんたーのうす","げすとゆーざー2",0,"guest2@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","インターノウス","ゲストユーザー3","いんたーのうす","げすとゆーざー3",0,"guest3@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","インターノウス","ゲストユーザー4","いんたーのうす","げすとゆーざー4",0,"guest4@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","インターノウス","ゲストユーザー5","いんたーのうす","げすとゆーざー5",0,"guest5@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","インターノウス","ゲストユーザー6","いんたーのうす","げすとゆーざー6",0,"guest6@gmail.com",0,0,now(),now()),
(7,"guest7","guest7","インターノウス","ゲストユーザー7","いんたーのうす","げすとゆーざー7",0,"guest7@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","インターノウス","ゲストユーザー8","いんたーのうす","げすとゆーざー8",0,"guest8@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","インターノウス","ゲストユーザー9","いんたーのうす","げすとゆーざー9",0,"guest9@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","インターノウス","ゲストユーザー10","いんたーのうす","げすとゆーざー10",0,"guest10@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","インターノウス","ゲストユーザー11","いんたーのうす","げすとゆーざー11",0,"guest11@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","インターノウス","ゲストユーザー12","いんたーのうす","げすとゆーざー12",0,"guest12@gmail.com",0,0,now(),now());

insert into m_category values
(1,1,"全てのカテゴリー","本、家電・パソコン、おもちゃ・ゲーム全てのカテゴリーが対象となります",now(), now()),
(2,2,"本","本に関するカテゴリーが対象となります",now(),now()),
(3,3,"家電・パソコン","家電・パソコンに関するカテゴリーが対象となります",now(),now()),
(4,4,"おもちゃ・ゲーム","おもちゃ・ゲームに関するカテゴリーが対象となります",now(),now()),
(5,5,"CD","CDに関するカテゴリーが対象となります",now(),now());

insert into product_info values
( 1, 1,"小説","しょうせつ","全米が泣いた!超人気SF小説の続編!!",2,1200,"./images","book1.jpg",now(),"発売会社",1,now(),now()),
( 2, 2,"文庫本","ぶんこぼん","ドラマ化が決定したあの人気漫画を小説化!",2,800,"./images","book2.jpg",now(),"発売会社",1,now(),now()),
( 3, 3,"英語教材","えいごきょうざい","中学英語がこの一冊で学べる!!",2,1000,"./images","book3.jpg",now(),"発売会社",1,now(),now()),
( 4, 4,"万葉集","まんようしゅう","万葉集を現代と結びつけて簡単解説!",2,2100,"./images","book4.jpg",now(),"発売会社",1,now(),now()),
( 5, 5,"和歌集","わかしゅう","和歌を季節/人物ごとに紹介!",2,1500,"./images","book5.jpg",now(),"発売会社",1,now(),now()),
( 6,6,"エアコン","えあこん","【SALE】人気メーカーの新型エアコン",3,19980,"./images","homeAppliance1.jpg",now(),"発売会社",1,now(),now()),
( 7,7,"洗濯機","せんたくき","大容量で乾燥機付き・家族向け",3,11580,"./images","homeAppliance2.jpg",now(),"発売会社",1,now(),now()),
( 8,8,"モニター","もにたー","【SALE】17インチモニター・型落ちにつき大特価!!",3,2980,"./images","homeAppliance3.jpg",now(),"発売会社",1,now(),now()),
( 9,9,"ノートパソコン","のーとぱそこん","人気メーカー薄型パソコン登場!!今が変え時!?",3,37980,"./images","homeAppliance4.jpg",now(),"発売会社",1,now(),now()),
( 10,10,"ハンディファン","はんでぃふぁん","お出かけにもとっても便利",3,990,"./images","homeAppliance5.jpg",now(),"発売会社",1,now(),now()),
( 11,11,"おもちゃセット","おもちゃせっと","プレゼントに!女の子用",4,2300,"./images","toy1.jpg",now(),"発売会社",1,now(),now()),
( 12,12,"けん玉","けんだま","けん玉",4,350,"./images","toy2.jpg",now(),"発売会社",1,now(),now()),
( 13,13,"ミニレースカー","みにれーすかー","ミニレースカー",4,500,"./images","toy3.jpg",now(),"発売会社",1,now(),now()),
( 14,14,"おしゃべりロボット","おしゃべりろぼっと","おしゃべりロボット",4,2700,"./images","toy4.jpg",now(),"発売会社",1,now(),now()),
( 15,15,"ドローン","どろーん","ドローン登場!初心者でも簡単操作、解説CD付き",4,45980,"./images","toy5.jpg",now(),"発売会社",1,now(),now()),
( 16,16,"J-POP CD","J-POP CD","懐かしの歌謡曲集",5,1200,"./images","cd1.jpg",now(),"発売会社",1,now(),now()),
( 17,17,"クラシック CD","くらしっく CD","モーツァルト",5,2400,"./images","cd2.jpg",now(),"発売会社",1,now(),now()),
( 18,18,"ジャズ CD","じゃず CD","サックスソロCD",5,1800,"./images","cd3.jpg",now(),"発売会社",1,now(),now()),
( 19,19,"V系バンド CD","ぶいけいばんど CD","次にくる!?若手人気バンドメジャーデビュー",5,1000,"./images","cd4.jpg",now(),"発売会社",1,now(),now()),
( 20,20,"アイドル CD","あいどる CD","握手券/チェキ1枚が特典でついてくる!",5,1500,"./images","cd5.jpg",now(),"発売会社",1,now(),now());
