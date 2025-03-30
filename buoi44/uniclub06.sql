CREATE DATABASE uniclub;
USE uniclub;

CREATE TABLE color(
	id int auto_increment,
	name varchar(20),
	
	primary key(id)
);

CREATE TABLE size(
	id int auto_increment,
	name varchar(20),
	
	primary key(id)
);

CREATE TABLE variant(
	sku int auto_increment,
	id_product int,
	id_color int,
	id_size int,
	images text,
	quantity int,
	price decimal,
	create_date timestamp default now(),
	
	primary key(sku)
);

CREATE TABLE order_variant(
	id_order int,
	sku_variant int,
	quantity int,
	price decimal,
	
	primary key(id_order,sku_variant)
);

CREATE TABLE orders(
	id int auto_increment,
	total double,
	note text,
	id_payment int,
	id_user int,
	create_date timestamp default now(),
	
	primary key(id)
);

CREATE TABLE billing_details(
	id int auto_increment,
	first_name varchar(50),
	last_name varchar(50),
	company_name varchar(50),
	id_country int,
	address varchar(255),
	town varchar(50),
	state varchar(50),
	zip_code varchar(50),
	phone varchar(12),
	email varchar(255),
	create_date timestamp default now(),
	
	primary key(id)
);

CREATE TABLE payment_method(
	id int auto_increment,
	name varchar(50),
	description text,
	
	primary key(id)
);

CREATE TABLE wishlist(
	id_product int,
	id_user int,
	
	primary key(id_product,id_user)
);

CREATE TABLE user(
	id int auto_increment,
	email varchar(50),
	password varchar(50),
	full_name varchar(255),
	
	primary key(id)
);

CREATE TABLE review(
	id int auto_increment,
	id_product int,
	id_user int,
	star int,
	content text,
	create_date timestamp default now(),
	images text,
	
	primary key(id)	
);

CREATE TABLE comment(
	id int auto_increment,
	id_user int,
	id_post int,
	id_reply int,
	content text,
	create_date timestamp default now(),
	
	primary key(id)
);

CREATE TABLE post(
	id int auto_increment,
	content text,
	create_date timestamp default now(),
	
	primary key(id)
);

CREATE TABLE product(
	id int auto_increment,
	name varchar(255),
	description text,
	information text,
	price double,
	id_brand int,
	create_date timestamp default now(),
	
	primary key(id)	
);

CREATE TABLE brand(
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);

CREATE TABLE tag(
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);

CREATE TABLE category(
	id int auto_increment,
	name varchar(50),
	
	primary key(id)
);

CREATE TABLE product_brand(
	id_brand int,
	id_product int,
	
	primary key(id_brand, id_product)
);

CREATE TABLE product_tag(
	id_tag int,
	id_product int,
	
	primary key(id_tag, id_product)
);

CREATE TABLE product_category(
	id_category int,
	id_product int,
	
	primary key(id_category, id_product)
);

CREATE TABLE post_category(
	id_category int,
	id_post int,
	
	primary key(id_category, id_post)
);

CREATE TABLE country(
	id int auto_increment,
	name varchar(255),
	
	primary key(id)
);

ALTER TABLE variant ADD CONSTRAINT FK_id_product_variant FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE variant ADD CONSTRAINT FK_id_color_variant FOREIGN KEY(id_color) REFERENCES color(id);
ALTER TABLE variant ADD CONSTRAINT FK_id_size_variant FOREIGN KEY(id_size) REFERENCES size(id);

ALTER TABLE order_variant ADD CONSTRAINT FK_id_order_order_variant FOREIGN KEY(id_order) REFERENCES orders(id);
ALTER TABLE order_variant ADD CONSTRAINT FK_sku_variant_order_variant FOREIGN KEY(sku_variant) REFERENCES variant(sku);

ALTER TABLE orders ADD CONSTRAINT FK_id_payment_order FOREIGN KEY(id_payment) REFERENCES payment_method(id);
ALTER TABLE orders ADD CONSTRAINT FK_id_user_order FOREIGN KEY(id_user) REFERENCES user(id);

ALTER TABLE billing_details ADD CONSTRAINT FK_id_country_billing_details FOREIGN KEY(id_country) REFERENCES country(id);

ALTER TABLE wishlist ADD CONSTRAINT FK_id_product_wishlist FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE wishlist ADD CONSTRAINT FK_id_user_wishlist FOREIGN KEY(id_user) REFERENCES user(id);

ALTER TABLE review ADD CONSTRAINT FK_id_product_review FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE review ADD CONSTRAINT FK_id_user_review FOREIGN KEY(id_user) REFERENCES user(id);

ALTER TABLE comment ADD CONSTRAINT FK_id_user_comment FOREIGN KEY(id_user) REFERENCES user(id);
ALTER TABLE comment ADD CONSTRAINT FK_id_post_comment FOREIGN KEY(id_post) REFERENCES post(id);
ALTER TABLE comment ADD CONSTRAINT FK_id_reply_comment FOREIGN KEY(id_reply) REFERENCES post(id);

ALTER TABLE product ADD CONSTRAINT FK_id_brand_product FOREIGN KEY(id_brand) REFERENCES brand(id);

ALTER TABLE post_category ADD CONSTRAINT FK_id_post_post_category FOREIGN KEY(id_post) REFERENCES post(id);
ALTER TABLE post_category ADD CONSTRAINT FK_id_category_category FOREIGN KEY(id_category) REFERENCES category(id);

ALTER TABLE product_category ADD CONSTRAINT FK_id_product_product_category FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE product_category ADD CONSTRAINT FK_id_category_product_category FOREIGN KEY(id_category) REFERENCES category(id);

ALTER TABLE product_tag ADD CONSTRAINT FK_id_product_product_tag FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE product_tag ADD CONSTRAINT FK_id_category_product_tag FOREIGN KEY(id_tag) REFERENCES tag(id);

ALTER TABLE product_brand ADD CONSTRAINT FK_id_product_product_brand FOREIGN KEY(id_product) REFERENCES product(id);
ALTER TABLE product_brand ADD CONSTRAINT FK_id_brand_product_brand FOREIGN KEY(id_brand) REFERENCES brand(id);

