/*
  2024.6.1 rev.0
  サンプルデータ（sampledb、2～7章で使用）
*/

DROP VIEW IF EXISTS コース別人数一覧;
DROP VIEW IF EXISTS meibo01;
DROP VIEW IF EXISTS meibo02;
DROP TABLE IF EXISTS exams;
DROP TABLE IF EXISTS exams_with_serial;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS branch_course_master;
DROP TABLE IF EXISTS branch_master;
DROP TABLE IF EXISTS course_master;

/*
# branch_master, students
*/
CREATE TABLE branch_master ( 
    branch VARCHAR(255) NOT NULL, 
    PRIMARY KEY (branch)
);
INSERT INTO branch_master VALUES ('池袋'), ('新宿'), ('渋谷'), ('品川');

CREATE TABLE students (
    student_id CHAR(5) NOT NULL PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    student_yomi VARCHAR(255) NOT NULL,
    home_phone VARCHAR(255) NOT NULL,
    mobile_phone VARCHAR(255),
    school VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    FOREIGN KEY (branch) REFERENCES branch_master (branch)
);

INSERT INTO students (student_id,student_name,student_yomi,home_phone,mobile_phone,school,branch) VALUES
('C0001','谷内 ミケ','タニウチ ミケ','036570242X','0906297314X','港第五中学校','渋谷'),
('C0002','山村 つくね','ヤマムラ ツクネ','043629229X',NULL,'三毛猫学院中学校','池袋'),
('C0003','北川 ジョン','キタガワ ジョン','039214134X','0803409789X','新宿第六中学校','新宿'),
('C0004','上野 おさむ','ウエノ オサム','031318452X','0907548352X','足立第三中学校','新宿'),
('C0005','相馬 瑠璃','ソウマ ルリ','045132617X','0803982904X','大和猫東中学校','池袋'),
('C0006','麻生 鈴','アソウ スズ','034148958X','0902711375X','シマリス中学校','渋谷'),
('C0007','井坂 ライカ','イサカ ライカ','038825045X','0809082373X','新宿第二中学校','新宿'),
('C0008','入江 あおい','イリエ アオイ','035457533X','0802544580X','江戸川第二中学校','新宿'),
('C0009','九十九 つぶ','ツクモ ツブ','045060556X','0801204519X','成田シマリス学園中学校','渋谷'),
('C0010','春日 ゆず','カスガ ユズ','037076225X',NULL,'港第二中学校','新宿'),
('C0011','泉 観音','イズミ カノン','035618611X',NULL,'世田谷第五中学校','新宿'),
('C0012','古賀 晩白柚','コガ バンペイユ','036994565X','0909526963X','港第三中学校','渋谷'),
('C0013','池田 千代','イケダ チヨ','038939932X',NULL,'品川第一中学校','池袋'),
('C0014','伊藤 ラテ','イトウ ラテ','032834531X','0802678222X','新宿第一中学校','新宿'),
('C0015','関 アプリ','セキ アプリ','046768326X','0904885043X','大和猫中央中学校','池袋'),
('C0016','石田 フジ','イシダ フジ','034123974X','0901436324X','練馬第七中学校','池袋'),
('C0017','来栖 麻呂','クルス マロ','034249385X',NULL,'東村山猫八中学校','品川'),
('C0018','神谷 かりん','カミヤ カリン','032084838X','0906040038X','港第五中学校','品川'),
('C0019','洗足 柿の介','センゾク カキノスケ','045845177X','0808645073X','大和猫中央中学校','新宿'),
('C0020','川村 イチゴ','カワムラ イチゴ','037899078X','0808190664X','新宿第一中学校','新宿'),
('C0021','白山 猫太','シロヤマ ネコタ','033552104X','0802013593X','猫山学園付属中学校','渋谷'),
('C0022','駒田 萌黄','コマダ モエギ','031041914X','0805697810X','港第五中学校','新宿'),
('C0023','北森 カノン','キタモリ カノン','035095761X','0907893397X','渋谷第五中学校','渋谷'),
('C0024','田村 さら','タムラ サラ','045013375X',NULL,'大和猫南中学校','品川'),
('C0025','小泉 大河','コイズミ タイガ','032273930X','0905599339X','足立第二中学校','池袋'),
('C0026','阿部 メイ','アベ メイ','031720972X','0905872104X','小平ワン吉中学校','新宿'),
('C0027','知念 マック','チネン マック','043342905X','0901594667X','ハシビロ付属中学校','新宿'),
('C0028','杉本 アジ','スギモト アジ','045421238X','0909122312X','令花中学校','新宿'),
('C0029','梅田 りす','ウメダ リス','039316031X',NULL,'千代田第六中学校','渋谷'),
('C0030','大村 むさし','オオムラ ムサシ','038037173X','0906535123X','大田第五中学校','渋谷'),
('C0031','子安 浅黄','コヤス アサギ','037907322X','0804466312X','調布タヌ里中学校','新宿'),
('C0032','津田 つばめ','ツダ ツバメ','042768917X','0904218922X','ヤマセミ大学付属中学校','池袋'),
('C0033','信濃 豪','シナノ ゴウ','045008522X','0901097782X','大和猫西中学校','品川'),
('C0034','月本 ひばり','ツキモト ヒバリ','047583712X','0903378357X','いすみ美々猫中学校','池袋'),
('C0035','久保 プラム','クボ プラム','035257234X','0908812638X','みくら猛虎中学校','渋谷'),
('C0036','車田 るる','クルマダ ルル','031658637X',NULL,'猫山学園付属中学校','品川'),
('C0037','千石 真珠','センゴク シンジュ','046906532X','0903594293X','大和猫西中学校','品川'),
('C0038','浦川 まさる','ウラカワ マサル','030624150X','0803794040X','港第七中学校','渋谷'),
('C0039','柴田 舞','シバタ マイケル','035774631X','0809238625X','多摩シロネコ中学校','新宿'),
('C0040','歌丸 納言','ウタマル ナゴン','035892018X',NULL,'猫田インターナショナル中学校','品川'),
('C0041','緑川 タヌキ','ミドリカワ タヌキ','037700269X','0803075953X','メインクーン中学校','池袋'),
('C0042','蔦屋 ささみ','ツタヤ ササミ','037490673X',NULL,'千代田第六中学校','渋谷'),
('C0043','唐沢 あやめ','カラサワ アヤメ','033069922X','0904947240X','豊島第一中学校','池袋'),
('C0044','吉祥寺 チコリ','キチジョウジ チコリ','036137556X','0808412787X','新宿第一中学校','新宿'),
('C0045','海老名 マイケル','エビナ マイケル','032351624X','0801513555X','新宿第四中学校','新宿'),
('C0046','臼井 しい','ウスイ シイ','037873475X','0909887434X','白木チンチラ中学校','渋谷'),
('C0047','竹原 悟空','タケハラ ゴクウ','042652215X','0806195248X','越谷シマリス学園中学校','渋谷'),
('C0048','周防 花','スオウ ハナ','046703744X','0907209877X','大和猫東中学校','池袋'),
('C0049','井ノ口 蘭','イノグチ ラン','030887519X',NULL,'渋谷第五中学校','渋谷'),
('C0050','瀬尾 オルカ','セオ オルカ','035015719X',NULL,'江戸川第二中学校','新宿'),
('C0051','塩野 りぼん','シオノ リボン','030209597X',NULL,'メインクーン中学校','池袋'),
('C0052','谷田 雪','ヤツダ ユキ','035520913X','0801764195X','猫田インターナショナル中学校','品川'),
('C0053','佐々木 ルビィ','ササキ ルビィ','032499165X','0806997308X','猫田インターナショナル中学校','品川'),
('C0054','土屋 クルトン','ツチヤ クルトン','038630649X','0803113814X','港第四中学校','品川'),
('C0055','五十嵐 ポン太','イガラシ ポンタ','036869526X','0908535683X','新宿第一中学校','新宿'),
('C0056','力石 雫','リキイシ シズク','038661710X',NULL,'港第六中学校','渋谷'),
('C0057','平 チャイ','タイラ チャイ','042502181X','0906709442X','山武カラス田中学校','渋谷'),
('C0058','斉藤 スピカ','サイトウ スピカ','034410898X','0904367847X','千代田第六中学校','渋谷'),
('C0059','温井 珊瑚','ヌクイ サンゴ','036939408X','0905034076X','渋谷第二中学校','渋谷'),
('C0060','倉敷 ミント','クラシキ ミント','037996919X',NULL,'千代田第二中学校','新宿'),
('C0061','越野 カシス','コシノ カシス','034314655X','0902813381X','港第二中学校','品川'),
('C0062','遠藤 ジョージ','エンドウ ジョージ','033606846X','0907503150X','中央第三中学校','渋谷'),
('C0063','林 シアン','ハヤシ シアン','039050515X','0905873898X','中央第六中学校','渋谷'),
('C0064','加藤 つくし','カトウ ツクシ','038767949X','0806799260X','千代田第四中学校','渋谷'),
('C0065','一色 コニカ','イッシキ コニカ','032047027X','0807862712X','猫山学園付属中学校','渋谷'),
('C0066','小田原 小春','オダワラ コハル','036890069X','0906068526X','新宿第六中学校','新宿'),
('C0067','飯田 小麦','イイダ コムギ','031213312X','0805918541X','杉並第八中学校','新宿'),
('C0068','内村 離寛','ウチムラ リカン','031169045X','0805093203X','江戸川第六中学校','新宿'),
('C0069','戸田 五月','トダ サツキ','039991311X','0906477814X','渋谷第六中学校','渋谷'),
('C0070','佐伯 鯖','サイキ サバ','034802369X','0903611429X','港第三中学校','新宿'),
('C0071','桜田 きなこ','サクラダ キナコ','038498905X','0909895897X','足立第一中学校','新宿'),
('C0072','須田 チカ','スダ チカ','045954788X','0804559655X','令花中学校','新宿'),
('C0073','国生 タマリ','コクショウ タマリ','036330028X','0907418387X','新宿第三中学校','新宿'),
('C0074','瀬川 フセン','セガワ フセン','047314983X','0804851270X','市原しろねこ中学校','品川'),
('C0075','魚住 ペコ','ウオズミ ペコ','039953316X','0904924707X','千代田第四中学校','渋谷'),
('C0076','小金井 ジャスミン','コガネイ ジャスミン','035486011X','0909887946X','新宿第三中学校','新宿'),
('C0077','宍戸 犬太郎','シシド イヌタロウ','036497643X','0808213323X','港第三中学校','新宿'),
('C0078','秋谷 桜','アキタニ サクラ','034098862X',NULL,'港第三中学校','新宿'),
('C0079','織田 茶々','オダ チャチャ','038771950X','0905715241X','板橋第三中学校','池袋'),
('C0080','赤池 海','アカイケ ウミ','034927260X','0903875793X','千代田第六中学校','渋谷'),
('C0081','雑司が谷 栗三郎','ゾウシガヤ クリサブロウ','043470050X','0909481435X','玄鳥はばたき中学校','池袋'),
('C0082','渋谷 蓮','シブヤ レン','030650682X','0806446802X','江東第一中学校','池袋'),
('C0083','柏原 ミズキ','カシワバラ ミズキ','033000043X','0807061607X','渋谷第八中学校','渋谷'),
('C0084','佐藤 茜','サトウ アカネ','037258108X','0907287082X','おうめ時枝中学校','新宿'),
('C0085','地井 エル','チイ エル','044160178X','0906816790X','いすみ美々猫中学校','池袋'),
('C0086','酒井 ルイ','サカイ ルイ','035587159X','0802242326X','千代田第七中学校','渋谷'),
('C0087','鶴川 ノエル','ツルカワ ノエル','049630446X','0906115411X','コンドル学園中学校','品川'),
('C0088','阿川 みたらし','アガワ ミタラシ','037114827X','0908091624X','港第八中学校','渋谷'),
('C0089','岡田 佐助','オカダ サスケ','034724522X','0902274693X','足立第一中学校','池袋'),
('C0090','浅野 マル','アサノ マル','038890583X','0802314868X','千代田第七中学校','渋谷'),
('C0091','高橋 ココア','タカハシ ココア','043987685X',NULL,'越谷シマリス学園中学校','渋谷'),
('C0092','安室 ももか','アムロ モモカ','037528840X','0802440524X','新宿第一中学校','新宿'),
('C0093','下村 ハイネ','シモムラ ハイネ','034002093X','0906737885X','猫山学園付属中学校','渋谷'),
('C0094','大田 小太郎','オオタ コタロウ','037343073X','0806960810X','世田谷第一中学校','品川'),
('C0095','軽部 みかん','カルベ ミカン','034677964X',NULL,'港第二中学校','品川'),
('C0096','坂上 もち','サカノウエ モチ','039926695X','0904089427X','練馬第八中学校','池袋'),
('C0097','外川 きみ','ソトカワ キミ','041508074X','0804877453X','アオサギ中学校','池袋'),
('C0098','小野 トシ','オノ トシ','032971498X','0904528995X','新宿第三中学校','新宿'),
('C0099','熊本 ピア','クマモト ピア','033306223X','0806369797X','世田谷第八中学校','渋谷'),
('C0100','堂本 しろみ','ドウモト シロミ','045785766X','0803095662X','令花中学校','新宿'),
('C0101','西城 タラバ','サイジョウ タラバ','030170625X','0906808360X','中央第六中学校','渋谷'),
('C0102','栗山 かめぞう','カメヤマ カメゾウ','031317109X','0903063037X','中央第三中学校','渋谷'),
('C0103','東山 ミント','ヒガシヤマ ミント','044740674X','0906243824X','あつぎ寒猫中学校','新宿'),
('C0104','志木 トップ','シギ トップ','043270087X','0803629418X','ヤマブキ寅猫中学校','新宿'),
('C0105','滝田 豆','タキタ マメ','045196421X','0904270202X','プードル学園中学校','新宿'),
('C0106','末広 瓜','スエヒロ ウリ','044269324X',NULL,'大和猫西中学校','品川'),
('C0107','井上 カタクリ','イノウエ カタクリ','036431367X','0904220380X','杉並第三中学校','新宿'),
('C0108','岸田 アルト','キシダ アルト','037098193X','0808763120X','板橋第三中学校','新宿'),
('C0109','中井 チーズ','ナカイ チーズ','046604370X','0806492030X','セキレイ第三中学校','池袋'),
('C0110','東 福太郎','ヒガシ フクタロウ','030897925X','0806860097X','新宿第四中学校','新宿'),
('C0111','匠 輝','タクミ キララ','032557846X','0903338494X','葛飾第三中学校','新宿'),
('C0112','今井 緑','イマイ ミドリ','034971541X','0809247414X','新宿第三中学校','新宿'),
('C0113','羽田野 ミイ','ハタノ ミイ','046507460X','0902669179X','藤沢たぬ城中学校','新宿'),
('C0114','青木 空','アオキ ソラ','037808169X','0901793519X','新宿第一中学校','新宿'),
('C0115','久米 セル','クメ セル','033251584X',NULL,'新宿第一中学校','新宿'),
('C0116','木村 幸水','キムラ コウスイ','036141929X','0804516986X','港第三中学校','新宿'),
('C0117','安住 おはぎ','アズミ オハギ','033149550X','0903449301X','猫山学園付属中学校','品川'),
('C0118','岡山 佐介','オカヤマ サスケ','048931130X','0903794205X','フクロウ学園大学付属中学校','池袋'),
('C0119','市東 ウィキ','イトウ ウィキ','044014851X','0902667836X','令和犬猫学院中学校','渋谷'),
('C0120','左近 するめ','サコン スルメ','032121536X','0908769315X','世田谷第八中学校','新宿');


/*
# course_master, courses
  courseは選択コース、ここではまだ国語、英語、数学のみだが、
  本来は国語R、国語N、国語Sのように難易度別に3コースに分かれている。
  生徒は国語R、英語Nのように各科目で組み合わせて受講する。
  英語Nと英語Sを受講することはできない。
*/


CREATE TABLE course_master ( 
    course VARCHAR(255) NOT NULL, 
    PRIMARY KEY (course)
);

INSERT INTO course_master VALUES('国語'), ('英語'), ('数学');

CREATE TABLE courses ( 
    student_id CHAR(5) NOT NULL, 
    course VARCHAR(255) NOT NULL, 
    PRIMARY KEY (student_id, course),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course) REFERENCES course_master(course)
);


