-- データベースの仕組み: データベースは表でデータを管理している。
-- 表のことを「テーブル」縦の列のことを「カラム」横の行のことを「レコード」と呼ぶ



-- クエリとは: データを取得するためにデータベースに送る命令の事
-- ① データベースから、データを取得するためには「SELECT」を用いて「どのカラムのデータを取得するか」を選ぶ
-- ② データベースには複数のテーブルが存在する場合があるため、「FROM」を用いて「SELECT」で選んだカラムが「どのテーブルのカラムか」を指定する必要がある
-- ③ 最後にセミコロン(；)を加える
SELECT name
FROM purchases;
-- ↑purchasesテーブルから、nameカラムのデータを取得



-- 複数のカラムからデータを取得する場合はコンマ(,)で区切る
-- 全カラムのデータを取得する場合は「＊」の記号のみを用いる
SELECT name,price
FROM purchases;
-- ↑purchasesテーブルから、「nameカラム」と「priceカラム」のデータを取得

SELECT *
FROM purchases;
-- ↑purchasesテーブルから、全てのカラムのデータを取得



-- 特定のデータの取得WHEREとは:「どこのレコードのデータを取得するか」を意味する
-- 「＝」を用いて、「〇〇カラムが△△であるレコードを取得」といった意味になるように条件を指定する
SELECT *
FROM purchases
WHERE category = "食費";
-- ↑categoryカラムが「食費」であるデータを取得



-- データ型とは: 「テキストデータ」や「数値データ」、「日付データ」といったように「データの種類」を示すもの。カラムごとにデータ型を決める
-- 数値データはクォーテーションで囲まない！それ以外は囲む！
SELECT *
FROM purchases
WHERE price = 1000;
-- ↑priceカラムが「1000」のデータを取得

SELECT *
FROM purchases
WHERE purchased_at = "2017-07-01";
-- ↑purchased_atカラムが「2017-07-01」のデータを取得



-- 比較演算子を用いた特定のデータの取得(WHEREの条件では「＝」の他に比較記号を用いてデータを取得する事が出来る)
SELECT *
FROM purchases
WHERE price >= 1000;
-- ↑priceカラムが「1000以上」のデータを取得

SELECT *
FROM purchases
WHERE purchased_at <= "2017-08-01";
-- purchased_atカラムが「2017-08-01以前」のデータを取得



-- LIKE演算子とは: 「=」は完全に一致するデータしか取得できないが「LIKE」を用いることで、「ある文字を含むデータ」を取得する事が出来る
-- LIKE演算子を用いる際の注意点: 文字列の前後に「%」をつける！
SELECT *
FROM purchases
WHERE name LIKE "%プリン%";
-- ↑nameカラムが「プリン」という文字列を含むデータを全て取得



--「%」ワイルドカードを文字列の前後どちらかにのみ置くことも可能!
--「%」を後ろにのみつけた時に「前の文字列に一致するデータを全て取得」し「%」を前のみつけた時に「後ろの文字列に一致するデータを全て取得」
SELECT *
FROM purchases
WHERE name LIKE "プリン%";
-- ↑nameカラムが「プリン」で始まるデータを全て取得

SELECT *
FROM purchases
WHERE name LIKE "%プリン";
-- ↑nameカラムが「プリン」で終わるデータを全て取得



-- NOT演算子とは: 「〇〇を含まないデータ」や「〇〇に一致しないデータ」のような否定の条件でデータを取得したい場合は「NOT」を用いる
SELECT *
FROM purchases
WHERE NOT character_name = "にんじゃわんこ";
-- ↑character_nameカラムが「にんじゃわんこ」でないデータを取得

SELECT *
FROM purchases
WHERE NOT name LIKE "%プリン%";
-- ↑nameカラムが「プリン」を含まないデータを取得



-- NULLとは: データベース上に何も保存されていない場合に「NULL」となる
-- IS NULLとは: NULLのデータを取得する際に用いる。「カラム名 IS NULL」とすることで、「指定したカラムがNULLであるデータ」を取得することが可能
-- IS NOT NULLとは: NULLではないデータを取得する際に用いる。「カラム名 IS NOT NULL」とすることで、「指定したカラムがNULLではないデータ」を取得することが可能
SELECT *
FROM purchases
WHERE price IS NULL;
-- ↑priceカラムがNULLであるデータを取得

SELECT *
FROM purchases
WHERE price IS NOT NULL;
-- ↑priceカラムがNULLでないデータを取得



-- AND演算子とは: WHEREに複数の条件を指定することができる
-- OR演算子とは: 「WHERE 条件１ OR 条件２」のようにすることで、条件１または条件２のどちらかを満たすデータを検索することができる
SELECT *
FROM purchases
WHERE category = "食費"
AND character_name = "ひつじ仙人";
-- ↑categoryカラムが「食費」かつcharacter_nameカラムが「ひつじ仙人」であるデータを取得

SELECT *
FROM purchases
WHERE category = "食費"
OR character_name = "にんじゃわんこ";
-- ↑categoryカラムが「食費」またはcharacter_nameカラムが「にんじゃわんこ」であるデータを取得



-- ORDER BYとは: データを並び替える際に用いる。「ORDER BY　並べたいカラム名 並べ方(ASCもしくはDESC);」 ※ASC-昇順、DESC-降順
SELECT *
FROM purchases
ORDER BY price DESC;
-- ↑priceカラムを基準に降順に並び替えたデータを取得

SELECT *
FROM purchases
WHERE character_name = "にんじゃわんこ"
ORDER BY price ASC;
-- ↑character_nameカラムが「にんじゃわんこ」のデータを取得し、priceカラムを基準に昇順に並び替えたデータを取得



-- LIMITとは:「最大で何件のデータを取得するか」制限を行う際に用いる。「LIMIT 最大で取得するデータの件数」
SELECT *
FROM purchases
LIMIT 5;
-- ↑取得結果が「最大5件」となるようにデータを取得

SELECT *
FROM purchases
WHERE character_name = "にんじゃわんこ"
LIMIT 10;
-- ↑character_nameカラムが「にんじゃわんこ」のデータを取得し、取得結果が「最大10件」となるようにデータを取得