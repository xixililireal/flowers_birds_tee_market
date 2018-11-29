# project_1 flower_birds_market_database
SET NAMES UTF8;
DROP DATABASE IF EXISTS fbm;
CREATE DATABASE fbm CHARSET=UTF8;
USE fbm;

#  fbm_user_table
DROP TABLE IF EXISTS fbm_user;
CREATE TABLE fbm_user(
    uid INT(4) PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32) UNIQUE NOT NULL,
	upwd VARCHAR(20),
    email VARCHAR(64),
    phone VARCHAR(16),
    avatar VARCHAR(128),
    userName VARCHAR(10),
    gender BOOLEAN
);

INSERT INTO fbm_user VALUES(NULL,"tom","1234567","tom@qq.com","12345678901","<img src='./01.png'>","黎明",1);

# fbm_flower_table
DROP TABLE IF EXISTS fbm_flower;
CREATE TABLE fbm_flower(
	fid INT(4) PRIMARY KEY AUTO_INCREMENT,#花的编号
	
	title VARCHAR(128),			#花的标题
	subtitle VARCHAR(128),	#花的子标题
	price DECIMAl(8,2),#花的价格
	spec VARCHAR(128),#花的规格
	promise VARCHAR(64),#花的承诺
	number INT(4),#花的库存
	detail VARCHAR(225),#花的详细信息
	is_onSale BOOLEAN,#是否在售
	shelfTime DATETIME,#上架时间
	downTime DATETIME#下架时间
);

INSERT INTO fbm_flower VALUES(NULL,"极品兰花，你值得拥有","稀有品种，机不可失，失不再来",6324.12,"金太子4苗，金太子7苗，金太子6苗","承诺七天之内退换货",
1234,"<p>品牌：兰花缘</p><p>功能：提神 美观	趣味</p>",true,"2018-10-31","2018-11-7");

#fbm_birds_table
DROP TABLE IF EXISTS fbm_birds;
CREATE TABLE fbm_birds(
	bid INT(4) PRIMARY KEY AUTO_INCREMENT, #鸟类的编号
	
	title VARCHAR(128), #鸟类的标题
	subtitle VARCHAR(128), #鸟类的子标题
	price DECIMAL(6,2), #鸟类的价格
	spec VARCHAR(128), #鸟类的规格
	promise VARCHAR(64), #鸟类的承诺
	number INT(4), #鸟类的库存	
	detail VARCHAR(225), #鸟类的详细信息
	is_onSale BOOLEAN, #是否在售
	shelfTime DATE, #上架时间
	downTime DATE   #下架时间
);

INSERT INTO fbm_birds VALUES(NULL,"逗趣的鹦鹉，你值得拥有","稀有品种，机不可失，失不再来",324.12,"4号红鹦鹉，3号绿皮鹦鹉，5号白色头鹦鹉","承诺不七天之内退换货",
234,"<p>壁式类型：动物装饰</p><p>材质：树脂</p>",true,"2018-10-31","2018-11-7");

#fbm_tea_art_table
DROP TABLE IF EXISTS fbm_tea_art;
CREATE TABLE fbm_tea_art(
	tid INT(4) PRIMARY KEY AUTO_INCREMENT, #茶艺类的编号
	
	title VARCHAR(128), #茶艺类的标题
	subtitle VARCHAR(128), #茶艺类的子标题
	price DECIMAL(6,2), #茶艺类的价格
	spec VARCHAR(128), #茶艺类的规格
	promise VARCHAR(64), #茶艺类的承诺
	number INT(4), #茶艺类的库存	
	detail VARCHAR(225), #茶艺类的详细信息
	is_onSale BOOLEAN, #是否在售
	shelfTime DATE, #上架时间
	downTime DATE   #下架时间
);