INSERT INTO courses (student_id, course) VALUES ('C0001','国語'),('C0001','英語'),('C0001','数学');
INSERT INTO courses (student_id, course) VALUES ('C0002','英語'),('C0002','数学');
INSERT INTO courses (student_id, course) VALUES ('C0003','国語'),('C0003','英語'),('C0003','数学');
INSERT INTO courses (student_id, course) VALUES ('C0004','国語'),('C0004','英語'),('C0004','数学');
INSERT INTO courses (student_id, course) VALUES ('C0005','数学');
INSERT INTO courses (student_id, course) VALUES ('C0006','英語'),('C0006','数学');
INSERT INTO courses (student_id, course) VALUES ('C0007','国語'),('C0007','英語');
INSERT INTO courses (student_id, course) VALUES ('C0008','数学');
INSERT INTO courses (student_id, course) VALUES ('C0009','国語'),('C0009','英語'),('C0009','数学');
INSERT INTO courses (student_id, course) VALUES ('C0010','英語'),('C0010','数学');
INSERT INTO courses (student_id, course) VALUES ('C0011','国語'),('C0011','英語'),('C0011','数学');
INSERT INTO courses (student_id, course) VALUES ('C0012','国語'),('C0012','英語');
INSERT INTO courses (student_id, course) VALUES ('C0013','数学');
INSERT INTO courses (student_id, course) VALUES ('C0014','国語'),('C0014','英語'),('C0014','数学');
INSERT INTO courses (student_id, course) VALUES ('C0015','国語'),('C0015','英語'),('C0015','数学');
INSERT INTO courses (student_id, course) VALUES ('C0016','国語'),('C0016','英語'),('C0016','数学');
INSERT INTO courses (student_id, course) VALUES ('C0017','数学');
INSERT INTO courses (student_id, course) VALUES ('C0018','英語');
INSERT INTO courses (student_id, course) VALUES ('C0019','国語'),('C0019','英語');
INSERT INTO courses (student_id, course) VALUES ('C0020','国語'),('C0020','英語'),('C0020','数学');
INSERT INTO courses (student_id, course) VALUES ('C0021','国語'),('C0021','英語'),('C0021','数学');
INSERT INTO courses (student_id, course) VALUES ('C0022','英語'),('C0022','数学');
INSERT INTO courses (student_id, course) VALUES ('C0023','国語'),('C0023','英語'),('C0023','数学');
INSERT INTO courses (student_id, course) VALUES ('C0024','数学');
INSERT INTO courses (student_id, course) VALUES ('C0025','国語'),('C0025','英語'),('C0025','数学');
INSERT INTO courses (student_id, course) VALUES ('C0026','国語'),('C0026','英語'),('C0026','数学');
INSERT INTO courses (student_id, course) VALUES ('C0027','国語'),('C0027','英語'),('C0027','数学');
INSERT INTO courses (student_id, course) VALUES ('C0028','英語'),('C0028','数学');
INSERT INTO courses (student_id, course) VALUES ('C0029','英語'),('C0029','数学');
INSERT INTO courses (student_id, course) VALUES ('C0030','国語'),('C0030','英語'),('C0030','数学');
INSERT INTO courses (student_id, course) VALUES ('C0031','国語'),('C0031','数学');
INSERT INTO courses (student_id, course) VALUES ('C0032','国語'),('C0032','数学');
INSERT INTO courses (student_id, course) VALUES ('C0033','英語'),('C0033','数学');
INSERT INTO courses (student_id, course) VALUES ('C0034','国語'),('C0034','英語'),('C0034','数学');
INSERT INTO courses (student_id, course) VALUES ('C0035','国語'),('C0035','英語'),('C0035','数学');
INSERT INTO courses (student_id, course) VALUES ('C0036','英語'),('C0036','数学');
INSERT INTO courses (student_id, course) VALUES ('C0037','英語'),('C0037','数学');
INSERT INTO courses (student_id, course) VALUES ('C0038','数学');
INSERT INTO courses (student_id, course) VALUES ('C0039','英語');
INSERT INTO courses (student_id, course) VALUES ('C0040','英語'),('C0040','数学');
INSERT INTO courses (student_id, course) VALUES ('C0041','英語'),('C0041','数学');
INSERT INTO courses (student_id, course) VALUES ('C0042','国語'),('C0042','英語'),('C0042','数学');
INSERT INTO courses (student_id, course) VALUES ('C0043','英語'),('C0043','数学');
INSERT INTO courses (student_id, course) VALUES ('C0044','国語'),('C0044','英語'),('C0044','数学');
INSERT INTO courses (student_id, course) VALUES ('C0045','国語'),('C0045','数学');
INSERT INTO courses (student_id, course) VALUES ('C0046','国語'),('C0046','英語'),('C0046','数学');
INSERT INTO courses (student_id, course) VALUES ('C0047','国語'),('C0047','英語'),('C0047','数学');
INSERT INTO courses (student_id, course) VALUES ('C0048','数学');
INSERT INTO courses (student_id, course) VALUES ('C0049','国語'),('C0049','英語'),('C0049','数学');
INSERT INTO courses (student_id, course) VALUES ('C0050','国語'),('C0050','英語'),('C0050','数学');
INSERT INTO courses (student_id, course) VALUES ('C0051','英語'),('C0051','数学');
INSERT INTO courses (student_id, course) VALUES ('C0052','英語'),('C0052','数学');
INSERT INTO courses (student_id, course) VALUES ('C0053','英語'),('C0053','数学');
INSERT INTO courses (student_id, course) VALUES ('C0054','英語'),('C0054','数学');
INSERT INTO courses (student_id, course) VALUES ('C0055','国語'),('C0055','英語'),('C0055','数学');
INSERT INTO courses (student_id, course) VALUES ('C0056','国語'),('C0056','英語'),('C0056','数学');
INSERT INTO courses (student_id, course) VALUES ('C0057','国語'),('C0057','英語'),('C0057','数学');
INSERT INTO courses (student_id, course) VALUES ('C0058','英語'),('C0058','数学');
INSERT INTO courses (student_id, course) VALUES ('C0059','英語'),('C0059','数学');
INSERT INTO courses (student_id, course) VALUES ('C0060','国語'),('C0060','英語'),('C0060','数学');
INSERT INTO courses (student_id, course) VALUES ('C0061','英語'),('C0061','数学');
INSERT INTO courses (student_id, course) VALUES ('C0062','英語');
INSERT INTO courses (student_id, course) VALUES ('C0063','英語'),('C0063','数学');
INSERT INTO courses (student_id, course) VALUES ('C0064','国語'),('C0064','英語');
INSERT INTO courses (student_id, course) VALUES ('C0065','国語'),('C0065','英語'),('C0065','数学');
INSERT INTO courses (student_id, course) VALUES ('C0066','英語'),('C0066','数学');
INSERT INTO courses (student_id, course) VALUES ('C0067','国語'),('C0067','英語'),('C0067','数学');
INSERT INTO courses (student_id, course) VALUES ('C0068','国語'),('C0068','英語');
INSERT INTO courses (student_id, course) VALUES ('C0069','国語'),('C0069','英語'),('C0069','数学');
INSERT INTO courses (student_id, course) VALUES ('C0070','国語'),('C0070','英語');
INSERT INTO courses (student_id, course) VALUES ('C0071','国語'),('C0071','英語'),('C0071','数学');
INSERT INTO courses (student_id, course) VALUES ('C0072','国語'),('C0072','英語'),('C0072','数学');
INSERT INTO courses (student_id, course) VALUES ('C0073','国語'),('C0073','英語'),('C0073','数学');
INSERT INTO courses (student_id, course) VALUES ('C0074','英語'),('C0074','数学');
INSERT INTO courses (student_id, course) VALUES ('C0075','国語'),('C0075','英語');
INSERT INTO courses (student_id, course) VALUES ('C0076','国語'),('C0076','数学');
INSERT INTO courses (student_id, course) VALUES ('C0077','国語'),('C0077','英語'),('C0077','数学');
INSERT INTO courses (student_id, course) VALUES ('C0078','国語'),('C0078','英語'),('C0078','数学');
INSERT INTO courses (student_id, course) VALUES ('C0079','国語'),('C0079','英語'),('C0079','数学');
INSERT INTO courses (student_id, course) VALUES ('C0080','国語'),('C0080','英語'),('C0080','数学');
INSERT INTO courses (student_id, course) VALUES ('C0081','英語'),('C0081','数学');
INSERT INTO courses (student_id, course) VALUES ('C0082','英語'),('C0082','数学');
INSERT INTO courses (student_id, course) VALUES ('C0083','国語'),('C0083','英語'),('C0083','数学');
INSERT INTO courses (student_id, course) VALUES ('C0084','国語'),('C0084','英語'),('C0084','数学');
INSERT INTO courses (student_id, course) VALUES ('C0085','国語'),('C0085','英語'),('C0085','数学');
INSERT INTO courses (student_id, course) VALUES ('C0086','英語'),('C0086','数学');
INSERT INTO courses (student_id, course) VALUES ('C0087','英語'),('C0087','数学');
INSERT INTO courses (student_id, course) VALUES ('C0088','国語'),('C0088','英語'),('C0088','数学');
INSERT INTO courses (student_id, course) VALUES ('C0089','国語'),('C0089','英語'),('C0089','数学');
INSERT INTO courses (student_id, course) VALUES ('C0090','英語'),('C0090','数学');
INSERT INTO courses (student_id, course) VALUES ('C0091','国語'),('C0091','英語'),('C0091','数学');
INSERT INTO courses (student_id, course) VALUES ('C0092','国語'),('C0092','英語'),('C0092','数学');
INSERT INTO courses (student_id, course) VALUES ('C0093','国語'),('C0093','英語'),('C0093','数学');
INSERT INTO courses (student_id, course) VALUES ('C0094','英語'),('C0094','数学');
INSERT INTO courses (student_id, course) VALUES ('C0095','英語'),('C0095','数学');
INSERT INTO courses (student_id, course) VALUES ('C0096','英語'),('C0096','数学');
INSERT INTO courses (student_id, course) VALUES ('C0097','国語'),('C0097','英語'),('C0097','数学');
INSERT INTO courses (student_id, course) VALUES ('C0098','国語'),('C0098','英語');
INSERT INTO courses (student_id, course) VALUES ('C0099','国語'),('C0099','英語');
INSERT INTO courses (student_id, course) VALUES ('C0100','英語'),('C0100','数学');
INSERT INTO courses (student_id, course) VALUES ('C0101','英語');
INSERT INTO courses (student_id, course) VALUES ('C0102','国語'),('C0102','英語'),('C0102','数学');
INSERT INTO courses (student_id, course) VALUES ('C0103','国語'),('C0103','英語');
INSERT INTO courses (student_id, course) VALUES ('C0104','英語'),('C0104','数学');
INSERT INTO courses (student_id, course) VALUES ('C0105','英語'),('C0105','数学');
INSERT INTO courses (student_id, course) VALUES ('C0106','数学');
INSERT INTO courses (student_id, course) VALUES ('C0107','英語'),('C0107','数学');
INSERT INTO courses (student_id, course) VALUES ('C0108','国語'),('C0108','英語'),('C0108','数学');
INSERT INTO courses (student_id, course) VALUES ('C0109','英語');
INSERT INTO courses (student_id, course) VALUES ('C0110','国語'),('C0110','英語'),('C0110','数学');
INSERT INTO courses (student_id, course) VALUES ('C0111','国語'),('C0111','英語'),('C0111','数学');
INSERT INTO courses (student_id, course) VALUES ('C0112','国語'),('C0112','英語'),('C0112','数学');
INSERT INTO courses (student_id, course) VALUES ('C0113','国語'),('C0113','英語'),('C0113','数学');
INSERT INTO courses (student_id, course) VALUES ('C0114','国語'),('C0114','英語'),('C0114','数学');
INSERT INTO courses (student_id, course) VALUES ('C0115','国語'),('C0115','英語'),('C0115','数学');
INSERT INTO courses (student_id, course) VALUES ('C0116','国語'),('C0116','英語');
INSERT INTO courses (student_id, course) VALUES ('C0117','英語'),('C0117','数学');
INSERT INTO courses (student_id, course) VALUES ('C0118','英語'),('C0118','数学');
INSERT INTO courses (student_id, course) VALUES ('C0119','国語'),('C0119','英語'),('C0119','数学');
INSERT INTO courses (student_id, course) VALUES ('C0120','国語'),('C0120','英語'),('C0120','数学');

/*
# exams
subjectは試験科目、コースを選択していなくても共通模試を受けることがある
受験は任意で、受けられなかった場合、希望者には翌日同じ問題で実施、実施率はかなり高い
同日に3科目実施するが、第44回は天候が悪く遠くから来ている子は欠席または1，2科目しか受けられなかった
*/

