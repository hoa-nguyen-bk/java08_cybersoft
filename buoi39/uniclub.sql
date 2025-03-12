CREATE DATABASE uniclub;
USE uniclub;


-- Bảng color
CREATE TABLE color (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng size
CREATE TABLE size (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng brand
CREATE TABLE brand (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng product
CREATE TABLE product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    rate_id INT,
    description TEXT,
    sizes VARCHAR(255),
    original_price DECIMAL(10,2),
    images TEXT,
    sku VARCHAR(50),
    additional_information TEXT,
    quantity INT NOT NULL,
    favourite BOOLEAN DEFAULT FALSE,
    stock_status ENUM('in_stock', 'out_of_stock', 'pre_order') NOT NULL DEFAULT 'in_stock',
    brand_id INT
);

-- Bảng product_detail
CREATE TABLE product_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT NOT NULL,
    size_id INT NOT NULL,
    quantity INT NOT NULL
);

-- Bảng tag
CREATE TABLE tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng product_tag
CREATE TABLE product_tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_id INT NOT NULL,
    product_id INT NOT NULL
);

-- Bảng category
CREATE TABLE category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng product_category
CREATE TABLE product_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    product_id INT NOT NULL
);

-- Bảng review
CREATE TABLE review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    score INT CHECK (score BETWEEN 1 AND 5),
    image TEXT,
    user_id INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    description TEXT,
    product_id INT NOT NULL
);


-- Bảng address
CREATE TABLE address (
    id INT AUTO_INCREMENT PRIMARY KEY,
    zip_code VARCHAR(20),
    street_name VARCHAR(255),
    appartments VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100)
);

-- Bảng role
CREATE TABLE role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Bảng user
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    phone VARCHAR(20),
    role_id INT
);

-- Bảng order
CREATE TABLE `order` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    company_name VARCHAR(255),
    address_id INT NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    note TEXT,
    total DECIMAL(10,2) NOT NULL,
    payment_type VARCHAR(50),
    sub_total DECIMAL(10,2),
    payment_status VARCHAR(50)
);

-- Bảng order_product
CREATE TABLE order_product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_detail_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL
);

-- Bảng blog
CREATE TABLE blog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    cover TEXT,
    content TEXT NOT NULL,
    tags TEXT,
    id_role INT,
    author_id INT NOT NULL,
    summary TEXT
);

-- Bảng comment_group
CREATE TABLE comment_group (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    email VARCHAR(255),
    message TEXT,
    blog_id INT NOT NULL
);

-- Bảng comment
CREATE TABLE comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    email VARCHAR(255),
    message TEXT,
    comment_group_id INT NOT NULL
);

-- Bảng tags
CREATE TABLE tags (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

-- Bảng blog_tag
CREATE TABLE blog_tag (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_id INT NOT NULL,
    blog_id INT NOT NULL
);

-- Thêm khóa ngoại
ALTER TABLE user ADD CONSTRAINT FK_user_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE SET NULL;

ALTER TABLE `order` ADD CONSTRAINT FK_order_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE `order` ADD CONSTRAINT FK_order_address FOREIGN KEY (address_id) REFERENCES address(id) ON DELETE CASCADE;

ALTER TABLE order_product 
ADD CONSTRAINT FK_orderproduct_productdetail FOREIGN KEY (product_detail_id) REFERENCES product_detail(id) ON DELETE CASCADE,
ADD CONSTRAINT FK_orderproduct_order FOREIGN KEY (order_id) REFERENCES `order`(id) ON DELETE CASCADE;

ALTER TABLE blog ADD CONSTRAINT FK_blog_user FOREIGN KEY (author_id) REFERENCES user(id) ON DELETE CASCADE;


ALTER TABLE comment_group ADD CONSTRAINT FK_commentgroup_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE comment_group ADD CONSTRAINT FK_commentgroup_blog FOREIGN KEY (blog_id) REFERENCES blog(id) ON DELETE CASCADE;

ALTER TABLE comment ADD CONSTRAINT FK_comment_user FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE;
ALTER TABLE comment ADD CONSTRAINT FK_comment_group FOREIGN KEY (comment_group_id) REFERENCES comment_group(id) ON DELETE CASCADE;

ALTER TABLE blog_tag ADD CONSTRAINT FK_blogtag_blog FOREIGN KEY (blog_id) REFERENCES blog(id) ON DELETE CASCADE;
ALTER TABLE blog_tag ADD CONSTRAINT FK_blogtag_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE;


ALTER TABLE product ADD CONSTRAINT FK_product_brand FOREIGN KEY (brand_id) REFERENCES brand(id) ON DELETE SET NULL;

ALTER TABLE product_detail ADD CONSTRAINT FK_productdetail_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;
ALTER TABLE product_detail ADD CONSTRAINT FK_productdetail_color FOREIGN KEY (color_id) REFERENCES color(id) ON DELETE CASCADE;
ALTER TABLE product_detail ADD CONSTRAINT FK_productdetail_size FOREIGN KEY (size_id) REFERENCES size(id) ON DELETE CASCADE;

ALTER TABLE product_tag ADD CONSTRAINT FK_producttag_tag FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE;
ALTER TABLE product_tag ADD CONSTRAINT FK_producttag_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;

ALTER TABLE product_category ADD CONSTRAINT FK_productcategory_category FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE;
ALTER TABLE product_category ADD CONSTRAINT FK_productcategory_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;

ALTER TABLE review ADD CONSTRAINT FK_review_product FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE;

