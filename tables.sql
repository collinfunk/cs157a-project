
DROP TABLE IF EXISTS employee_role;
DROP TABLE IF EXISTS product_category;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS supplier;
DROP TABLE IF EXISTS supplier_product;

CREATE TABLE employee_role (
	role_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	role_name TEXT NOT NULL
);

CREATE TABLE product_category (
	category_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	category_name TEXT NOT NULL
);

CREATE TABLE employee (
	employee_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	role_id INTEGER NOT NULL,
	phone TEXT UNIQUE NOT NULL,
	email TEXT UNIQUE NOT NULL,
	address TEXT NOT NULL,
	state TEXT NOT NULL,
	city TEXT NOT NULL,
	hire_date TEXT NOT NULL,
	FOREIGN KEY(role_id)
		REFERENCES employee_role(role_id)
);

CREATE TABLE product (
	product_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	unit_price TEXT NOT NULL,
	stock_quantity TEXT NOT NULL,
	category_id INTEGER NOT NULL,
	FOREIGN KEY(category_id)
		REFERENCES product_category(category_id)
);

CREATE TABLE customer (
	customer_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	phone TEXT NOT NULL,
	email TEXT NOT NULL,
	address TEXT NOT NULL,
	state TEXT NOT NULL,
	city TEXT NOT NULL
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

CREATE TABLE supplier_product (
	supplier_product_id INTEGER PRIMARY KEY UNIQUE NOT NULL,
	product_id INTEGER NOT NULL,
	supplier_id INTEGER NOT NULL,
	FOREIGN KEY(product_id)
		REFERENCES product(product_id),
	FOREIGN KEY(supplier_id)
		REFERENCES supplier(supplier_id)
);