CREATE TABLE exams ( 
    student_id CHAR(5) NOT NULL, 
    exam_no integer NOT NULL,
    subject VARCHAR(255) NOT NULL CHECK (subject='国語'
                   OR subject='数学' OR subject='英語'),
    score INTEGER NOT NULL, CONSTRAINT score_limit CHECK(0 <= score and score <= 100),
    PRIMARY KEY (student_id, exam_no, subject),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- SQL Serverの場合は ON DELETE RESTRICT の代わりに ON DELETE NO ACTION とする
-- (DELETEで外部キー制約違反が発生した場合にトランザクションをロールバックするため、RESTRICTと同じ動作になる)

/*
## no 41
*/
-- DELETE FROM exams WHERE exam_no=41;
INSERT INTO exams VALUES ('C0001',41,'国語',90),('C0001',41,'英語',86),('C0001',41,'数学',93);
INSERT INTO exams VALUES ('C0002',41,'国語',95),('C0002',41,'英語',80),('C0002',41,'数学',92);
INSERT INTO exams VALUES ('C0003',41,'国語',84),('C0003',41,'英語',61),('C0003',41,'数学',82);
INSERT INTO exams VALUES ('C0004',41,'国語',59),('C0004',41,'英語',49),('C0004',41,'数学',41);
INSERT INTO exams VALUES ('C0005',41,'国語',80),('C0005',41,'英語',65),('C0005',41,'数学',75);
INSERT INTO exams VALUES ('C0006',41,'国語',36),('C0006',41,'英語',47),('C0006',41,'数学',43);
INSERT INTO exams VALUES ('C0007',41,'国語',75),('C0007',41,'英語',72),('C0007',41,'数学',69);
INSERT INTO exams VALUES ('C0008',41,'国語',94),('C0008',41,'英語',100),('C0008',41,'数学',93);
INSERT INTO exams VALUES ('C0009',41,'国語',64),('C0009',41,'英語',66),('C0009',41,'数学',74);
INSERT INTO exams VALUES ('C0010',41,'国語',83),('C0010',41,'英語',75),('C0010',41,'数学',83);
INSERT INTO exams VALUES ('C0011',41,'国語',79),('C0011',41,'英語',90),('C0011',41,'数学',80);
INSERT INTO exams VALUES ('C0012',41,'国語',87),('C0012',41,'英語',62),('C0012',41,'数学',77);
INSERT INTO exams VALUES ('C0013',41,'国語',65),('C0013',41,'英語',67),('C0013',41,'数学',78);
INSERT INTO exams VALUES ('C0014',41,'国語',94),('C0014',41,'英語',80),('C0014',41,'数学',80);
INSERT INTO exams VALUES ('C0015',41,'国語',93),('C0015',41,'英語',65),('C0015',41,'数学',80);
INSERT INTO exams VALUES ('C0016',41,'国語',81),('C0016',41,'英語',89),('C0016',41,'数学',84);
INSERT INTO exams VALUES ('C0017',41,'国語',90),('C0017',41,'英語',79),('C0017',41,'数学',80);
INSERT INTO exams VALUES ('C0018',41,'国語',81),('C0018',41,'英語',78),('C0018',41,'数学',85);
INSERT INTO exams VALUES ('C0019',41,'国語',60),('C0019',41,'英語',61),('C0019',41,'数学',38);
INSERT INTO exams VALUES ('C0020',41,'国語',96),('C0020',41,'英語',97),('C0020',41,'数学',78);
INSERT INTO exams VALUES ('C0021',41,'国語',74),('C0021',41,'英語',68),('C0021',41,'数学',81);
INSERT INTO exams VALUES ('C0022',41,'国語',78),('C0022',41,'英語',65),('C0022',41,'数学',61);
INSERT INTO exams VALUES ('C0023',41,'国語',89),('C0023',41,'英語',92),('C0023',41,'数学',95);
INSERT INTO exams VALUES ('C0024',41,'国語',75),('C0024',41,'英語',86),('C0024',41,'数学',86);
INSERT INTO exams VALUES ('C0025',41,'国語',80),('C0025',41,'英語',61),('C0025',41,'数学',76);
INSERT INTO exams VALUES ('C0026',41,'国語',25),('C0026',41,'英語',63),('C0026',41,'数学',41);
INSERT INTO exams VALUES ('C0027',41,'国語',62),('C0027',41,'英語',76),('C0027',41,'数学',72);
INSERT INTO exams VALUES ('C0028',41,'国語',51),('C0028',41,'英語',62),('C0028',41,'数学',25);
INSERT INTO exams VALUES ('C0029',41,'国語',79),('C0029',41,'英語',96),('C0029',41,'数学',84);
INSERT INTO exams VALUES ('C0030',41,'国語',63),('C0030',41,'英語',61),('C0030',41,'数学',78);
INSERT INTO exams VALUES ('C0031',41,'国語',60),('C0031',41,'英語',81),('C0031',41,'数学',69);
INSERT INTO exams VALUES ('C0032',41,'国語',63),('C0032',41,'英語',70),('C0032',41,'数学',79);
INSERT INTO exams VALUES ('C0033',41,'国語',91),('C0033',41,'英語',84),('C0033',41,'数学',98);
INSERT INTO exams VALUES ('C0034',41,'国語',71),('C0034',41,'英語',74),('C0034',41,'数学',68);
INSERT INTO exams VALUES ('C0035',41,'国語',77),('C0035',41,'英語',63),('C0035',41,'数学',68);
INSERT INTO exams VALUES ('C0036',41,'国語',84),('C0036',41,'英語',91),('C0036',41,'数学',83);
INSERT INTO exams VALUES ('C0037',41,'国語',82),('C0037',41,'英語',80),('C0037',41,'数学',94);
INSERT INTO exams VALUES ('C0038',41,'国語',97),('C0038',41,'英語',95),('C0038',41,'数学',86);
INSERT INTO exams VALUES ('C0039',41,'国語',94),('C0039',41,'英語',97),('C0039',41,'数学',84);
INSERT INTO exams VALUES ('C0040',41,'国語',94),('C0040',41,'英語',89),('C0040',41,'数学',79);
INSERT INTO exams VALUES ('C0041',41,'国語',70),('C0041',41,'英語',75),('C0041',41,'数学',60);
INSERT INTO exams VALUES ('C0042',41,'国語',81),('C0042',41,'英語',60),('C0042',41,'数学',68);
INSERT INTO exams VALUES ('C0043',41,'国語',82),('C0043',41,'英語',64),('C0043',41,'数学',76);
INSERT INTO exams VALUES ('C0044',41,'国語',79),('C0044',41,'英語',100),('C0044',41,'数学',60);
INSERT INTO exams VALUES ('C0045',41,'国語',61),('C0045',41,'英語',64),('C0045',41,'数学',61);
INSERT INTO exams VALUES ('C0046',41,'国語',63),('C0046',41,'英語',65),('C0046',41,'数学',81);
INSERT INTO exams VALUES ('C0047',41,'国語',70),('C0047',41,'英語',76),('C0047',41,'数学',91);
INSERT INTO exams VALUES ('C0048',41,'国語',61),('C0048',41,'英語',83),('C0048',41,'数学',76);
INSERT INTO exams VALUES ('C0049',41,'国語',66),('C0049',41,'英語',85),('C0049',41,'数学',78);
INSERT INTO exams VALUES ('C0050',41,'国語',63),('C0050',41,'英語',65),('C0050',41,'数学',56);
INSERT INTO exams VALUES ('C0051',41,'国語',64),('C0051',41,'英語',77),('C0051',41,'数学',74);
INSERT INTO exams VALUES ('C0052',41,'国語',87),('C0052',41,'英語',83),('C0052',41,'数学',91);
INSERT INTO exams VALUES ('C0053',41,'国語',79),('C0053',41,'英語',90),('C0053',41,'数学',75);
INSERT INTO exams VALUES ('C0054',41,'国語',80),('C0054',41,'英語',81),('C0054',41,'数学',95);
INSERT INTO exams VALUES ('C0055',41,'国語',58),('C0055',41,'英語',34),('C0055',41,'数学',27);
INSERT INTO exams VALUES ('C0056',41,'国語',68),('C0056',41,'英語',75),('C0056',41,'数学',86);
INSERT INTO exams VALUES ('C0057',41,'国語',98),('C0057',41,'英語',78),('C0057',41,'数学',99);
INSERT INTO exams VALUES ('C0058',41,'国語',89),('C0058',41,'英語',98),('C0058',41,'数学',81);
INSERT INTO exams VALUES ('C0059',41,'国語',85),('C0059',41,'英語',72),('C0059',41,'数学',73);
INSERT INTO exams VALUES ('C0060',41,'国語',55),('C0060',41,'英語',67),('C0060',41,'数学',32);
INSERT INTO exams VALUES ('C0061',41,'国語',99),('C0061',41,'英語',79),('C0061',41,'数学',83);
INSERT INTO exams VALUES ('C0062',41,'国語',75),('C0062',41,'英語',84),('C0062',41,'数学',72);
INSERT INTO exams VALUES ('C0063',41,'国語',62),('C0063',41,'英語',84),('C0063',41,'数学',84);
INSERT INTO exams VALUES ('C0064',41,'国語',68),('C0064',41,'英語',62),('C0064',41,'数学',83);
INSERT INTO exams VALUES ('C0065',41,'国語',96),('C0065',41,'英語',83),('C0065',41,'数学',77);
INSERT INTO exams VALUES ('C0066',41,'国語',81),('C0066',41,'英語',81),('C0066',41,'数学',85);
INSERT INTO exams VALUES ('C0067',41,'国語',77),('C0067',41,'英語',69),('C0067',41,'数学',29);
INSERT INTO exams VALUES ('C0068',41,'国語',50),('C0068',41,'英語',46),('C0068',41,'数学',63);
INSERT INTO exams VALUES ('C0069',41,'国語',71),('C0069',41,'英語',75),('C0069',41,'数学',63);
INSERT INTO exams VALUES ('C0070',41,'国語',44),('C0070',41,'英語',55),('C0070',41,'数学',55);
INSERT INTO exams VALUES ('C0071',41,'国語',25),('C0071',41,'英語',81),('C0071',41,'数学',67);
INSERT INTO exams VALUES ('C0072',41,'国語',43),('C0072',41,'英語',36),('C0072',41,'数学',42);
INSERT INTO exams VALUES ('C0073',41,'国語',54),('C0073',41,'英語',41),('C0073',41,'数学',51);
INSERT INTO exams VALUES ('C0074',41,'国語',76),('C0074',41,'英語',82),('C0074',41,'数学',77);
INSERT INTO exams VALUES ('C0075',41,'国語',61),('C0075',41,'英語',62),('C0075',41,'数学',84);
INSERT INTO exams VALUES ('C0076',41,'国語',26),('C0076',41,'英語',50),('C0076',41,'数学',44);
INSERT INTO exams VALUES ('C0077',41,'国語',66),('C0077',41,'英語',36),('C0077',41,'数学',35);
INSERT INTO exams VALUES ('C0078',41,'国語',33),('C0078',41,'英語',55),('C0078',41,'数学',27);
INSERT INTO exams VALUES ('C0079',41,'国語',74),('C0079',41,'英語',69),('C0079',41,'数学',81);
INSERT INTO exams VALUES ('C0080',41,'国語',81),('C0080',41,'英語',61),('C0080',41,'数学',76);
INSERT INTO exams VALUES ('C0081',41,'国語',99),('C0081',41,'英語',82),('C0081',41,'数学',95);
INSERT INTO exams VALUES ('C0082',41,'国語',70),('C0082',41,'英語',83),('C0082',41,'数学',70);
INSERT INTO exams VALUES ('C0083',41,'国語',74),('C0083',41,'英語',74),('C0083',41,'数学',85);
INSERT INTO exams VALUES ('C0084',41,'国語',66),('C0084',41,'英語',69),('C0084',41,'数学',27);
INSERT INTO exams VALUES ('C0085',41,'国語',61),('C0085',41,'英語',64),('C0085',41,'数学',70);
INSERT INTO exams VALUES ('C0086',41,'国語',62),('C0086',41,'英語',42),('C0086',41,'数学',34);
INSERT INTO exams VALUES ('C0087',41,'国語',81),('C0087',41,'英語',96),('C0087',41,'数学',89);
INSERT INTO exams VALUES ('C0088',41,'国語',95),('C0088',41,'英語',70),('C0088',41,'数学',77);
INSERT INTO exams VALUES ('C0089',41,'国語',77),('C0089',41,'英語',88),('C0089',41,'数学',93);
INSERT INTO exams VALUES ('C0090',41,'国語',27),('C0090',41,'英語',60),('C0090',41,'数学',64);
INSERT INTO exams VALUES ('C0091',41,'国語',82),('C0091',41,'英語',81),('C0091',41,'数学',86);
INSERT INTO exams VALUES ('C0092',41,'国語',63),('C0092',41,'英語',69),('C0092',41,'数学',74);
INSERT INTO exams VALUES ('C0093',41,'国語',79),('C0093',41,'英語',84),('C0093',41,'数学',82);
INSERT INTO exams VALUES ('C0094',41,'国語',97),('C0094',41,'英語',85),('C0094',41,'数学',85);
INSERT INTO exams VALUES ('C0095',41,'国語',99),('C0095',41,'英語',76),('C0095',41,'数学',78);
INSERT INTO exams VALUES ('C0096',41,'国語',87),('C0096',41,'英語',77),('C0096',41,'数学',91);
INSERT INTO exams VALUES ('C0097',41,'国語',60),('C0097',41,'英語',62),('C0097',41,'数学',85);
INSERT INTO exams VALUES ('C0098',41,'国語',70),('C0098',41,'英語',74),('C0098',41,'数学',65);
INSERT INTO exams VALUES ('C0099',41,'国語',65),('C0099',41,'英語',60),('C0099',41,'数学',68);
INSERT INTO exams VALUES ('C0100',41,'国語',64),('C0100',41,'英語',69),('C0100',41,'数学',49);
INSERT INTO exams VALUES ('C0101',41,'国語',64),('C0101',41,'英語',81),('C0101',41,'数学',62);
INSERT INTO exams VALUES ('C0102',41,'国語',61),('C0102',41,'英語',62),('C0102',41,'数学',72);
INSERT INTO exams VALUES ('C0103',41,'国語',42),('C0103',41,'英語',35),('C0103',41,'数学',32);
INSERT INTO exams VALUES ('C0104',41,'国語',85),('C0104',41,'英語',69),('C0104',41,'数学',60);
INSERT INTO exams VALUES ('C0105',41,'国語',94),('C0105',41,'英語',42),('C0105',41,'数学',83);
INSERT INTO exams VALUES ('C0106',41,'国語',84),('C0106',41,'英語',89),('C0106',41,'数学',75);
INSERT INTO exams VALUES ('C0107',41,'国語',85),('C0107',41,'英語',100),('C0107',41,'数学',86);
INSERT INTO exams VALUES ('C0108',41,'国語',34),('C0108',41,'英語',50),('C0108',41,'数学',65);
INSERT INTO exams VALUES ('C0109',41,'国語',73),('C0109',41,'英語',77),('C0109',41,'数学',61);
INSERT INTO exams VALUES ('C0110',41,'国語',56),('C0110',41,'英語',61),('C0110',41,'数学',46);
INSERT INTO exams VALUES ('C0111',41,'国語',34),('C0111',41,'英語',36),('C0111',41,'数学',63);
INSERT INTO exams VALUES ('C0112',41,'国語',26),('C0112',41,'英語',68),('C0112',41,'数学',34);
INSERT INTO exams VALUES ('C0113',41,'国語',40),('C0113',41,'英語',57),('C0113',41,'数学',65);
INSERT INTO exams VALUES ('C0114',41,'国語',54),('C0114',41,'英語',55),('C0114',41,'数学',42);
INSERT INTO exams VALUES ('C0115',41,'国語',64),('C0115',41,'英語',84),('C0115',41,'数学',74);
INSERT INTO exams VALUES ('C0116',41,'国語',48),('C0116',41,'英語',41),('C0116',41,'数学',70);
INSERT INTO exams VALUES ('C0117',41,'国語',77),('C0117',41,'英語',78),('C0117',41,'数学',91);
INSERT INTO exams VALUES ('C0118',41,'国語',88),('C0118',41,'英語',100),('C0118',41,'数学',84);
INSERT INTO exams VALUES ('C0119',41,'国語',91),('C0119',41,'英語',98),('C0119',41,'数学',97);
INSERT INTO exams VALUES ('C0120',41,'国語',60),('C0120',41,'英語',34),('C0120',41,'数学',43);
/*
## no 42
*/
-- DELETE FROM exams WHERE exam_no=42;
INSERT INTO exams VALUES ('C0001',42,'国語',87),('C0001',42,'英語',99),('C0001',42,'数学',80);
INSERT INTO exams VALUES ('C0002',42,'国語',92),('C0002',42,'英語',92),('C0002',42,'数学',79);
INSERT INTO exams VALUES ('C0003',42,'国語',69),('C0003',42,'英語',68),('C0003',42,'数学',66);
INSERT INTO exams VALUES ('C0004',42,'国語',37),('C0004',42,'英語',68),('C0004',42,'数学',53);
INSERT INTO exams VALUES ('C0005',42,'国語',81),('C0005',42,'英語',81),('C0005',42,'数学',78);
INSERT INTO exams VALUES ('C0006',42,'国語',46),('C0006',42,'英語',43),('C0006',42,'数学',44);
INSERT INTO exams VALUES ('C0007',42,'国語',82),('C0007',42,'英語',61),('C0007',42,'数学',74);
INSERT INTO exams VALUES ('C0008',42,'国語',78),('C0008',42,'英語',87),('C0008',42,'数学',99);
INSERT INTO exams VALUES ('C0009',42,'国語',71),('C0009',42,'英語',73),('C0009',42,'数学',79);
INSERT INTO exams VALUES ('C0010',42,'国語',71),('C0010',42,'英語',93),('C0010',42,'数学',68);
INSERT INTO exams VALUES ('C0011',42,'国語',77),('C0011',42,'英語',87),('C0011',42,'数学',88);
INSERT INTO exams VALUES ('C0012',42,'国語',99),('C0012',42,'英語',72),('C0012',42,'数学',97);
INSERT INTO exams VALUES ('C0013',42,'国語',82),('C0013',42,'英語',66),('C0013',42,'数学',83);
INSERT INTO exams VALUES ('C0014',42,'国語',92),('C0014',42,'英語',62),('C0014',42,'数学',72);
INSERT INTO exams VALUES ('C0015',42,'国語',89),('C0015',42,'英語',80),('C0015',42,'数学',67);
INSERT INTO exams VALUES ('C0016',42,'国語',98),('C0016',42,'英語',96),('C0016',42,'数学',84);
INSERT INTO exams VALUES ('C0017',42,'国語',99),('C0017',42,'英語',93),('C0017',42,'数学',86);
INSERT INTO exams VALUES ('C0019',42,'国語',39),('C0019',42,'英語',61),('C0019',42,'数学',33);
INSERT INTO exams VALUES ('C0020',42,'国語',79),('C0020',42,'英語',85),('C0020',42,'数学',83);
INSERT INTO exams VALUES ('C0021',42,'国語',60),('C0021',42,'英語',74),('C0021',42,'数学',76);
INSERT INTO exams VALUES ('C0022',42,'国語',73),('C0022',42,'英語',65),('C0022',42,'数学',61);
INSERT INTO exams VALUES ('C0023',42,'国語',85),('C0023',42,'英語',97),('C0023',42,'数学',97);
INSERT INTO exams VALUES ('C0024',42,'国語',80),('C0024',42,'英語',87),('C0024',42,'数学',90);
INSERT INTO exams VALUES ('C0025',42,'国語',76),('C0025',42,'英語',81),('C0025',42,'数学',81);
INSERT INTO exams VALUES ('C0026',42,'国語',61),('C0026',42,'英語',52),('C0026',42,'数学',31);
INSERT INTO exams VALUES ('C0027',42,'国語',74),('C0027',42,'英語',81),('C0027',42,'数学',63);
INSERT INTO exams VALUES ('C0028',42,'国語',36),('C0028',42,'英語',44),('C0028',42,'数学',56);
INSERT INTO exams VALUES ('C0029',42,'国語',100),('C0029',42,'英語',92),('C0029',42,'数学',86);
INSERT INTO exams VALUES ('C0030',42,'国語',81),('C0030',42,'英語',62),('C0030',42,'数学',100);
INSERT INTO exams VALUES ('C0031',42,'国語',72),('C0031',42,'英語',73),('C0031',42,'数学',69);
INSERT INTO exams VALUES ('C0032',42,'国語',73),('C0032',42,'英語',70),('C0032',42,'数学',82);
INSERT INTO exams VALUES ('C0033',42,'国語',82),('C0033',42,'英語',90),('C0033',42,'数学',96);
INSERT INTO exams VALUES ('C0034',42,'国語',72),('C0034',42,'英語',78),('C0034',42,'数学',60);
INSERT INTO exams VALUES ('C0035',42,'国語',72),('C0035',42,'英語',75),('C0035',42,'数学',60);
INSERT INTO exams VALUES ('C0036',42,'国語',85),('C0036',42,'英語',94),('C0036',42,'数学',97);
INSERT INTO exams VALUES ('C0037',42,'国語',96),('C0037',42,'英語',85),('C0037',42,'数学',82);
INSERT INTO exams VALUES ('C0038',42,'国語',88),('C0038',42,'英語',93),('C0038',42,'数学',100);
INSERT INTO exams VALUES ('C0039',42,'国語',93),('C0039',42,'英語',92),('C0039',42,'数学',100);
INSERT INTO exams VALUES ('C0040',42,'国語',95),('C0040',42,'英語',84),('C0040',42,'数学',88);
INSERT INTO exams VALUES ('C0041',42,'国語',82),('C0041',42,'英語',61),('C0041',42,'数学',63);
INSERT INTO exams VALUES ('C0042',42,'国語',61),('C0042',42,'英語',77),('C0042',42,'数学',67);
INSERT INTO exams VALUES ('C0043',42,'国語',82),('C0043',42,'英語',85),('C0043',42,'数学',98);
INSERT INTO exams VALUES ('C0044',42,'国語',84),('C0044',42,'英語',86),('C0044',42,'数学',72);
INSERT INTO exams VALUES ('C0045',42,'国語',65),('C0045',42,'英語',59),('C0045',42,'数学',60);
INSERT INTO exams VALUES ('C0046',42,'国語',68),('C0046',42,'英語',85),('C0046',42,'数学',88);
INSERT INTO exams VALUES ('C0047',42,'国語',73),('C0047',42,'英語',61),('C0047',42,'数学',92);
INSERT INTO exams VALUES ('C0048',42,'国語',66),('C0048',42,'英語',75),('C0048',42,'数学',68);
INSERT INTO exams VALUES ('C0049',42,'国語',80),('C0049',42,'英語',83),('C0049',42,'数学',84);
INSERT INTO exams VALUES ('C0050',42,'国語',35),('C0050',42,'英語',54),('C0050',42,'数学',67);
INSERT INTO exams VALUES ('C0051',42,'国語',83),('C0051',42,'英語',82),('C0051',42,'数学',71);
INSERT INTO exams VALUES ('C0052',42,'国語',80),('C0052',42,'英語',85),('C0052',42,'数学',80);
INSERT INTO exams VALUES ('C0053',42,'国語',79),('C0053',42,'英語',89),('C0053',42,'数学',82);
INSERT INTO exams VALUES ('C0054',42,'国語',97),('C0054',42,'英語',90),('C0054',42,'数学',90);
INSERT INTO exams VALUES ('C0055',42,'国語',32),('C0055',42,'英語',31),('C0055',42,'数学',36);
INSERT INTO exams VALUES ('C0056',42,'国語',70),('C0056',42,'英語',82),('C0056',42,'数学',94);
INSERT INTO exams VALUES ('C0057',42,'国語',95),('C0057',42,'英語',85),('C0057',42,'数学',95);
INSERT INTO exams VALUES ('C0058',42,'国語',82),('C0058',42,'英語',90),('C0058',42,'数学',86);
INSERT INTO exams VALUES ('C0059',42,'国語',65),('C0059',42,'英語',69),('C0059',42,'数学',83);
INSERT INTO exams VALUES ('C0060',42,'国語',59),('C0060',42,'英語',53),('C0060',42,'数学',52);
INSERT INTO exams VALUES ('C0061',42,'国語',93),('C0061',42,'英語',96),('C0061',42,'数学',85);
INSERT INTO exams VALUES ('C0062',42,'国語',68),('C0062',42,'英語',63),('C0062',42,'数学',62);
INSERT INTO exams VALUES ('C0063',42,'国語',82),('C0063',42,'英語',63),('C0063',42,'数学',71);
INSERT INTO exams VALUES ('C0064',42,'国語',64),('C0064',42,'英語',65),('C0064',42,'数学',75);
INSERT INTO exams VALUES ('C0065',42,'国語',80),('C0065',42,'英語',88),('C0065',42,'数学',81);
INSERT INTO exams VALUES ('C0066',42,'国語',97),('C0066',42,'英語',81),('C0066',42,'数学',90);
INSERT INTO exams VALUES ('C0067',42,'国語',91),('C0067',42,'英語',43),('C0067',42,'数学',37);
INSERT INTO exams VALUES ('C0068',42,'国語',44),('C0068',42,'英語',42),('C0068',42,'数学',37);
INSERT INTO exams VALUES ('C0069',42,'国語',82),('C0069',42,'英語',78),('C0069',42,'数学',74);
INSERT INTO exams VALUES ('C0070',42,'国語',34),('C0070',42,'英語',49),('C0070',42,'数学',34);
INSERT INTO exams VALUES ('C0071',42,'国語',30),('C0071',42,'英語',83),('C0071',42,'数学',83);
INSERT INTO exams VALUES ('C0072',42,'国語',49),('C0072',42,'英語',55),('C0072',42,'数学',30);
INSERT INTO exams VALUES ('C0073',42,'国語',53),('C0073',42,'英語',48),('C0073',42,'数学',37);
INSERT INTO exams VALUES ('C0074',42,'国語',82),('C0074',42,'英語',92),('C0074',42,'数学',85);
INSERT INTO exams VALUES ('C0075',42,'国語',75),('C0075',42,'英語',81),('C0075',42,'数学',72);
INSERT INTO exams VALUES ('C0076',42,'国語',52),('C0076',42,'英語',52),('C0076',42,'数学',69);
INSERT INTO exams VALUES ('C0077',42,'国語',40),('C0077',42,'英語',34),('C0077',42,'数学',52);
INSERT INTO exams VALUES ('C0078',42,'国語',40),('C0078',42,'英語',51),('C0078',42,'数学',67);
INSERT INTO exams VALUES ('C0079',42,'国語',78),('C0079',42,'英語',73),('C0079',42,'数学',85);
INSERT INTO exams VALUES ('C0080',42,'国語',71),('C0080',42,'英語',67),('C0080',42,'数学',70);
INSERT INTO exams VALUES ('C0081',42,'国語',78),('C0081',42,'英語',95),('C0081',42,'数学',81);
INSERT INTO exams VALUES ('C0082',42,'国語',76),('C0082',42,'英語',85),('C0082',42,'数学',78);
INSERT INTO exams VALUES ('C0083',42,'国語',63),('C0083',42,'英語',78),('C0083',42,'数学',65);
INSERT INTO exams VALUES ('C0084',42,'国語',60),('C0084',42,'英語',37),('C0084',42,'数学',60);
INSERT INTO exams VALUES ('C0085',42,'国語',65),('C0085',42,'英語',62),('C0085',42,'数学',68);
INSERT INTO exams VALUES ('C0086',42,'国語',38),('C0086',42,'英語',69),('C0086',42,'数学',54);
INSERT INTO exams VALUES ('C0087',42,'国語',91),('C0087',42,'英語',97),('C0087',42,'数学',92);
INSERT INTO exams VALUES ('C0088',42,'国語',85),('C0088',42,'英語',84),('C0088',42,'数学',69);
INSERT INTO exams VALUES ('C0089',42,'国語',88),('C0089',42,'英語',85),('C0089',42,'数学',98);
INSERT INTO exams VALUES ('C0090',42,'国語',39),('C0090',42,'英語',53),('C0090',42,'数学',66);
INSERT INTO exams VALUES ('C0091',42,'国語',68),('C0091',42,'英語',85),('C0091',42,'数学',95);
INSERT INTO exams VALUES ('C0092',42,'国語',62),('C0092',42,'英語',62),('C0092',42,'数学',70);
INSERT INTO exams VALUES ('C0093',42,'国語',98),('C0093',42,'英語',94),('C0093',42,'数学',83);
INSERT INTO exams VALUES ('C0094',42,'国語',93),('C0094',42,'英語',86),('C0094',42,'数学',81);
INSERT INTO exams VALUES ('C0095',42,'国語',83),('C0095',42,'英語',86),('C0095',42,'数学',89);
INSERT INTO exams VALUES ('C0096',42,'国語',87),('C0096',42,'英語',83),('C0096',42,'数学',96);
INSERT INTO exams VALUES ('C0097',42,'国語',61),('C0097',42,'英語',60),('C0097',42,'数学',62);
INSERT INTO exams VALUES ('C0098',42,'国語',62),('C0098',42,'英語',74),('C0098',42,'数学',63);
INSERT INTO exams VALUES ('C0099',42,'国語',81),('C0099',42,'英語',78),('C0099',42,'数学',69);
INSERT INTO exams VALUES ('C0100',42,'国語',70),('C0100',42,'英語',41),('C0100',42,'数学',35);
INSERT INTO exams VALUES ('C0101',42,'国語',84),('C0101',42,'英語',62),('C0101',42,'数学',70);
INSERT INTO exams VALUES ('C0102',42,'国語',74),('C0102',42,'英語',78),('C0102',42,'数学',65);
INSERT INTO exams VALUES ('C0103',42,'国語',63),('C0103',42,'英語',56),('C0103',42,'数学',69);
INSERT INTO exams VALUES ('C0104',42,'国語',66),('C0104',42,'英語',72),('C0104',42,'数学',76);
INSERT INTO exams VALUES ('C0105',42,'国語',79),('C0105',42,'英語',63),('C0105',42,'数学',93);
INSERT INTO exams VALUES ('C0107',42,'国語',86),('C0107',42,'英語',82),('C0107',42,'数学',85);
INSERT INTO exams VALUES ('C0108',42,'国語',69),('C0108',42,'英語',64),('C0108',42,'数学',64);
INSERT INTO exams VALUES ('C0109',42,'国語',72),('C0109',42,'英語',65),('C0109',42,'数学',79);
INSERT INTO exams VALUES ('C0110',42,'国語',41),('C0110',42,'英語',34),('C0110',42,'数学',42);
INSERT INTO exams VALUES ('C0111',42,'国語',51),('C0111',42,'英語',59),('C0111',42,'数学',45);
INSERT INTO exams VALUES ('C0112',42,'国語',70),('C0112',42,'英語',42),('C0112',42,'数学',45);
INSERT INTO exams VALUES ('C0113',42,'国語',65),('C0113',42,'英語',67),('C0113',42,'数学',46);
INSERT INTO exams VALUES ('C0114',42,'国語',52),('C0114',42,'英語',66),('C0114',42,'数学',55);
INSERT INTO exams VALUES ('C0115',42,'国語',65),('C0115',42,'英語',78),('C0115',42,'数学',81);
INSERT INTO exams VALUES ('C0116',42,'国語',40),('C0116',42,'英語',58),('C0116',42,'数学',56);
INSERT INTO exams VALUES ('C0117',42,'国語',97),('C0117',42,'英語',86),('C0117',42,'数学',88);
INSERT INTO exams VALUES ('C0118',42,'国語',89),('C0118',42,'英語',98),('C0118',42,'数学',100);
INSERT INTO exams VALUES ('C0119',42,'国語',96),('C0119',42,'英語',97),('C0119',42,'数学',93);
INSERT INTO exams VALUES ('C0120',42,'国語',49),('C0120',42,'英語',56),('C0120',42,'数学',42);
/*
## no 43
*/
-- DELETE FROM exams WHERE exam_no=43;
INSERT INTO exams VALUES ('C0001',43,'国語',79),('C0001',43,'英語',95),('C0001',43,'数学',83);
INSERT INTO exams VALUES ('C0002',43,'国語',90),('C0002',43,'英語',87),('C0002',43,'数学',97);
INSERT INTO exams VALUES ('C0003',43,'国語',80),('C0003',43,'英語',68),('C0003',43,'数学',73);
INSERT INTO exams VALUES ('C0004',43,'国語',53),('C0004',43,'英語',54),('C0004',43,'数学',33);
INSERT INTO exams VALUES ('C0005',43,'国語',77),('C0005',43,'英語',79),('C0005',43,'数学',84);
INSERT INTO exams VALUES ('C0006',43,'国語',61),('C0006',43,'英語',49),('C0006',43,'数学',60);
INSERT INTO exams VALUES ('C0007',43,'国語',82),('C0007',43,'英語',77),('C0007',43,'数学',75);
INSERT INTO exams VALUES ('C0009',43,'国語',67),('C0009',43,'英語',77),('C0009',43,'数学',68);
INSERT INTO exams VALUES ('C0010',43,'国語',67),('C0010',43,'英語',99),('C0010',43,'数学',79);
INSERT INTO exams VALUES ('C0011',43,'国語',83),('C0011',43,'英語',99),('C0011',43,'数学',93);
INSERT INTO exams VALUES ('C0012',43,'国語',95),('C0012',43,'英語',84),('C0012',43,'数学',90);
INSERT INTO exams VALUES ('C0013',43,'国語',77),('C0013',43,'英語',76),('C0013',43,'数学',74);
INSERT INTO exams VALUES ('C0014',43,'国語',82),('C0014',43,'英語',69),('C0014',43,'数学',75);
INSERT INTO exams VALUES ('C0015',43,'国語',99),('C0015',43,'英語',70),('C0015',43,'数学',82);
INSERT INTO exams VALUES ('C0016',43,'国語',81),('C0016',43,'英語',100),('C0016',43,'数学',87);
INSERT INTO exams VALUES ('C0017',43,'国語',96),('C0017',43,'英語',100),('C0017',43,'数学',82);
INSERT INTO exams VALUES ('C0018',43,'国語',95),('C0018',43,'英語',90),('C0018',43,'数学',99);
INSERT INTO exams VALUES ('C0019',43,'国語',45),('C0019',43,'英語',36),('C0019',43,'数学',47);
INSERT INTO exams VALUES ('C0020',43,'国語',82),('C0020',43,'英語',83),('C0020',43,'数学',81);
INSERT INTO exams VALUES ('C0021',43,'国語',74),('C0021',43,'英語',68),('C0021',43,'数学',81);
INSERT INTO exams VALUES ('C0022',43,'国語',83),('C0022',43,'英語',85),('C0022',43,'数学',68);
INSERT INTO exams VALUES ('C0023',43,'国語',95),('C0023',43,'英語',88),('C0023',43,'数学',77);
INSERT INTO exams VALUES ('C0024',43,'国語',82),('C0024',43,'英語',92),('C0024',43,'数学',85);
INSERT INTO exams VALUES ('C0025',43,'国語',75),('C0025',43,'英語',74),('C0025',43,'数学',76);
INSERT INTO exams VALUES ('C0026',43,'国語',68),('C0026',43,'英語',32),('C0026',43,'数学',33);
INSERT INTO exams VALUES ('C0027',43,'国語',66),('C0027',43,'英語',67),('C0027',43,'数学',79);
INSERT INTO exams VALUES ('C0028',43,'国語',48),('C0028',43,'英語',53),('C0028',43,'数学',67);
INSERT INTO exams VALUES ('C0029',43,'国語',96),('C0029',43,'英語',79),('C0029',43,'数学',95);
INSERT INTO exams VALUES ('C0030',43,'国語',84),('C0030',43,'英語',82),('C0030',43,'数学',93);
INSERT INTO exams VALUES ('C0031',43,'国語',76),('C0031',43,'英語',69),('C0031',43,'数学',67);
INSERT INTO exams VALUES ('C0032',43,'国語',82),('C0032',43,'英語',66),('C0032',43,'数学',81);
INSERT INTO exams VALUES ('C0033',43,'国語',99),('C0033',43,'英語',81),('C0033',43,'数学',83);
INSERT INTO exams VALUES ('C0034',43,'国語',71),('C0034',43,'英語',70),('C0034',43,'数学',75);
INSERT INTO exams VALUES ('C0035',43,'国語',80),('C0035',43,'英語',79),('C0035',43,'数学',72);
INSERT INTO exams VALUES ('C0036',43,'国語',77),('C0036',43,'英語',99),('C0036',43,'数学',80);
INSERT INTO exams VALUES ('C0037',43,'国語',82),('C0037',43,'英語',100),('C0037',43,'数学',86);
INSERT INTO exams VALUES ('C0038',43,'国語',96),('C0038',43,'英語',83),('C0038',43,'数学',79);
INSERT INTO exams VALUES ('C0040',43,'国語',87),('C0040',43,'英語',95),('C0040',43,'数学',99);
INSERT INTO exams VALUES ('C0041',43,'国語',79),('C0041',43,'英語',85),('C0041',43,'数学',77);
INSERT INTO exams VALUES ('C0042',43,'国語',65),('C0042',43,'英語',70),('C0042',43,'数学',66);
INSERT INTO exams VALUES ('C0043',43,'国語',90),('C0043',43,'英語',81),('C0043',43,'数学',86);
INSERT INTO exams VALUES ('C0044',43,'国語',83),('C0044',43,'英語',81),('C0044',43,'数学',77);
INSERT INTO exams VALUES ('C0045',43,'国語',61),('C0045',43,'英語',37),('C0045',43,'数学',42);
INSERT INTO exams VALUES ('C0046',43,'国語',83),('C0046',43,'英語',72),('C0046',43,'数学',95);
INSERT INTO exams VALUES ('C0047',43,'国語',75),('C0047',43,'英語',84),('C0047',43,'数学',77);
INSERT INTO exams VALUES ('C0048',43,'国語',71),('C0048',43,'英語',80),('C0048',43,'数学',76);
INSERT INTO exams VALUES ('C0049',43,'国語',67),('C0049',43,'英語',78),('C0049',43,'数学',76);
INSERT INTO exams VALUES ('C0050',43,'国語',35),('C0050',43,'英語',69),('C0050',43,'数学',45);
INSERT INTO exams VALUES ('C0051',43,'国語',68),('C0051',43,'英語',71),('C0051',43,'数学',68);
INSERT INTO exams VALUES ('C0052',43,'国語',97),('C0052',43,'英語',92),('C0052',43,'数学',99);
INSERT INTO exams VALUES ('C0053',43,'国語',83),('C0053',43,'英語',84),('C0053',43,'数学',93);
INSERT INTO exams VALUES ('C0054',43,'国語',79),('C0054',43,'英語',84),('C0054',43,'数学',81);
INSERT INTO exams VALUES ('C0055',43,'国語',63),('C0055',43,'英語',30),('C0055',43,'数学',65);
INSERT INTO exams VALUES ('C0056',43,'国語',78),('C0056',43,'英語',70),('C0056',43,'数学',83);
INSERT INTO exams VALUES ('C0057',43,'国語',94),('C0057',43,'英語',99),('C0057',43,'数学',85);
INSERT INTO exams VALUES ('C0058',43,'国語',77),('C0058',43,'英語',99),('C0058',43,'数学',85);
INSERT INTO exams VALUES ('C0059',43,'国語',72),('C0059',43,'英語',69),('C0059',43,'数学',82);
INSERT INTO exams VALUES ('C0060',43,'国語',41),('C0060',43,'英語',33),('C0060',43,'数学',61);
INSERT INTO exams VALUES ('C0061',43,'国語',82),('C0061',43,'英語',84),('C0061',43,'数学',98);
INSERT INTO exams VALUES ('C0063',43,'国語',65),('C0063',43,'英語',73),('C0063',43,'数学',68);
INSERT INTO exams VALUES ('C0064',43,'国語',65),('C0064',43,'英語',79),('C0064',43,'数学',67);
INSERT INTO exams VALUES ('C0065',43,'国語',83),('C0065',43,'英語',96),('C0065',43,'数学',78);
INSERT INTO exams VALUES ('C0066',43,'国語',99),('C0066',43,'英語',89),('C0066',43,'数学',93);
INSERT INTO exams VALUES ('C0067',43,'国語',97),('C0067',43,'英語',65),('C0067',43,'数学',33);
INSERT INTO exams VALUES ('C0068',43,'国語',57),('C0068',43,'英語',37),('C0068',43,'数学',43);
INSERT INTO exams VALUES ('C0069',43,'国語',73),('C0069',43,'英語',65),('C0069',43,'数学',72);
INSERT INTO exams VALUES ('C0070',43,'国語',53),('C0070',43,'英語',41),('C0070',43,'数学',40);
INSERT INTO exams VALUES ('C0071',43,'国語',41),('C0071',43,'英語',67),('C0071',43,'数学',72);
INSERT INTO exams VALUES ('C0072',43,'国語',31),('C0072',43,'英語',53),('C0072',43,'数学',50);
INSERT INTO exams VALUES ('C0073',43,'国語',60),('C0073',43,'英語',46),('C0073',43,'数学',55);
INSERT INTO exams VALUES ('C0074',43,'国語',78),('C0074',43,'英語',94),('C0074',43,'数学',79);
INSERT INTO exams VALUES ('C0075',43,'国語',70),('C0075',43,'英語',66),('C0075',43,'数学',85);
INSERT INTO exams VALUES ('C0076',43,'国語',52),('C0076',43,'英語',69),('C0076',43,'数学',55);
INSERT INTO exams VALUES ('C0077',43,'国語',69),('C0077',43,'英語',41),('C0077',43,'数学',45);
INSERT INTO exams VALUES ('C0078',43,'国語',52),('C0078',43,'英語',63),('C0078',43,'数学',40);
INSERT INTO exams VALUES ('C0079',43,'国語',70),('C0079',43,'英語',79),('C0079',43,'数学',79);
INSERT INTO exams VALUES ('C0080',43,'国語',67),('C0080',43,'英語',72),('C0080',43,'数学',81);
INSERT INTO exams VALUES ('C0081',43,'国語',86),('C0081',43,'英語',84),('C0081',43,'数学',99);
INSERT INTO exams VALUES ('C0082',43,'国語',78),('C0082',43,'英語',80),('C0082',43,'数学',73);
INSERT INTO exams VALUES ('C0083',43,'国語',81),('C0083',43,'英語',82),('C0083',43,'数学',72);
INSERT INTO exams VALUES ('C0084',43,'国語',39),('C0084',43,'英語',39),('C0084',43,'数学',34);
INSERT INTO exams VALUES ('C0085',43,'国語',72),('C0085',43,'英語',68),('C0085',43,'数学',65);
INSERT INTO exams VALUES ('C0086',43,'国語',49),('C0086',43,'英語',65),('C0086',43,'数学',58);
INSERT INTO exams VALUES ('C0087',43,'国語',99),('C0087',43,'英語',84),('C0087',43,'数学',100);
INSERT INTO exams VALUES ('C0088',43,'国語',95),('C0088',43,'英語',78),('C0088',43,'数学',68);
INSERT INTO exams VALUES ('C0089',43,'国語',88),('C0089',43,'英語',94),('C0089',43,'数学',84);
INSERT INTO exams VALUES ('C0090',43,'国語',65),('C0090',43,'英語',33),('C0090',43,'数学',44);
INSERT INTO exams VALUES ('C0091',43,'国語',68),('C0091',43,'英語',74),('C0091',43,'数学',94);
INSERT INTO exams VALUES ('C0092',43,'国語',83),('C0092',43,'英語',83),('C0092',43,'数学',76);
INSERT INTO exams VALUES ('C0093',43,'国語',86),('C0093',43,'英語',85),('C0093',43,'数学',84);
INSERT INTO exams VALUES ('C0094',43,'国語',88),('C0094',43,'英語',86),('C0094',43,'数学',96);
INSERT INTO exams VALUES ('C0095',43,'国語',82),('C0095',43,'英語',96),('C0095',43,'数学',87);
INSERT INTO exams VALUES ('C0096',43,'国語',84),('C0096',43,'英語',70),('C0096',43,'数学',99);
INSERT INTO exams VALUES ('C0097',43,'国語',85),('C0097',43,'英語',80),('C0097',43,'数学',85);
INSERT INTO exams VALUES ('C0098',43,'国語',83),('C0098',43,'英語',69),('C0098',43,'数学',80);
INSERT INTO exams VALUES ('C0099',43,'国語',71),('C0099',43,'英語',76),('C0099',43,'数学',75);
INSERT INTO exams VALUES ('C0100',43,'国語',38),('C0100',43,'英語',60),('C0100',43,'数学',63);
INSERT INTO exams VALUES ('C0101',43,'国語',68),('C0101',43,'英語',84),('C0101',43,'数学',71);
INSERT INTO exams VALUES ('C0102',43,'国語',67),('C0102',43,'英語',68),('C0102',43,'数学',83);
INSERT INTO exams VALUES ('C0103',43,'国語',56),('C0103',43,'英語',60),('C0103',43,'数学',65);
INSERT INTO exams VALUES ('C0104',43,'国語',78),('C0104',43,'英語',74),('C0104',43,'数学',76);
INSERT INTO exams VALUES ('C0105',43,'国語',81),('C0105',43,'英語',48),('C0105',43,'数学',81);
INSERT INTO exams VALUES ('C0106',43,'国語',82),('C0106',43,'英語',88),('C0106',43,'数学',80);
INSERT INTO exams VALUES ('C0107',43,'国語',99),('C0107',43,'英語',96),('C0107',43,'数学',96);
INSERT INTO exams VALUES ('C0108',43,'国語',44),('C0108',43,'英語',56),('C0108',43,'数学',65);
INSERT INTO exams VALUES ('C0109',43,'国語',72),('C0109',43,'英語',71),('C0109',43,'数学',81);
INSERT INTO exams VALUES ('C0110',43,'国語',54),('C0110',43,'英語',44),('C0110',43,'数学',34);
INSERT INTO exams VALUES ('C0111',43,'国語',36),('C0111',43,'英語',40),('C0111',43,'数学',35);
INSERT INTO exams VALUES ('C0112',43,'国語',65),('C0112',43,'英語',39),('C0112',43,'数学',34);
INSERT INTO exams VALUES ('C0113',43,'国語',36),('C0113',43,'英語',46),('C0113',43,'数学',66);
INSERT INTO exams VALUES ('C0114',43,'国語',68),('C0114',43,'英語',52),('C0114',43,'数学',36);
INSERT INTO exams VALUES ('C0115',43,'国語',82),('C0115',43,'英語',76),('C0115',43,'数学',71);
INSERT INTO exams VALUES ('C0116',43,'国語',65),('C0116',43,'英語',59),('C0116',43,'数学',54);
INSERT INTO exams VALUES ('C0117',43,'国語',77),('C0117',43,'英語',86),('C0117',43,'数学',86);
INSERT INTO exams VALUES ('C0118',43,'国語',88),('C0118',43,'英語',93),('C0118',43,'数学',99);
INSERT INTO exams VALUES ('C0119',43,'国語',79),('C0119',43,'英語',87),('C0119',43,'数学',82);
INSERT INTO exams VALUES ('C0120',43,'国語',68),('C0120',43,'英語',69),('C0120',43,'数学',69);
/*
## no 44
*/
-- DELETE FROM exams WHERE exam_no=44;
INSERT INTO exams VALUES ('C0001',44,'国語',92),('C0001',44,'英語',91),('C0001',44,'数学',86);
INSERT INTO exams VALUES ('C0003',44,'国語',80),('C0003',44,'英語',79),('C0003',44,'数学',76);
INSERT INTO exams VALUES ('C0004',44,'国語',60),('C0004',44,'英語',65),('C0004',44,'数学',67);
INSERT INTO exams VALUES ('C0006',44,'国語',41),('C0006',44,'英語',50),('C0006',44,'数学',65);
INSERT INTO exams VALUES ('C0007',44,'国語',85),('C0007',44,'英語',78),('C0007',44,'数学',86);
INSERT INTO exams VALUES ('C0008',44,'国語',98),('C0008',44,'英語',96),('C0008',44,'数学',82);
INSERT INTO exams VALUES ('C0010',44,'国語',76),('C0010',44,'英語',82),('C0010',44,'数学',72);
INSERT INTO exams VALUES ('C0011',44,'国語',76),('C0011',44,'英語',98),('C0011',44,'数学',84);
INSERT INTO exams VALUES ('C0012',44,'国語',81),('C0012',44,'英語',78),('C0012',44,'数学',100);
INSERT INTO exams VALUES ('C0014',44,'国語',100),('C0014',44,'英語',74),('C0014',44,'数学',65);
INSERT INTO exams VALUES ('C0016',44,'国語',92),('C0016',44,'英語',95),('C0016',44,'数学',99);
INSERT INTO exams VALUES ('C0017',44,'国語',84),('C0017',44,'英語',83),('C0017',44,'数学',95);
INSERT INTO exams VALUES ('C0018',44,'国語',84),('C0018',44,'英語',88),('C0018',44,'数学',84);
INSERT INTO exams VALUES ('C0020',44,'国語',84),('C0020',44,'英語',84),('C0020',44,'数学',65);
INSERT INTO exams VALUES ('C0021',44,'国語',70),('C0021',44,'英語',70),('C0021',44,'数学',79);
INSERT INTO exams VALUES ('C0022',44,'国語',88),('C0022',44,'英語',69),('C0022',44,'数学',82);
INSERT INTO exams VALUES ('C0023',44,'国語',80),('C0023',44,'英語',95),('C0023',44,'数学',85);
INSERT INTO exams VALUES ('C0024',44,'英語',81),('C0024',44,'数学',84);
INSERT INTO exams VALUES ('C0025',44,'国語',65),('C0025',44,'英語',68),('C0025',44,'数学',81);
INSERT INTO exams VALUES ('C0026',44,'国語',44),('C0026',44,'英語',50),('C0026',44,'数学',47);
INSERT INTO exams VALUES ('C0027',44,'国語',78),('C0027',44,'英語',78),('C0027',44,'数学',76);
INSERT INTO exams VALUES ('C0028',44,'国語',61),('C0028',44,'英語',54),('C0028',44,'数学',62);
INSERT INTO exams VALUES ('C0029',44,'国語',96),('C0029',44,'英語',86),('C0029',44,'数学',92);
INSERT INTO exams VALUES ('C0030',44,'国語',71),('C0030',44,'英語',70),('C0030',44,'数学',99);
INSERT INTO exams VALUES ('C0031',44,'国語',79),('C0031',44,'英語',80),('C0031',44,'数学',76);
INSERT INTO exams VALUES ('C0032',44,'国語',78),('C0032',44,'英語',83),('C0032',44,'数学',76);
INSERT INTO exams VALUES ('C0033',44,'英語',98),('C0033',44,'数学',84);
INSERT INTO exams VALUES ('C0034',44,'国語',78),('C0034',44,'英語',85),('C0034',44,'数学',67);
INSERT INTO exams VALUES ('C0035',44,'国語',80),('C0035',44,'英語',81),('C0035',44,'数学',70);
INSERT INTO exams VALUES ('C0036',44,'国語',94),('C0036',44,'英語',82),('C0036',44,'数学',90);
INSERT INTO exams VALUES ('C0037',44,'英語',89),('C0037',44,'数学',85);
INSERT INTO exams VALUES ('C0038',44,'国語',83),('C0038',44,'英語',81),('C0038',44,'数学',91);
INSERT INTO exams VALUES ('C0040',44,'国語',88),('C0040',44,'英語',81),('C0040',44,'数学',82);
INSERT INTO exams VALUES ('C0041',44,'国語',68),('C0041',44,'英語',72),('C0041',44,'数学',67);
INSERT INTO exams VALUES ('C0042',44,'国語',72),('C0042',44,'英語',86),('C0042',44,'数学',76);
INSERT INTO exams VALUES ('C0043',44,'国語',80),('C0043',44,'英語',85),('C0043',44,'数学',92);
INSERT INTO exams VALUES ('C0044',44,'国語',88),('C0044',44,'英語',87),('C0044',44,'数学',67);
INSERT INTO exams VALUES ('C0045',44,'国語',64),('C0045',44,'英語',42),('C0045',44,'数学',58);
INSERT INTO exams VALUES ('C0046',44,'国語',81),('C0046',44,'英語',86),('C0046',44,'数学',87);
INSERT INTO exams VALUES ('C0047',44,'国語',88),('C0047',44,'英語',68),('C0047',44,'数学',95);
INSERT INTO exams VALUES ('C0049',44,'国語',71),('C0049',44,'英語',72),('C0049',44,'数学',82);
INSERT INTO exams VALUES ('C0050',44,'国語',50),('C0050',44,'英語',64),('C0050',44,'数学',44);
INSERT INTO exams VALUES ('C0051',44,'国語',70),('C0051',44,'英語',69),('C0051',44,'数学',83);
INSERT INTO exams VALUES ('C0052',44,'国語',91),('C0052',44,'英語',88),('C0052',44,'数学',80);
INSERT INTO exams VALUES ('C0053',44,'国語',82),('C0053',44,'英語',91),('C0053',44,'数学',84);
INSERT INTO exams VALUES ('C0054',44,'国語',89),('C0054',44,'英語',89),('C0054',44,'数学',89);
INSERT INTO exams VALUES ('C0055',44,'国語',44),('C0055',44,'英語',65),('C0055',44,'数学',45);
INSERT INTO exams VALUES ('C0056',44,'国語',86),('C0056',44,'英語',80),('C0056',44,'数学',80);
INSERT INTO exams VALUES ('C0057',44,'国語',98),('C0057',44,'英語',100),('C0057',44,'数学',99);
INSERT INTO exams VALUES ('C0058',44,'国語',98),('C0058',44,'英語',97),('C0058',44,'数学',85);
INSERT INTO exams VALUES ('C0059',44,'国語',77),('C0059',44,'英語',74),('C0059',44,'数学',82);
INSERT INTO exams VALUES ('C0060',44,'国語',66),('C0060',44,'英語',45),('C0060',44,'数学',64);
INSERT INTO exams VALUES ('C0061',44,'英語',92),('C0061',44,'数学',86);
INSERT INTO exams VALUES ('C0062',44,'国語',65),('C0062',44,'英語',66),('C0062',44,'数学',65);
INSERT INTO exams VALUES ('C0063',44,'国語',66),('C0063',44,'英語',83),('C0063',44,'数学',79);
INSERT INTO exams VALUES ('C0064',44,'国語',74),('C0064',44,'英語',76),('C0064',44,'数学',80);
INSERT INTO exams VALUES ('C0065',44,'国語',95),('C0065',44,'英語',96),('C0065',44,'数学',95);
INSERT INTO exams VALUES ('C0066',44,'国語',92),('C0066',44,'英語',99),('C0066',44,'数学',100);
INSERT INTO exams VALUES ('C0067',44,'国語',89),('C0067',44,'英語',50),('C0067',44,'数学',45);
INSERT INTO exams VALUES ('C0068',44,'国語',41),('C0068',44,'英語',68),('C0068',44,'数学',50);
INSERT INTO exams VALUES ('C0069',44,'国語',69),('C0069',44,'英語',65),('C0069',44,'数学',84);
INSERT INTO exams VALUES ('C0070',44,'国語',42),('C0070',44,'英語',54),('C0070',44,'数学',51);
INSERT INTO exams VALUES ('C0071',44,'国語',53),('C0071',44,'英語',65),('C0071',44,'数学',82);
INSERT INTO exams VALUES ('C0072',44,'国語',65),('C0072',44,'英語',60),('C0072',44,'数学',46);
INSERT INTO exams VALUES ('C0073',44,'国語',49),('C0073',44,'英語',58),('C0073',44,'数学',68);
INSERT INTO exams VALUES ('C0074',44,'国語',93),('C0074',44,'英語',92);
INSERT INTO exams VALUES ('C0075',44,'国語',80),('C0075',44,'英語',73),('C0075',44,'数学',88);
INSERT INTO exams VALUES ('C0076',44,'国語',57),('C0076',44,'英語',40),('C0076',44,'数学',55);
INSERT INTO exams VALUES ('C0077',44,'国語',68),('C0077',44,'英語',56),('C0077',44,'数学',56);
INSERT INTO exams VALUES ('C0078',44,'国語',46),('C0078',44,'英語',46),('C0078',44,'数学',42);
INSERT INTO exams VALUES ('C0079',44,'国語',74),('C0079',44,'英語',79),('C0079',44,'数学',69);
INSERT INTO exams VALUES ('C0080',44,'国語',84),('C0080',44,'英語',81),('C0080',44,'数学',71);
INSERT INTO exams VALUES ('C0081',44,'国語',85),('C0081',44,'英語',99),('C0081',44,'数学',90);
INSERT INTO exams VALUES ('C0082',44,'国語',85),('C0082',44,'英語',76),('C0082',44,'数学',76);
INSERT INTO exams VALUES ('C0083',44,'国語',70),('C0083',44,'英語',86),('C0083',44,'数学',87);
INSERT INTO exams VALUES ('C0084',44,'国語',49),('C0084',44,'英語',47),('C0084',44,'数学',43);
INSERT INTO exams VALUES ('C0085',44,'国語',82),('C0085',44,'英語',70),('C0085',44,'数学',71);
INSERT INTO exams VALUES ('C0086',44,'国語',49),('C0086',44,'英語',70),('C0086',44,'数学',45);
INSERT INTO exams VALUES ('C0087',44,'国語',85),('C0087',44,'英語',95);
INSERT INTO exams VALUES ('C0088',44,'国語',93),('C0088',44,'英語',80),('C0088',44,'数学',65);
INSERT INTO exams VALUES ('C0089',44,'国語',94),('C0089',44,'英語',85),('C0089',44,'数学',90);
INSERT INTO exams VALUES ('C0090',44,'国語',70),('C0090',44,'英語',46),('C0090',44,'数学',65);
INSERT INTO exams VALUES ('C0091',44,'数学',86);
INSERT INTO exams VALUES ('C0092',44,'国語',78),('C0092',44,'英語',73),('C0092',44,'数学',78);
INSERT INTO exams VALUES ('C0093',44,'国語',96),('C0093',44,'英語',98),('C0093',44,'数学',89);
INSERT INTO exams VALUES ('C0094',44,'数学',81);
INSERT INTO exams VALUES ('C0095',44,'国語',95),('C0095',44,'英語',100),('C0095',44,'数学',91);
INSERT INTO exams VALUES ('C0096',44,'国語',80),('C0096',44,'英語',69),('C0096',44,'数学',96);
INSERT INTO exams VALUES ('C0097',44,'国語',83),('C0097',44,'英語',81),('C0097',44,'数学',78);
INSERT INTO exams VALUES ('C0098',44,'国語',77),('C0098',44,'英語',81),('C0098',44,'数学',78);
INSERT INTO exams VALUES ('C0099',44,'国語',73),('C0099',44,'英語',67),('C0099',44,'数学',70);
INSERT INTO exams VALUES ('C0100',44,'国語',59),('C0100',44,'英語',53),('C0100',44,'数学',65);
INSERT INTO exams VALUES ('C0101',44,'国語',69),('C0101',44,'英語',67),('C0101',44,'数学',80);
INSERT INTO exams VALUES ('C0102',44,'国語',66),('C0102',44,'英語',75),('C0102',44,'数学',79);
INSERT INTO exams VALUES ('C0104',44,'国語',73),('C0104',44,'英語',65),('C0104',44,'数学',85);
INSERT INTO exams VALUES ('C0105',44,'国語',92),('C0105',44,'英語',55),('C0105',44,'数学',85);
INSERT INTO exams VALUES ('C0107',44,'国語',92),('C0107',44,'英語',100),('C0107',44,'数学',88);
INSERT INTO exams VALUES ('C0108',44,'国語',62),('C0108',44,'英語',55),('C0108',44,'数学',80);
INSERT INTO exams VALUES ('C0110',44,'国語',51),('C0110',44,'英語',63),('C0110',44,'数学',59);
INSERT INTO exams VALUES ('C0111',44,'国語',68),('C0111',44,'英語',58),('C0111',44,'数学',52);
INSERT INTO exams VALUES ('C0112',44,'国語',46),('C0112',44,'英語',67),('C0112',44,'数学',57);
INSERT INTO exams VALUES ('C0113',44,'国語',47),('C0113',44,'英語',56),('C0113',44,'数学',69);
INSERT INTO exams VALUES ('C0114',44,'国語',46),('C0114',44,'英語',59),('C0114',44,'数学',56);
INSERT INTO exams VALUES ('C0115',44,'国語',69),('C0115',44,'英語',68),('C0115',44,'数学',69);
INSERT INTO exams VALUES ('C0116',44,'国語',41),('C0116',44,'英語',66),('C0116',44,'数学',60);
INSERT INTO exams VALUES ('C0117',44,'国語',87),('C0117',44,'英語',87),('C0117',44,'数学',81);
INSERT INTO exams VALUES ('C0118',44,'国語',100),('C0118',44,'英語',85),('C0118',44,'数学',83);
INSERT INTO exams VALUES ('C0119',44,'国語',89),('C0119',44,'英語',86),('C0119',44,'数学',98);
INSERT INTO exams VALUES ('C0120',44,'国語',50),('C0120',44,'英語',63),('C0120',44,'数学',43);
/*
## no 45
*/
-- DELETE FROM exams WHERE exam_no=45;
INSERT INTO exams VALUES ('C0001',45,'国語',88),('C0001',45,'英語',84),('C0001',45,'数学',99);
INSERT INTO exams VALUES ('C0002',45,'国語',96),('C0002',45,'英語',87),('C0002',45,'数学',98);
INSERT INTO exams VALUES ('C0003',45,'国語',90),('C0003',45,'英語',84),('C0003',45,'数学',83);
INSERT INTO exams VALUES ('C0004',45,'国語',64),('C0004',45,'英語',71),('C0004',45,'数学',72);
INSERT INTO exams VALUES ('C0005',45,'国語',73),('C0005',45,'英語',92),('C0005',45,'数学',82);
INSERT INTO exams VALUES ('C0006',45,'国語',50),('C0006',45,'英語',69),('C0006',45,'数学',70);
INSERT INTO exams VALUES ('C0007',45,'国語',75),('C0007',45,'英語',92),('C0007',45,'数学',78);
INSERT INTO exams VALUES ('C0009',45,'国語',88),('C0009',45,'英語',75),('C0009',45,'数学',88);
INSERT INTO exams VALUES ('C0010',45,'国語',70),('C0010',45,'英語',86),('C0010',45,'数学',92);
INSERT INTO exams VALUES ('C0011',45,'国語',79),('C0011',45,'英語',89),('C0011',45,'数学',96);
INSERT INTO exams VALUES ('C0012',45,'国語',100),('C0012',45,'英語',79),('C0012',45,'数学',100);
INSERT INTO exams VALUES ('C0013',45,'国語',85),('C0013',45,'英語',76),('C0013',45,'数学',70);
INSERT INTO exams VALUES ('C0014',45,'国語',88),('C0014',45,'英語',82),('C0014',45,'数学',84);
INSERT INTO exams VALUES ('C0015',45,'国語',87),('C0015',45,'英語',74),('C0015',45,'数学',75);
INSERT INTO exams VALUES ('C0016',45,'国語',89),('C0016',45,'英語',86),('C0016',45,'数学',96);
INSERT INTO exams VALUES ('C0017',45,'国語',89),('C0017',45,'英語',88),('C0017',45,'数学',82);
INSERT INTO exams VALUES ('C0018',45,'国語',97),('C0018',45,'英語',93),('C0018',45,'数学',98);
INSERT INTO exams VALUES ('C0019',45,'国語',64),('C0019',45,'英語',64),('C0019',45,'数学',69);
INSERT INTO exams VALUES ('C0020',45,'国語',94),('C0020',45,'英語',88),('C0020',45,'数学',81);
INSERT INTO exams VALUES ('C0021',45,'国語',75),('C0021',45,'英語',77),('C0021',45,'数学',74);
INSERT INTO exams VALUES ('C0022',45,'国語',83),('C0022',45,'英語',85),('C0022',45,'数学',72);
INSERT INTO exams VALUES ('C0023',45,'国語',92),('C0023',45,'英語',87),('C0023',45,'数学',94);
INSERT INTO exams VALUES ('C0024',45,'国語',82),('C0024',45,'英語',93),('C0024',45,'数学',90);
INSERT INTO exams VALUES ('C0025',45,'国語',70),('C0025',45,'英語',80),('C0025',45,'数学',78);
INSERT INTO exams VALUES ('C0026',45,'国語',69),('C0026',45,'英語',57),('C0026',45,'数学',72);
INSERT INTO exams VALUES ('C0027',45,'国語',79),('C0027',45,'英語',83),('C0027',45,'数学',84);
INSERT INTO exams VALUES ('C0028',45,'国語',50),('C0028',45,'英語',64),('C0028',45,'数学',67);
INSERT INTO exams VALUES ('C0029',45,'国語',89),('C0029',45,'英語',91),('C0029',45,'数学',99);
INSERT INTO exams VALUES ('C0030',45,'国語',85),('C0030',45,'英語',82),('C0030',45,'数学',99);
INSERT INTO exams VALUES ('C0031',45,'国語',85),('C0031',45,'英語',82),('C0031',45,'数学',81);
INSERT INTO exams VALUES ('C0032',45,'国語',90),('C0032',45,'英語',79),('C0032',45,'数学',74);
INSERT INTO exams VALUES ('C0033',45,'国語',99),('C0033',45,'英語',82),('C0033',45,'数学',95);
INSERT INTO exams VALUES ('C0034',45,'国語',75),('C0034',45,'英語',92),('C0034',45,'数学',76);
INSERT INTO exams VALUES ('C0035',45,'国語',76),('C0035',45,'英語',87),('C0035',45,'数学',81);
INSERT INTO exams VALUES ('C0036',45,'国語',90),('C0036',45,'英語',98),('C0036',45,'数学',90);
INSERT INTO exams VALUES ('C0037',45,'国語',100),('C0037',45,'英語',98),('C0037',45,'数学',100);
INSERT INTO exams VALUES ('C0038',45,'国語',82),('C0038',45,'英語',86),('C0038',45,'数学',86);
INSERT INTO exams VALUES ('C0040',45,'国語',87),('C0040',45,'英語',92),('C0040',45,'数学',95);
INSERT INTO exams VALUES ('C0041',45,'国語',90),('C0041',45,'英語',71),('C0041',45,'数学',71);
INSERT INTO exams VALUES ('C0042',45,'国語',88),('C0042',45,'英語',72),('C0042',45,'数学',90);
INSERT INTO exams VALUES ('C0043',45,'国語',82),('C0043',45,'英語',80),('C0043',45,'数学',94);
INSERT INTO exams VALUES ('C0044',45,'国語',88),('C0044',45,'英語',90),('C0044',45,'数学',83);
INSERT INTO exams VALUES ('C0045',45,'国語',60),('C0045',45,'英語',65),('C0045',45,'数学',69);
INSERT INTO exams VALUES ('C0046',45,'国語',83),('C0046',45,'英語',75),('C0046',45,'数学',92);
INSERT INTO exams VALUES ('C0047',45,'国語',72),('C0047',45,'英語',82),('C0047',45,'数学',87);
INSERT INTO exams VALUES ('C0048',45,'国語',73),('C0048',45,'英語',72),('C0048',45,'数学',80);
INSERT INTO exams VALUES ('C0049',45,'国語',75),('C0049',45,'英語',70),('C0049',45,'数学',92);
INSERT INTO exams VALUES ('C0050',45,'国語',69),('C0050',45,'英語',50),('C0050',45,'数学',60);
INSERT INTO exams VALUES ('C0051',45,'国語',74),('C0051',45,'英語',71),('C0051',45,'数学',74);
INSERT INTO exams VALUES ('C0052',45,'国語',87),('C0052',45,'英語',89),('C0052',45,'数学',83);
INSERT INTO exams VALUES ('C0053',45,'国語',84),('C0053',45,'英語',91),('C0053',45,'数学',92);
INSERT INTO exams VALUES ('C0054',45,'国語',85),('C0054',45,'英語',90),('C0054',45,'数学',95);
INSERT INTO exams VALUES ('C0055',45,'国語',55),('C0055',45,'英語',63),('C0055',45,'数学',63);
INSERT INTO exams VALUES ('C0056',45,'国語',78),('C0056',45,'英語',88),('C0056',45,'数学',89);
INSERT INTO exams VALUES ('C0057',45,'国語',83),('C0057',45,'英語',82),('C0057',45,'数学',90);
INSERT INTO exams VALUES ('C0058',45,'国語',94),('C0058',45,'英語',94),('C0058',45,'数学',100);
INSERT INTO exams VALUES ('C0059',45,'国語',85),('C0059',45,'英語',83),('C0059',45,'数学',88);
INSERT INTO exams VALUES ('C0060',45,'国語',60),('C0060',45,'英語',71),('C0060',45,'数学',73);
INSERT INTO exams VALUES ('C0061',45,'国語',83),('C0061',45,'英語',90),('C0061',45,'数学',88);
INSERT INTO exams VALUES ('C0063',45,'国語',72),('C0063',45,'英語',74),('C0063',45,'数学',85);
INSERT INTO exams VALUES ('C0064',45,'国語',91),('C0064',45,'英語',82),('C0064',45,'数学',80);
INSERT INTO exams VALUES ('C0065',45,'国語',96),('C0065',45,'英語',87),('C0065',45,'数学',82);
INSERT INTO exams VALUES ('C0066',45,'国語',83),('C0066',45,'英語',95),('C0066',45,'数学',99);
INSERT INTO exams VALUES ('C0067',45,'国語',100),('C0067',45,'英語',51),('C0067',45,'数学',53);
INSERT INTO exams VALUES ('C0068',45,'国語',74),('C0068',45,'英語',54),('C0068',45,'数学',67);
INSERT INTO exams VALUES ('C0069',45,'国語',91),('C0069',45,'英語',80),('C0069',45,'数学',79);
INSERT INTO exams VALUES ('C0070',45,'国語',73),('C0070',45,'英語',60),('C0070',45,'数学',72);
INSERT INTO exams VALUES ('C0071',45,'国語',54),('C0071',45,'英語',87),('C0071',45,'数学',90);
INSERT INTO exams VALUES ('C0072',45,'国語',60),('C0072',45,'英語',60),('C0072',45,'数学',70);
INSERT INTO exams VALUES ('C0073',45,'国語',65),('C0073',45,'英語',51),('C0073',45,'数学',70);
INSERT INTO exams VALUES ('C0074',45,'国語',91),('C0074',45,'英語',99),('C0074',45,'数学',91);
INSERT INTO exams VALUES ('C0075',45,'国語',82),('C0075',45,'英語',90),('C0075',45,'数学',90);
INSERT INTO exams VALUES ('C0076',45,'国語',63),('C0076',45,'英語',59),('C0076',45,'数学',63);
INSERT INTO exams VALUES ('C0077',45,'国語',66),('C0077',45,'英語',58),('C0077',45,'数学',67);
INSERT INTO exams VALUES ('C0078',45,'国語',71),('C0078',45,'英語',72),('C0078',45,'数学',68);
INSERT INTO exams VALUES ('C0079',45,'国語',70),('C0079',45,'英語',82),('C0079',45,'数学',78);
INSERT INTO exams VALUES ('C0080',45,'国語',77),('C0080',45,'英語',88),('C0080',45,'数学',89);
INSERT INTO exams VALUES ('C0081',45,'国語',97),('C0081',45,'英語',99),('C0081',45,'数学',83);
INSERT INTO exams VALUES ('C0082',45,'国語',87),('C0082',45,'英語',81),('C0082',45,'数学',83);
INSERT INTO exams VALUES ('C0083',45,'国語',90),('C0083',45,'英語',75),('C0083',45,'数学',71);
INSERT INTO exams VALUES ('C0084',45,'国語',60),('C0084',45,'英語',50),('C0084',45,'数学',66);
INSERT INTO exams VALUES ('C0085',45,'国語',73),('C0085',45,'英語',90),('C0085',45,'数学',91);
INSERT INTO exams VALUES ('C0086',45,'国語',64),('C0086',45,'英語',63),('C0086',45,'数学',63);
INSERT INTO exams VALUES ('C0087',45,'国語',95),('C0087',45,'英語',84),('C0087',45,'数学',98);
INSERT INTO exams VALUES ('C0088',45,'国語',86),('C0088',45,'英語',77),('C0088',45,'数学',92);
INSERT INTO exams VALUES ('C0089',45,'国語',85),('C0089',45,'英語',85),('C0089',45,'数学',83);
INSERT INTO exams VALUES ('C0090',45,'国語',59),('C0090',45,'英語',62),('C0090',45,'数学',57);
INSERT INTO exams VALUES ('C0091',45,'国語',76),('C0091',45,'英語',85),('C0091',45,'数学',90);
INSERT INTO exams VALUES ('C0092',45,'国語',87),('C0092',45,'英語',88),('C0092',45,'数学',85);
INSERT INTO exams VALUES ('C0093',45,'国語',90),('C0093',45,'英語',99),('C0093',45,'数学',85);
INSERT INTO exams VALUES ('C0094',45,'国語',96),('C0094',45,'英語',99),('C0094',45,'数学',99);
INSERT INTO exams VALUES ('C0095',45,'国語',92),('C0095',45,'英語',100),('C0095',45,'数学',96);
INSERT INTO exams VALUES ('C0096',45,'国語',95),('C0096',45,'英語',75),('C0096',45,'数学',86);
INSERT INTO exams VALUES ('C0097',45,'国語',86),('C0097',45,'英語',79),('C0097',45,'数学',76);
INSERT INTO exams VALUES ('C0098',45,'国語',70),('C0098',45,'英語',70),('C0098',45,'数学',88);
INSERT INTO exams VALUES ('C0099',45,'国語',72),('C0099',45,'英語',74),('C0099',45,'数学',84);
INSERT INTO exams VALUES ('C0100',45,'国語',65),('C0100',45,'英語',70),('C0100',45,'数学',53);
INSERT INTO exams VALUES ('C0101',45,'国語',84),('C0101',45,'英語',89),('C0101',45,'数学',77);
INSERT INTO exams VALUES ('C0102',45,'国語',87),('C0102',45,'英語',85),('C0102',45,'数学',82);
INSERT INTO exams VALUES ('C0103',45,'国語',72),('C0103',45,'英語',57),('C0103',45,'数学',69);
INSERT INTO exams VALUES ('C0104',45,'国語',91),('C0104',45,'英語',88),('C0104',45,'数学',79);
INSERT INTO exams VALUES ('C0105',45,'国語',99),('C0105',45,'英語',73),('C0105',45,'数学',95);
INSERT INTO exams VALUES ('C0106',45,'国語',96),('C0106',45,'英語',83),('C0106',45,'数学',100);
INSERT INTO exams VALUES ('C0107',45,'国語',89),('C0107',45,'英語',84),('C0107',45,'数学',92);
INSERT INTO exams VALUES ('C0108',45,'国語',50),('C0108',45,'英語',59),('C0108',45,'数学',70);
INSERT INTO exams VALUES ('C0110',45,'国語',52),('C0110',45,'英語',56),('C0110',45,'数学',70);
INSERT INTO exams VALUES ('C0111',45,'国語',59),('C0111',45,'英語',69),('C0111',45,'数学',70);
INSERT INTO exams VALUES ('C0112',45,'国語',54),('C0112',45,'英語',73),('C0112',45,'数学',56);
INSERT INTO exams VALUES ('C0113',45,'国語',52),('C0113',45,'英語',71),('C0113',45,'数学',58);
INSERT INTO exams VALUES ('C0114',45,'国語',66),('C0114',45,'英語',70),('C0114',45,'数学',65);
INSERT INTO exams VALUES ('C0115',45,'国語',81),('C0115',45,'英語',71),('C0115',45,'数学',77);
INSERT INTO exams VALUES ('C0116',45,'国語',68),('C0116',45,'英語',56),('C0116',45,'数学',57);
INSERT INTO exams VALUES ('C0117',45,'国語',92),('C0117',45,'英語',90),('C0117',45,'数学',82);
INSERT INTO exams VALUES ('C0118',45,'国語',92),('C0118',45,'英語',84),('C0118',45,'数学',99);
INSERT INTO exams VALUES ('C0119',45,'国語',82),('C0119',45,'英語',97),('C0119',45,'数学',95);
INSERT INTO exams VALUES ('C0120',45,'国語',64),('C0120',45,'英語',71),('C0120',45,'数学',70);

-- ビュー権限サンプル
DROP VIEW IF EXISTS view2, view1;

/*
# 商品・仕入先・倉庫テーブル
  第4正規形、第5正規形、ドメイン正規形サンプル
 （3章サンプルで使用しているテーブル名と重複していたため変更）
*/
DROP TABLE IF EXISTS 商品仕入先倉庫表_dk;
DROP TABLE IF EXISTS 商品仕入先表_dk;
DROP TABLE IF EXISTS 商品仕入先倉庫表;
DROP TABLE IF EXISTS 商品仕入先表;
DROP TABLE IF EXISTS 商品倉庫表;
DROP TABLE IF EXISTS 仕入先倉庫表;
DROP TABLE IF EXISTS 商品表;
DROP TABLE IF EXISTS 仕入先表;
DROP TABLE IF EXISTS 倉庫表;

-- マスターテーブル（商品、倉庫、仕入先）
CREATE TABLE 商品表 (
    商品 CHAR(3) NOT NULL PRIMARY KEY,
    商品名称 VARCHAR(255) NOT NULL
);

INSERT INTO 商品表 VALUES
('001','商品001'),
('002','商品002'),
('003','商品003'),
('004','商品004');

CREATE TABLE 仕入先表 (
    仕入先 CHAR(3) NOT NULL PRIMARY KEY,
    仕入先名称 VARCHAR(255) NOT NULL
);

INSERT INTO 仕入先表 VALUES
('S01','仕入先01'),
('S02','仕入先02'),
('S03','仕入先03'),
('S04','仕入先04');

CREATE TABLE 倉庫表 (
    倉庫 CHAR(2) NOT NULL PRIMARY KEY
);

INSERT INTO 倉庫表 VALUES
('X1'),
('X2'),
('Y1'),
('Y2'),
('Z1'),
('Z2');


-- 商品と仕入先と倉庫（元のテーブル）
CREATE TABLE 商品仕入先倉庫表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫)
);

