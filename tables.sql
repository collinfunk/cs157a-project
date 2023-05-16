
CREATE TABLE employee_role (
	role_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	role_name VARCHAR(64) NOT NULL,
	wage FLOAT NOT NULL
);

CREATE TABLE employee (
	employee_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	role_id INTEGER NOT NULL,
	phone VARCHAR(32) UNIQUE NOT NULL,
	email VARCHAR(256) UNIQUE NOT NULL,
	address VARCHAR(64) NOT NULL,
	state VARCHAR(64) NOT NULL,
	city VARCHAR(64) NOT NULL,
	hire_date VARCHAR(64) NOT NULL,
	FOREIGN KEY(role_id)
		REFERENCES employee_role(role_id)
);

CREATE TABLE customer (
	customer_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name VARCHAR(64) NOT NULL,
	last_name VARCHAR(64) NOT NULL,
	phone VARCHAR(32) NOT NULL,
	email VARCHAR(256) UNIQUE NOT NULL,
	address VARCHAR(64) NOT NULL,
	state VARCHAR(64) NOT NULL,
	city VARCHAR(64) NOT NULL
);

CREATE TABLE product (
	product_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	name VARCHAR(64) NOT NULL,
	description VARCHAR(256) NOT NULL,
	sale_price FLOAT NOT NULL,
	category VARCHAR(64) NOT NULL
);

CREATE TABLE supplier (
	supplier_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	name VARCHAR(64) NOT NULL,
	phone VARCHAR(32) NOT NULL,
	email VARCHAR(256) NOT NULL,
	address VARCHAR(64) NOT NULL,
	state VARCHAR(64) NOT NULL,
	city VARCHAR(64) NOT NULL,
);

CREATE TABLE supply_order (
	order_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	supplier_id INTEGER NOT NULL,
	order_date VARCHAR(64) NOT NULL,
	shipment_date VARCHAR(64) NOT NULL,
	FOREIGN KEY(supplier_id)
		REFERENCES supplier(supplier_id)
);

CREATE TABLE supply_order_product (
	order_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	order_price FLOAT NOT NULL,
	item_count INTEGER NOT NULL,
	item_price FLOAT NOT NULL,
	FOREIGN KEY(product_id)
		REFERENCES product(product_id),
	FOREIGN KEY(order_id)
		REFERENCES supply_order(order_id)
);

CREATE TABLE customer_order (
	order_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	customer_id INTEGER NOT NULL,
	order_price FLOAT NOT NULL,
	order_date VARCHAR(64) NOT NULL,
	shipment_date VARCHAR(64) NOT NULL,
	FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id)
);

CREATE TABLE customer_order_product (
	customer_id INTEGER NOT NULL,
	product_id INTEGER NOT NULL,
	item_count INTEGER NOT NULL,
	item_price FLOAT NOT NULL,
	FOREIGN KEY(customer_id)
		REFERENCES customer(customer_id),
	FOREIGN KEY(product_id)
		REFERENCES product(product_id)
);