INSERT INTO fbm_birds VALUES(NULL,"浓香型安溪铁观音，你值得拥有","最受欢迎的品种，机不可失，失不再来",34.12,NULL,"承诺七天之内退换货",
234,"<p>品牌名称：怡心一品</p><p>产品参数：保质期：540天</p>",true,"2018-10-31","2018-11-7");

#fbm_plaything_table
DROP TABLE IF EXISTS fbm_plaything;
CREATE TABLE fbm_plaything(
        pid INT(4) PRIMARY KEY AUTO_INCREMENT,
        title VARCHAR(128), #文玩类的标题
	subtitle VARCHAR(128), #文玩类的子标题
	price DECIMAL(6,2), #文玩类的价格
	spec VARCHAR(128), #文玩类的规格
	promise VARCHAR(64), #文玩类的承诺
	number INT(4), #文玩类的库存	
	detail VARCHAR(225), #文玩类的详细信息
	is_onSale BOOLEAN, #是否在售
	shelfTime DATE, #上架时间
	downTime DATE   #下架时间
);

# fbm_nav_table
DROP TABLE IF EXISTS fbm_nav;
CREATE TABLE fbm_nav(
	nid INT(4) PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(18)
);

# fbm_nav_sub_table
DROP TABLE IF EXISTS fbm_nav_sub;
CREATE TABLE fbm_nav_sub(
	ns_id INT(4) PRIMARY KEY AUTO_INCREMENT,
	nid INT(4),
	sub_title VARCHAR(18)
);

# fbm_sowing_table
DROP TABLE IF EXISTS fbm_sowing;
CREATE TABLE fbm_sowing(
	sowId INT(4) PRIMARY KEY AUTO_INCREMENT,
	sowName VARCHAR(32),
	imgAddr VARCHAR(128)
);

# fbm_flower_images_table
DROP TABLE IF EXISTS fbm_flower_images;
CREATE TABLE fbm_flower_images(
	fImgId INT(4) PRIMARY KEY AUTO_INCREMENT,
	fib INT(4),
	fImgName VARCHAR(32),
	fImgAddr VARCHAR(128)
);

# fbm_birds_images_table
DROP TABLE IF EXISTS fbm_birds_images;
CREATE TABLE fbm_birds_images(
	bImgId INT(4) PRIMARY KEY AUTO_INCREMENT,
	bid INT(4),
	bImgName VARCHAR(32),
	bImgAddr VARCHAR(128)
);

# fbm_tea_images_table
DROP TABLE IF EXISTS fbm_tea_images;
CREATE TABLE fbm_tea_images(
	tImgId INT(4),
	tid INT(4),
	tImgName VARCHAR(32),
	tImgAddr VARCHAR(128)
);

# fbm_plaything_images_table
DROP TABLE IF EXISTS fbm_plaything_images;
CREATE TABLE fbm_plaything_images(
	pImgId INT(4) PRIMARY KEY AUTO_INCREMENT,
	pid INT(4),
	pImgName VARCHAR(32),
	pImgAddr VARCHAR(128)
);

#fbm_address_table
DROP TABLE IF EXISTS fbm_address;
CREATE TABLE fbm_address(
	aid INT(4) PRIMARY KEY AUTO_INCREMENT,
	aname VARCHAR(32),
	aphone VARCHAR(16),
	address VARCHAR(64)
);

# fbm_order_table
DROP TABLE IF EXISTS fbm_order;
CREATE TABLE fbm_order(
	oid INT(4) PRIMARY KEY AUTO_INCREMENT,
	aname VARCHAR(32),
	aphone VARCHAR(16),
	address VARCHAR(64),
	title VARCHAR(128),
	price DECIMAL(8,2),
	number INT(4)
);

# fbm_cart_table
DROP TABLE IF EXISTS fbm_cart;
CREATE TABLE fbm_cart(
	cid INT(4),
	uid INT(4),
	img VARCHAR(128),
	title VARCHAR(128),
	price DECIMAL(8,2),
	number INT(4)
);