INSERT INTO 商品仕入先倉庫表 VALUES
('001', 'S01', 'X1'),
('001', 'S01', 'Y1'),
('001', 'S01', 'Z1'),
('001', 'S01', 'X2'),
('001', 'S02', 'X1'),
('001', 'S02', 'Y1'),
('002', 'S01', 'Z1'),
('002', 'S01', 'X2'),
('003', 'S03', 'X1'),
('003', 'S02', 'X1');

-- 商品と仕入先（第4正規形）
CREATE TABLE 商品仕入先表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    PRIMARY KEY(商品, 仕入先),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品と倉庫（第4正規形）
CREATE TABLE 商品倉庫表 (
    商品 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫)
);

-- 元データから商品と倉庫の組み合わせを生成して登録
INSERT INTO 商品倉庫表
SELECT DISTINCT 商品, 倉庫 FROM 商品仕入先倉庫表;

-- 仕入先と倉庫（第5正規形）
CREATE TABLE 仕入先倉庫表 (
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(仕入先, 倉庫)
);

-- 元データから仕入先と倉庫の組み合わせを生成して登録
INSERT INTO 仕入先倉庫表
SELECT DISTINCT 仕入先, 倉庫 FROM 商品仕入先倉庫表;

-- 商品仕入先表テーブル（ドメインキー正規形）
CREATE TABLE 商品仕入先表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    PRIMARY KEY(商品, 仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表_dk
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品仕入先倉庫表テーブル（ドメインキー正規形、外部キー追加）
CREATE TABLE 商品仕入先倉庫表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫),
    FOREIGN KEY(商品, 仕入先) REFERENCES 商品仕入先表_dk(商品, 仕入先)
);

