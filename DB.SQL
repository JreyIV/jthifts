-- ssh -l JREYES80 eagle.cdm.depaul.edu
-- mysql -u jreyes80 -p

CREATE TABLE customer(
    customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    email VARCHAR(25) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address1 VARCHAR(50) NOT NULL,
    address2 VARCHAR(50) NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    username varchar(20) NOT NULL,
    password varchar(2000) NOT NULL
);

CREATE TABLE product (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_type VARCHAR(50) NOT NULL,
    product_size VARCHAR(5) NOT NULL,
    product_material VARCHAR(50) NOT NULL,
    product_condition VARCHAR(20) NOT NULL,
    product_brand VARCHAR(50) NOT NULL,
    product_price DECIMAL(5,2) NOT NULL
);


CREATE TABLE review (
    review_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    reviewdate DATE NOT NULL,
    comments VARCHAR(500),
    rating INT NOT NULL,
    status VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE RESTRICT,
    FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE subscription (
    subscription_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    subscribedate DATE NOT NULL,
    unsubscribedate DATE NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE saleorder (
order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
saledate DATE NOT NULL,
customernotes VARCHAR(500),
paymentstatus VARCHAR(10),
authorizationnum VARCHAR(10),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id) ON DELETE CASCADE ON UPDATE RESTRICT
);

CREATE TABLE orderdetail (
orderdetail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
order_id INT NOT NULL,
product_id INT NOT NULL,
saleprice DECIMAL(8,2) NOT NULL,
qty INT NOT NULL,
FOREIGN KEY (order_id) REFERENCES saleorder(order_id) ON DELETE CASCADE ON UPDATE RESTRICT,
FOREIGN KEY (product_id) REFERENCES product(product_id) ON DELETE CASCADE ON UPDATE RESTRICT
);

-- customer records
INSERT INTO customer(firstname, lastname, email, phone, address1, address2, city, state, zip, username, password) VALUES ("Joseph", "Reyes", "JREYES80@depaul.edu", "6306733146",
"815 W Addison Street", "Suite 2R", "Chicago", "IL", "60101", "JREYES80", "password");

INSERT INTO customer(firstname, lastname, email, phone, address1, address2, city, state, zip, username, password) VALUES ("Moira", "McTaggart", "MOIRA78230@depaul.edu", "6306733146",
"279 N Champlain Street", "Unit 2", "North Bay", "ON", "60101", "MOIRA7823", "password");

INSERT INTO customer(firstname, lastname, email, phone, address1, address2, city, state, zip, username, password) VALUES ("Matthew", "Katsiyiannis", "MKATS50@depaul.edu", "6306733146",
"815 W Addison Street", "Suite 2R", "Chicago", "IL", "60101", "MKATS50", "password");

INSERT INTO customer(firstname, lastname, email, phone, address1, address2, city, state, zip, username, password) VALUES ("John", "Doe", "JDOE80@depaul.edu", "6306733146",
"815 W Addison Street", "Suite 2R", "Chicago", "IL", "60101", "JDOE80", "password");

INSERT INTO customer(firstname, lastname, email, phone, address1, address2, city, state, zip, username, password) VALUES ("Nick", "McNamera", "NMAC90@depaul.edu", "6306733146",
"2000 Royal Birkdale Drive", "Suite 19", "Vernon Hills", "IL", "60061", "NMAC90", "password");

-- product records
INSERT INTO product(product_type, product_size, product_material, product_condition, product_brand, product_price) VALUES ("Shirt", "Small", "Cotton", "Fairly New", "Nike", 20);

INSERT INTO product(product_type, product_size, product_material, product_condition, product_brand, product_price) VALUES ("Shoes", "10.5", "leather", "Brand New", "Addidas", 70);

INSERT INTO product(product_type, product_size, product_material, product_condition, product_brand, product_price) VALUES ("Ring", "16.5", "Metal", "Brand New", "Pandora", 100);

INSERT INTO product(product_type, product_size, product_material, product_condition, product_brand, product_price) VALUES ("Jacket", "XXL", "Wool", "Worn", "Patagonia", 60);

INSERT INTO product(product_type, product_size, product_material, product_condition, product_brand, product_price) VALUES ("Sweater", "M", "Cotton", "Fairly New", "Free People", 50);

-- review records
INSERT INTO review (customer_id, product_id, reviewdate, comments, rating, status) VALUES (1, 1,
"2022-07-30", "Good shirt", 4, "Publish");

INSERT INTO review (customer_id, product_id, reviewdate, comments, rating, status) VALUES (1, 1,
"2023-02-05", "Decent", 3, "Pending");

INSERT INTO review (customer_id, product_id, reviewdate, comments, rating, status) VALUES (1, 1,
"2022-01-10", "You get what you pay for", 3, "Publish");

INSERT INTO review (customer_id, product_id, reviewdate, comments, rating, status) VALUES (1, 1,
"2022-08-11", "Amazing quality", 5, "Publish");

INSERT INTO review (customer_id, product_id, reviewdate, comments, rating, status) VALUES (2, 4,
"2022-05-10", "Don't buy from here", 1, "Publish");

-- subscription records
INSERT INTO subscription (customer_id, subscribedate, unsubscribedate) VALUES (1, "2023-01-15", "2023-01-20");

INSERT INTO subscription (customer_id, subscribedate, unsubscribedate) VALUES (2, "2021-02-20", "2021-07-30");

INSERT INTO subscription (customer_id, subscribedate, unsubscribedate) VALUES (4, "2022-03-15", "2022-05-16");

INSERT INTO subscription (customer_id, subscribedate, unsubscribedate) VALUES (3, "2021-03-25", "2023-01-20");

INSERT INTO subscription (customer_id, subscribedate, unsubscribedate) VALUES (5, "2020-09-16", "2023-01-20");

-- Sale Order
INSERT INTO saleorder (customer_id, saledate, customernotes, paymentstatus, authorizationnum)
VALUES (1, "2022-01-10", "Buying as a gift", "Fully
Paid", "42623782");

INSERT INTO saleorder (customer_id, saledate, customernotes, paymentstatus, authorizationnum)
VALUES (3, "2021-05-10", "Buying as a gift", "Fully
Paid", "45223782");

INSERT INTO saleorder (customer_id, saledate, customernotes, paymentstatus, authorizationnum)
VALUES (2, "2022-01-11", "Are there returns?", "Fully
Paid", "90623789");

INSERT INTO saleorder (customer_id, saledate, customernotes, paymentstatus, authorizationnum)
VALUES (4, "2022-04-20", "Please leave at front door", "Fully
Paid", "098623782");

INSERT INTO saleorder (customer_id, saledate, customernotes, paymentstatus, authorizationnum)
VALUES (5, "2023-03-11", "No notes", "Fully
Paid", "235622782");

-- orderdetail record
INSERT INTO orderdetail (order_id, product_id, saleprice, qty) VALUES (1, 2, 20.00, 2);

INSERT INTO orderdetail (order_id, product_id, saleprice, qty) VALUES (2, 3, 50.00, 1);

INSERT INTO orderdetail (order_id, product_id, saleprice, qty) VALUES (4, 1, 80.00, 2);

INSERT INTO orderdetail (order_id, product_id, saleprice, qty) VALUES (5, 5, 100.00, 1);

INSERT INTO orderdetail (order_id, product_id, saleprice, qty) VALUES (3, 4, 30.00, 1);
