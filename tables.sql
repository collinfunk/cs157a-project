
CREATE TABLE employee (
	employee_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	role TEXT NOT NULL,
	phone TEXT UNIQUE NOT NULL,
	email TEXT UNIQUE NOT NULL,
	address TEXT NOT NULL,
	state TEXT NOT NULL,
	city TEXT NOT NULL,
	hire_date TEXT NOT NULL
);


CREATE TABLE customer (
	customer_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone TEXT NOT NULL,
	email TEXT UNIQUE NOT NULL,
	address TEXT NOT NULL,
	state TEXT NOT NULL,
	city TEXT NOT NULL
);

CREATE TABLE product (
	product_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	sale_price TEXT NOT NULL,
	category TEXT NOT NULL
);

CREATE TABLE supplier (
	supplier_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	name TEXT NOT NULL,
	phone TEXT NOT NULL,
	email TEXT NOT NULL,
	address TEXT NOT NULL,
	state TEXT NOT NULL,
	city TEXT NOT NULL
);

CREATE TABLE supply_order (
	order_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	supplier_id INTEGER NOT NULL,
	order_date TEXT NOT NULL,
	shipment_date TEXT NOT NULL,
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
	order_date TEXT NOT NULL,
	shipment_date TEXT NOT NULL,
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