-- 元データを登録
-- （商品仕入先表テーブルにない組み合わせは登録できなくなっている）
INSERT INTO 商品仕入先倉庫表_dk
SELECT * FROM 商品仕入先倉庫表;

/*
# 外部結合用サンプル（c1, c2, c3）
*/
DROP TABLE IF EXISTS c1, c2;

CREATE TABLE c1(
    code INTEGER PRIMARY KEY,
    color VARCHAR(255)
);
INSERT INTO c1 VALUES(1, '赤'),(2, '白'),(3, '青');

CREATE TABLE c2(
    code INTEGER PRIMARY KEY,
    size CHAR
);
INSERT INTO c2 VALUES(2, 'S'),(4, 'L');

/*
# 自己結合サンプル（membersテーブル）
*/

DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id CHAR(3)
);

-- (補足)自分のテーブルに対する参照の場合CREATE TABLEでは設定できないので
-- ALTER TABLEを使用する
-- ※設定していなくても自己結合のテストは可能
ALTER TABLE members
ADD FOREIGN KEY (manager_id) REFERENCES members (id);

INSERT INTO members VALUES
('001', '岡本 にゃん吉',  NULL),
('002', '戸川 ちゃつね', '001'),
('003', '森川 リリィ',   '002'),
('004', '森川 エミリ',   '002'),
('005', '山本 蘭々',     '004');


