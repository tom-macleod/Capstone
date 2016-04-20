-- *************************************************************************************************
-- This script creates all of the database objects (tables, sequences, etc) for the toollib database
-- *************************************************************************************************

BEGIN;

CREATE TABLE tool_category (
    tool_category_id integer primary key,
    name varchar(64) not null  
);

CREATE SEQUENCE seq_tool_id;
CREATE TABLE tool (
    tool_id integer primary key,
    tool_category_id integer not null references tool_category(tool_category_id),
    name varchar(64) not null,
    description text,
    loan_period_in_days integer not null,
    CONSTRAINT fk_tool_tool_category_id FOREIGN KEY (tool_category_id) REFERENCES tool_category(tool_category_id)
);


CREATE SEQUENCE seq_tool_inventory_id;
CREATE TABLE tool_inventory (
    tool_inventory_id integer primary key,
    tool_id integer not null references tool(tool_id),
    CONSTRAINT fk_tool_inventory_tool_id FOREIGN KEY (tool_id) REFERENCES tool(tool_id)
    
);


CREATE SEQUENCE seq_member_id;
CREATE TABLE members (
	member_id integer not null,
	member_name varchar(128) not null,
	member_phone varchar(10) not null,
	member_license varchar(16) not null,
	member_username varchar(32) not null,
	membership_paid boolean not null,
	member_expiration date,
	member_unpaid_fees decimal(12,2),
	CONSTRAINT pk_members_member_id PRIMARY KEY (member_id)
);


CREATE SEQUENCE seq_loan_id;
CREATE TABLE loans (
	loan_id integer not null,
	loan_basket_id integer not null,
	loan_date date not null,
	tool_inventory_id integer not null,
	member_id integer not null,
	return_date date,
	CONSTRAINT pk_loans_loan_id PRIMARY KEY (loan_id),
	CONSTRAINT fk_loans_member_id FOREIGN KEY (member_id) REFERENCES members(member_id),
	CONSTRAINT fk_loans_tool_inventory_id FOREIGN KEY (tool_inventory_id) REFERENCES tool_inventory(tool_inventory_id)
);


CREATE TABLE librarian_users (
	librarian_username varchar(32) not null,		-- Username
	librarian_password varchar(32) not null,		-- Password (in plain-text)
	librarian_salt varchar(256) NOT NULL,			-- Password Salt
	CONSTRAINT pk_librarian_users_librarian_username PRIMARY KEY (librarian_username)
);


COMMIT;