/*
# 3つのテーブルによるJOINのサンプル
*/

DROP TABLE IF EXISTS t2room;
DROP TABLE IF EXISTS t2teacher;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
    code CHAR(2) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO t1 VALUES ('P1', '一郎'),('P2', '次郎'),('P3', '三郎');
-- 外部結合用
INSERT INTO t1 VALUES ('P4','史郎');


CREATE TABLE t2(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t2 VALUES ('P1', '歴史'),('P1', '哲学'),('P2', '物理'),('P3', '地学');
-- 外部結合用
INSERT INTO t2 VALUES('P4','地学');


CREATE TABLE t3(
    code CHAR(2) NOT NULL,
    club VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, club),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t3 VALUES ('P1', '音楽'),('P2', '映画'),('P3', '音楽'),('P3', '映画');

-- 二つの列によるJOINサンプル
CREATE TABLE t2room (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    room VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2room(code,subject,room) VALUES
('P1','哲学','T1'),
('P1','歴史','R1'),
('P2','物理','B1'),
('P3','地学','C1'),
('P4','地学','C2');

CREATE TABLE t2teacher (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    teacher VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2teacher(code,subject,teacher) VALUES
('P1','哲学','ジョナサン'),
('P1','歴史','山本'),
('P2','物理','田中'),
('P3','地学','岡田'),
('P4','地学','シバタ');

/*
# NULLIF、COALESCEサンプル（members_carテーブル、members_telテーブル）
※実行サンプルなのでイメージしやすいよう各テーブルにnameを入れていますが
  このように、複数のテーブルにnameを入れるのは更新不整合の元になります。
*/

DROP TABLE IF EXISTS members_car;
CREATE TABLE members_car (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mycar VARCHAR(255)
);

INSERT INTO members_car VALUES
('001', '岡本 にゃん吉', '14-5'),
('002', '戸川 ちゃつね', NULL),
('003', '森川 リリィ',   '32-1'),
('004', '森川 エミリ',   ''),
('005', '山本 蘭々',     '26-8');

DROP TABLE IF EXISTS members_tel;
CREATE TABLE members_tel (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(255),
    home VARCHAR(255)
);

INSERT INTO members_tel VALUES
('001', '岡本 にゃん吉', NULL, '033552104X'),
('002', '戸川 ちゃつね', '0803075953X', '037700269X'),
('003', '森川 リリィ',   '0801764195X', NULL),
('004', '森川 エミリ',   '0901793519X', NULL),
('005', '山本 蘭々',     NULL, NULL);

/*
# 集約関数のテスト
*/
DROP TABLE IF EXISTS groupby_test;
CREATE TABLE groupby_test (
    name CHAR(1) PRIMARY KEY,
    price INTEGER
);
INSERT INTO groupby_test VALUES
('A', 100),
('B', 20),
('C', 0),
('D', NULL);

/*
# UNION用サンプル（staff, mentor）
*/

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
    staff_id CHAR(5) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course_subject VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
    -- subject_masterテーブルについてはケーススタディ参照（sampledb2）
    -- ,FOREIGN KEY (course_subject) REFERENCES sampledb2.subject_master(course_subject)
);

INSERT INTO staff VALUES
('S0101','森 茶太郎','国語','0809169251X','mori_fukurou@fk.example.jp'),
('S0102','花村 ささめ','英語','0907264800X','hana_fukurou@fk.example.jp'),
('S0103','西野 蓮','英語','0801303011X','nisren_fukurou@fk.example.jp'),
('S0104','大崎 ジョン','数学','0802854730X','john_fukurou@fk.example.jp'),
('S0105','田村 真由子','数学','0803589347X','mayu_fukurou@fk.example.jp');

DROP TABLE IF EXISTS mentor;
CREATE TABLE mentor(
    -- mentor_id CHAR(3) PRIMARY KEY, -- テスト用にstaff_idとは異なるデータ型を使用
    mentor_no INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL
    -- , FOREIGN KEY (branch) REFERENCES sampledb2.branch_master(branch)
);

INSERT INTO mentor VALUES
(2,'山村 つみれ','池袋','0903421788X'),
(4,'大崎 ジョン','新宿','0802854730X'),
(5,'土谷 礼奈','池袋','0809184295X'),
(8,'香坂 理恵子','新宿','0804063145X'),
(12,'矢田 たつまる','渋谷','0903621248X'),
(16,'石本 りんりん','渋谷','0902643023X'),
(17,'中山 隆之介','品川','0907004567X'),
(18,'長崎 ごん','品川','0802214770X');

/*
# CASE式用サンプル（members_tsukin、members_color）
*/

-- members_tsukin
DROP TABLE IF EXISTS members_tsukin;
CREATE TABLE members_tsukin (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    tsukin_kubun INTEGER NOT NULL
);

INSERT INTO members_tsukin VALUES
('001','岡本 にゃん吉','2'),
('002','戸川 ちゃつね','1'),
('003','森川 リリィ','2'),
('004','森川 エミリ','0'),
('005','山本 蘭々','2');

-- members_color
DROP TABLE IF EXISTS members_color;
CREATE TABLE members_color (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    c1 VARCHAR(255),
    c2 VARCHAR(255),
    c3 VARCHAR(255)
);

INSERT INTO members_color VALUES
('001','岡本 にゃん吉','yellow',NULL,'red'),
('002','戸川 ちゃつね',NULL,'yellow','green'),
('003','森川 リリィ','red','blue',NULL),
('004','森川 エミリ',NULL,'green','red'),
('005','山本 蘭々','blue',NULL,'yellow');


/*
# サブクエリ用サンプル（bungu, hanbai_header, hanbai）
*/
DROP TABLE IF EXISTS hanbai;
DROP TABLE IF EXISTS hanbai_header;
DROP TABLE IF EXISTS bungu;
CREATE TABLE bungu(
bungu_code CHAR(3) PRIMARY KEY,
bungu_name VARCHAR(255) NOT NULL,
std_price INTEGER -- NOT NULL -- NULLのデータが入ったケースの実験用（6.8）
);

INSERT INTO bungu VALUES
('S01','notebook A',120),
('S02','notebook B',250),
('S03','marker yellow',100),
('S04','marker red',280),
('S05','marker green',300);

CREATE TABLE hanbai_header(
    order_code CHAR(6) PRIMARY KEY,
    tokui_code CHAR(3) NOT NULL
);

INSERT INTO hanbai_header VALUES
('XX0011', 'T01'),
('XX0012', 'T02'),
('XX0013', 'T03'),
('XX0014', 'T01'),
('XX0015', 'T02');

CREATE TABLE hanbai(
    order_code CHAR(6) NOT NULL,
    bungu_code CHAR(3) NOT NULL,
    act_price INTEGER NOT NULL, -- 実売価格
    qty INTEGER NOT NULL, -- 販売個数
    PRIMARY KEY (order_code, bungu_code),
    FOREIGN KEY (order_code) REFERENCES hanbai_header(order_code),
    FOREIGN KEY (bungu_code) REFERENCES bungu(bungu_code)
);

INSERT INTO hanbai VALUES
('XX0011','S01',120,10),
('XX0011','S02',225,5),
('XX0012','S01',96,150),
('XX0012','S02',200,150),
('XX0012','S03',80,100),
('XX0013','S02',225,10),
('XX0013','S04',252,10),
('XX0014','S01',96,100),
('XX0014','S04',224,100),
('XX0015','S03',100,25),
('XX0015','S04',252,25),
('XX0015','S05',270,50);

/*
# 直積サンプル（学生マスターと専攻科目）
*/
DROP TABLE IF EXISTS 専攻科目;
DROP TABLE IF EXISTS 学生マスター;

CREATE TABLE 学生マスター(
    code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE 専攻科目(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL
);

INSERT INTO 学生マスター VALUES
('P1', '一郎'),
('P1', '次郎');

INSERT INTO 専攻科目 VALUES
('P1', '歴史'),
('P1', '哲学'),
('P2', '物理');

/*
# 射影サンプル
*/
DROP TABLE IF EXISTS 仕入伝票;
CREATE TABLE 仕入伝票 (
    伝票番号 CHAR(6) NOT NULL,
    商品コード CHAR(3) NOT NULL,
    単価 INTEGER NOT NULL,
    個数 INTEGER NOT NULL
);

INSERT INTO 仕入伝票 VALUES
('XX0011','001',120,10),
('XX0011','002',225,5),
('XX0012','001',96,150),
('XX0012','002',200,150),
('XX0012','003',80,100),
('XX0013','002',225,10),
('XX0013','004',252,10),
('XX0014','001',96,100),
('XX0014','004',224,100),
('XX0015','003',100,25),
('XX0015','004',252,25);

/*
# 関係除算サンプル（品揃えリスト）
*/

DROP TABLE IF EXISTS 品揃えリスト;
CREATE TABLE 品揃えリスト(
    店名 VARCHAR(255),
    商品 VARCHAR(255)
);
INSERT INTO 品揃えリスト VALUES
('A店','野菜'),
('Y店','洋服'),
('Y店','くつ'),
('Y店','加工食品'),
('Y店','クスリ'),
('S店','野菜'),
('S店','鮮魚'),
('S店','加工食品'),
('P店','洋服'),
('P店','画材'),
('P店','野菜'),
('P店','クスリ'),
('P店','加工食品');

DROP TABLE IF EXISTS ほしい物リスト;
CREATE TABLE ほしい物リスト(
    商品 VARCHAR(255)
);
INSERT INTO ほしい物リスト VALUES
('野菜'),
('加工食品');

/*
# 年次月次変換（UNION、INSERT、CASE）
*/

DROP TABLE IF EXISTS phase_results;
CREATE TABLE phase_results(
    phase INTEGER PRIMARY KEY,
    r01 INTEGER,
    r02 INTEGER,
    r03 INTEGER,
    r04 INTEGER,
    r05 INTEGER,
    r06 INTEGER,
    r07 INTEGER,
    r08 INTEGER,
    r09 INTEGER,
    r10 INTEGER,
    r11 INTEGER,
    r12 INTEGER
);

INSERT INTO phase_results VALUES
(1,15,14,20,30,28,41,28,49,18,59,37,30),
(2,30,14,20,23,20,50,13,35,9,60,55,22),
(3,40,23,35,35,40,48,17,56,41,36,24,30),
(4,55,40,61,50,60,57,45,NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS month_results;
CREATE TABLE month_results(
    phase INTEGER NOT NULL CHECK (phase>0),
    month INTEGER NOT NULL CHECK (month BETWEEN 1 AND 12),
    results INTEGER NOT NULL,
    PRIMARY KEY(phase, month)
);
INSERT INTO month_results(phase, month, results)
SELECT phase,  1, r01 FROM phase_results WHERE r01 IS NOT NULL
UNION ALL
SELECT phase,  2, r02 FROM phase_results WHERE r02 IS NOT NULL
UNION ALL
SELECT phase,  3, r03 FROM phase_results WHERE r03 IS NOT NULL
UNION ALL
SELECT phase,  4, r04 FROM phase_results WHERE r04 IS NOT NULL
UNION ALL
SELECT phase,  5, r05 FROM phase_results WHERE r05 IS NOT NULL
UNION ALL
SELECT phase,  6, r06 FROM phase_results WHERE r06 IS NOT NULL
UNION ALL
SELECT phase,  7, r07 FROM phase_results WHERE r07 IS NOT NULL
UNION ALL
SELECT phase,  8, r08 FROM phase_results WHERE r08 IS NOT NULL
UNION ALL
SELECT phase,  9, r09 FROM phase_results WHERE r09 IS NOT NULL
UNION ALL
SELECT phase, 10, r10 FROM phase_results WHERE r10 IS NOT NULL
UNION ALL
SELECT phase, 11, r11 FROM phase_results WHERE r11 IS NOT NULL
UNION ALL
SELECT phase, 12, r12 FROM phase_results WHERE r12 IS NOT NULL
;


-- ビュー権限サンプル
DROP VIEW IF EXISTS view2, view1;

/*
# 商品・仕入先・倉庫テーブル
  第4正規形、第5正規形、ドメイン正規形サンプル
 （3章サンプルで使用しているテーブル名と重複していたため変更）
*/
DROP TABLE IF EXISTS 商品仕入先倉庫表_dk;
DROP TABLE IF EXISTS 商品仕入先表_dk;
DROP TABLE IF EXISTS 商品仕入先倉庫表;
DROP TABLE IF EXISTS 商品仕入先表;
DROP TABLE IF EXISTS 商品倉庫表;
DROP TABLE IF EXISTS 仕入先倉庫表;
DROP TABLE IF EXISTS 商品表;
DROP TABLE IF EXISTS 仕入先表;
DROP TABLE IF EXISTS 倉庫表;

-- マスターテーブル（商品、倉庫、仕入先）
CREATE TABLE 商品表 (
    商品 CHAR(3) NOT NULL PRIMARY KEY,
    商品名称 VARCHAR(255) NOT NULL
);

INSERT INTO 商品表 VALUES
('001','商品001'),
('002','商品002'),
('003','商品003'),
('004','商品004');

CREATE TABLE 仕入先表 (
    仕入先 CHAR(3) NOT NULL PRIMARY KEY,
    仕入先名称 VARCHAR(255) NOT NULL
);

INSERT INTO 仕入先表 VALUES
('S01','仕入先01'),
('S02','仕入先02'),
('S03','仕入先03'),
('S04','仕入先04');

CREATE TABLE 倉庫表 (
    倉庫 CHAR(2) NOT NULL PRIMARY KEY
);

INSERT INTO 倉庫表 VALUES
('X1'),
('X2'),
('Y1'),
('Y2'),
('Z1'),
('Z2');


-- 商品と仕入先と倉庫（元のテーブル）
CREATE TABLE 商品仕入先倉庫表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫)
);

INSERT INTO 商品仕入先倉庫表 VALUES
('001', 'S01', 'X1'),
('001', 'S01', 'Y1'),
('001', 'S01', 'Z1'),
('001', 'S01', 'X2'),
('001', 'S02', 'X1'),
('001', 'S02', 'Y1'),
('002', 'S01', 'Z1'),
('002', 'S01', 'X2'),
('003', 'S03', 'X1'),
('003', 'S02', 'X1');

-- 商品と仕入先（第4正規形）
CREATE TABLE 商品仕入先表 (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    PRIMARY KEY(商品, 仕入先),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品と倉庫（第4正規形）
CREATE TABLE 商品倉庫表 (
    商品 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫)
);

-- 元データから商品と倉庫の組み合わせを生成して登録
INSERT INTO 商品倉庫表
SELECT DISTINCT 商品, 倉庫 FROM 商品仕入先倉庫表;

-- 仕入先と倉庫（第5正規形）
CREATE TABLE 仕入先倉庫表 (
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(仕入先, 倉庫)
);

-- 元データから仕入先と倉庫の組み合わせを生成して登録
INSERT INTO 仕入先倉庫表
SELECT DISTINCT 仕入先, 倉庫 FROM 商品仕入先倉庫表;

-- 商品仕入先表テーブル（ドメインキー正規形）
CREATE TABLE 商品仕入先表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    PRIMARY KEY(商品, 仕入先)
);

-- 元データから商品と仕入先の組み合わせを生成して登録
INSERT INTO 商品仕入先表_dk
SELECT DISTINCT 商品, 仕入先 FROM 商品仕入先倉庫表;

-- 商品仕入先倉庫表テーブル（ドメインキー正規形、外部キー追加）
CREATE TABLE 商品仕入先倉庫表_dk (
    商品 CHAR(3) NOT NULL,
    仕入先 CHAR(3) NOT NULL,
    倉庫 CHAR(2) NOT NULL,
    PRIMARY KEY(商品, 仕入先, 倉庫),
    FOREIGN KEY(商品) REFERENCES 商品表 (商品),
    FOREIGN KEY(仕入先) REFERENCES 仕入先表 (仕入先),
    FOREIGN KEY(倉庫) REFERENCES 倉庫表 (倉庫),
    FOREIGN KEY(商品, 仕入先) REFERENCES 商品仕入先表_dk(商品, 仕入先)
);

-- 元データを登録
-- （商品仕入先表テーブルにない組み合わせは登録できなくなっている）
INSERT INTO 商品仕入先倉庫表_dk
SELECT * FROM 商品仕入先倉庫表;

/*
# 外部結合用サンプル（c1, c2, c3）
*/
DROP TABLE IF EXISTS c1, c2;

CREATE TABLE c1(
    code INTEGER PRIMARY KEY,
    color VARCHAR(255)
);
INSERT INTO c1 VALUES(1, '赤'),(2, '白'),(3, '青');

CREATE TABLE c2(
    code INTEGER PRIMARY KEY,
    size CHAR
);
INSERT INTO c2 VALUES(2, 'S'),(4, 'L');

/*
# 自己結合サンプル（membersテーブル）
*/

DROP TABLE IF EXISTS members;
CREATE TABLE members (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    manager_id CHAR(3)
);

-- (補足)自分のテーブルに対する参照の場合CREATE TABLEでは設定できないので
-- ALTER TABLEを使用する
-- ※設定していなくても自己結合のテストは可能
ALTER TABLE members
ADD FOREIGN KEY (manager_id) REFERENCES members (id);

INSERT INTO members VALUES
('001', '岡本 にゃん吉',  NULL),
('002', '戸川 ちゃつね', '001'),
('003', '森川 リリィ',   '002'),
('004', '森川 エミリ',   '002'),
('005', '山本 蘭々',     '004');


/*
# 3つのテーブルによるJOINのサンプル
*/

DROP TABLE IF EXISTS t2room;
DROP TABLE IF EXISTS t2teacher;
DROP TABLE IF EXISTS t2;
DROP TABLE IF EXISTS t3;
DROP TABLE IF EXISTS t1;
CREATE TABLE t1(
    code CHAR(2) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
INSERT INTO t1 VALUES ('P1', '一郎'),('P2', '次郎'),('P3', '三郎');
-- 外部結合用
INSERT INTO t1 VALUES ('P4','史郎');


CREATE TABLE t2(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t2 VALUES ('P1', '歴史'),('P1', '哲学'),('P2', '物理'),('P3', '地学');
-- 外部結合用
INSERT INTO t2 VALUES('P4','地学');


CREATE TABLE t3(
    code CHAR(2) NOT NULL,
    club VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, club),
    FOREIGN KEY (code) REFERENCES t1 (code)
);
INSERT INTO t3 VALUES ('P1', '音楽'),('P2', '映画'),('P3', '音楽'),('P3', '映画');

-- 二つの列によるJOINサンプル
CREATE TABLE t2room (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    room VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2room(code,subject,room) VALUES
('P1','哲学','T1'),
('P1','歴史','R1'),
('P2','物理','B1'),
('P3','地学','C1'),
('P4','地学','C2');

CREATE TABLE t2teacher (
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    teacher VARCHAR(255) NOT NULL,
    PRIMARY KEY (code, subject),
    FOREIGN KEY (code) REFERENCES t1 (code),
    FOREIGN KEY (code, subject) REFERENCES t2 (code, subject)
);

INSERT INTO t2teacher(code,subject,teacher) VALUES
('P1','哲学','ジョナサン'),
('P1','歴史','山本'),
('P2','物理','田中'),
('P3','地学','岡田'),
('P4','地学','シバタ');

/*
# NULLIF、COALESCEサンプル（members_carテーブル、members_telテーブル）
※実行サンプルなのでイメージしやすいよう各テーブルにnameを入れていますが
  このように、複数のテーブルにnameを入れるのは更新不整合の元になります。
*/

DROP TABLE IF EXISTS members_car;
CREATE TABLE members_car (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mycar VARCHAR(255)
);

INSERT INTO members_car VALUES
('001', '岡本 にゃん吉', '14-5'),
('002', '戸川 ちゃつね', NULL),
('003', '森川 リリィ',   '32-1'),
('004', '森川 エミリ',   ''),
('005', '山本 蘭々',     '26-8');

DROP TABLE IF EXISTS members_tel;
CREATE TABLE members_tel (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    mobile VARCHAR(255),
    home VARCHAR(255)
);

INSERT INTO members_tel VALUES
('001', '岡本 にゃん吉', NULL, '033552104X'),
('002', '戸川 ちゃつね', '0803075953X', '037700269X'),
('003', '森川 リリィ',   '0801764195X', NULL),
('004', '森川 エミリ',   '0901793519X', NULL),
('005', '山本 蘭々',     NULL, NULL);

/*
# 集約関数のテスト
*/
DROP TABLE IF EXISTS groupby_test;
CREATE TABLE groupby_test (
    name CHAR(1) PRIMARY KEY,
    price INTEGER
);
INSERT INTO groupby_test VALUES
('A', 100),
('B', 20),
('C', 0),
('D', NULL);

/*
# UNION用サンプル（staff, mentor）
*/

DROP TABLE IF EXISTS staff;
CREATE TABLE staff(
    staff_id CHAR(5) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    course_subject VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
    -- subject_masterテーブルについてはケーススタディ参照（sampledb2）
    -- ,FOREIGN KEY (course_subject) REFERENCES sampledb2.subject_master(course_subject)
);

INSERT INTO staff VALUES
('S0101','森 茶太郎','国語','0809169251X','mori_fukurou@fk.example.jp'),
('S0102','花村 ささめ','英語','0907264800X','hana_fukurou@fk.example.jp'),
('S0103','西野 蓮','英語','0801303011X','nisren_fukurou@fk.example.jp'),
('S0104','大崎 ジョン','数学','0802854730X','john_fukurou@fk.example.jp'),
('S0105','田村 真由子','数学','0803589347X','mayu_fukurou@fk.example.jp');

DROP TABLE IF EXISTS mentor;
CREATE TABLE mentor(
    -- mentor_id CHAR(3) PRIMARY KEY, -- テスト用にstaff_idとは異なるデータ型を使用
    mentor_no INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL
    -- , FOREIGN KEY (branch) REFERENCES sampledb2.branch_master(branch)
);

INSERT INTO mentor VALUES
(2,'山村 つみれ','池袋','0903421788X'),
(4,'大崎 ジョン','新宿','0802854730X'),
(5,'土谷 礼奈','池袋','0809184295X'),
(8,'香坂 理恵子','新宿','0804063145X'),
(12,'矢田 たつまる','渋谷','0903621248X'),
(16,'石本 りんりん','渋谷','0902643023X'),
(17,'中山 隆之介','品川','0907004567X'),
(18,'長崎 ごん','品川','0802214770X');

/*
# CASE式用サンプル（members_tsukin、members_color）
*/

-- members_tsukin
DROP TABLE IF EXISTS members_tsukin;
CREATE TABLE members_tsukin (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    tsukin_kubun INTEGER NOT NULL
);

INSERT INTO members_tsukin VALUES
('001','岡本 にゃん吉','2'),
('002','戸川 ちゃつね','1'),
('003','森川 リリィ','2'),
('004','森川 エミリ','0'),
('005','山本 蘭々','2');

-- members_color
DROP TABLE IF EXISTS members_color;
CREATE TABLE members_color (
    id CHAR(3) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    c1 VARCHAR(255),
    c2 VARCHAR(255),
    c3 VARCHAR(255)
);

INSERT INTO members_color VALUES
('001','岡本 にゃん吉','yellow',NULL,'red'),
('002','戸川 ちゃつね',NULL,'yellow','green'),
('003','森川 リリィ','red','blue',NULL),
('004','森川 エミリ',NULL,'green','red'),
('005','山本 蘭々','blue',NULL,'yellow');


/*
# サブクエリ用サンプル（bungu, hanbai_header, hanbai）
*/
DROP TABLE IF EXISTS hanbai;
DROP TABLE IF EXISTS hanbai_header;
DROP TABLE IF EXISTS bungu;
CREATE TABLE bungu(
bungu_code CHAR(3) PRIMARY KEY,
bungu_name VARCHAR(255) NOT NULL,
std_price INTEGER -- NOT NULL -- NULLのデータが入ったケースの実験用（6.8）
);

INSERT INTO bungu VALUES
('S01','notebook A',120),
('S02','notebook B',250),
('S03','marker yellow',100),
('S04','marker red',280),
('S05','marker green',300);

CREATE TABLE hanbai_header(
    order_code CHAR(6) PRIMARY KEY,
    tokui_code CHAR(3) NOT NULL
);

INSERT INTO hanbai_header VALUES
('XX0011', 'T01'),
('XX0012', 'T02'),
('XX0013', 'T03'),
('XX0014', 'T01'),
('XX0015', 'T02');

CREATE TABLE hanbai(
    order_code CHAR(6) NOT NULL,
    bungu_code CHAR(3) NOT NULL,
    act_price INTEGER NOT NULL, -- 実売価格
    qty INTEGER NOT NULL, -- 販売個数
    PRIMARY KEY (order_code, bungu_code),
    FOREIGN KEY (order_code) REFERENCES hanbai_header(order_code),
    FOREIGN KEY (bungu_code) REFERENCES bungu(bungu_code)
);

INSERT INTO hanbai VALUES
('XX0011','S01',120,10),
('XX0011','S02',225,5),
('XX0012','S01',96,150),
('XX0012','S02',200,150),
('XX0012','S03',80,100),
('XX0013','S02',225,10),
('XX0013','S04',252,10),
('XX0014','S01',96,100),
('XX0014','S04',224,100),
('XX0015','S03',100,25),
('XX0015','S04',252,25),
('XX0015','S05',270,50);

/*
# 直積サンプル（学生マスターと専攻科目）
*/
DROP TABLE IF EXISTS 専攻科目;
DROP TABLE IF EXISTS 学生マスター;

CREATE TABLE 学生マスター(
    code CHAR(2) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE 専攻科目(
    code CHAR(2) NOT NULL,
    subject VARCHAR(255) NOT NULL
);

INSERT INTO 学生マスター VALUES
('P1', '一郎'),
('P1', '次郎');

INSERT INTO 専攻科目 VALUES
('P1', '歴史'),
('P1', '哲学'),
('P2', '物理');

/*
# 射影サンプル
*/
DROP TABLE IF EXISTS 仕入伝票;
CREATE TABLE 仕入伝票 (
    伝票番号 CHAR(6) NOT NULL,
    商品コード CHAR(3) NOT NULL,
    単価 INTEGER NOT NULL,
    個数 INTEGER NOT NULL
);

INSERT INTO 仕入伝票 VALUES
('XX0011','001',120,10),
('XX0011','002',225,5),
('XX0012','001',96,150),
('XX0012','002',200,150),
('XX0012','003',80,100),
('XX0013','002',225,10),
('XX0013','004',252,10),
('XX0014','001',96,100),
('XX0014','004',224,100),
('XX0015','003',100,25),
('XX0015','004',252,25);

/*
# 関係除算サンプル（品揃えリスト）
*/

DROP TABLE IF EXISTS 品揃えリスト;
CREATE TABLE 品揃えリスト(
    店名 VARCHAR(255),
    商品 VARCHAR(255)
);
INSERT INTO 品揃えリスト VALUES
('A店','野菜'),
('Y店','洋服'),
('Y店','くつ'),
('Y店','加工食品'),
('Y店','クスリ'),
('S店','野菜'),
('S店','鮮魚'),
('S店','加工食品'),
('P店','洋服'),
('P店','画材'),
('P店','野菜'),
('P店','クスリ'),
('P店','加工食品');

DROP TABLE IF EXISTS ほしい物リスト;
CREATE TABLE ほしい物リスト(
    商品 VARCHAR(255)
);
INSERT INTO ほしい物リスト VALUES
('野菜'),
('加工食品');

/*
# 年次月次変換（UNION、INSERT、CASE）
*/

DROP TABLE IF EXISTS phase_results;
CREATE TABLE phase_results(
    phase INTEGER PRIMARY KEY,
    r01 INTEGER,
    r02 INTEGER,
    r03 INTEGER,
    r04 INTEGER,
    r05 INTEGER,
    r06 INTEGER,
    r07 INTEGER,
    r08 INTEGER,
    r09 INTEGER,
    r10 INTEGER,
    r11 INTEGER,
    r12 INTEGER
);

INSERT INTO phase_results VALUES
(1,15,14,20,30,28,41,28,49,18,59,37,30),
(2,30,14,20,23,20,50,13,35,9,60,55,22),
(3,40,23,35,35,40,48,17,56,41,36,24,30),
(4,55,40,61,50,60,57,45,NULL,NULL,NULL,NULL,NULL);

DROP TABLE IF EXISTS month_results;
CREATE TABLE month_results(
    phase INTEGER NOT NULL CHECK (phase>0),
    month INTEGER NOT NULL CHECK (month BETWEEN 1 AND 12),
    results INTEGER NOT NULL,
    PRIMARY KEY(phase, month)
);
INSERT INTO month_results(phase, month, results)
SELECT phase,  1, r01 FROM phase_results WHERE r01 IS NOT NULL
UNION ALL
SELECT phase,  2, r02 FROM phase_results WHERE r02 IS NOT NULL
UNION ALL
SELECT phase,  3, r03 FROM phase_results WHERE r03 IS NOT NULL
UNION ALL
SELECT phase,  4, r04 FROM phase_results WHERE r04 IS NOT NULL
UNION ALL
SELECT phase,  5, r05 FROM phase_results WHERE r05 IS NOT NULL
UNION ALL
SELECT phase,  6, r06 FROM phase_results WHERE r06 IS NOT NULL
UNION ALL
SELECT phase,  7, r07 FROM phase_results WHERE r07 IS NOT NULL
UNION ALL
SELECT phase,  8, r08 FROM phase_results WHERE r08 IS NOT NULL
UNION ALL
SELECT phase,  9, r09 FROM phase_results WHERE r09 IS NOT NULL
UNION ALL
SELECT phase, 10, r10 FROM phase_results WHERE r10 IS NOT NULL
UNION ALL
SELECT phase, 11, r11 FROM phase_results WHERE r11 IS NOT NULL
UNION ALL
SELECT phase, 12, r12 FROM phase_results WHERE r12 IS NOT NULL
;


