-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-11-14 00:24:24.446

-- tables
-- Table: ride_data
CREATE TABLE ride_data (
    id_ride int NOT NULL,
    users_id_user int NOT NULL,
    transport_id_transport int NOT NULL,
    route_stop_id_route_stop int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    CONSTRAINT ride_data_pk PRIMARY KEY (id_ride)
);

-- Table: route
CREATE TABLE route (
    id_route int NOT NULL,
    route_status int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    route_details varchar(200) NOT NULL,
    CONSTRAINT route_pk PRIMARY KEY (id_route)
);

-- Table: route_stop
CREATE TABLE route_stop (
    id_route_stop int NOT NULL,
    route_id_route int NOT NULL,
    stop_id_stop int NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_date date NOT NULL,
    CONSTRAINT route_stop_pk PRIMARY KEY (id_route_stop)
);

-- Table: route_stop_transport
CREATE TABLE route_stop_transport (
    id_route_stop_transport int NOT NULL,
    transport_id_transport int NOT NULL,
    route_id_route int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    CONSTRAINT route_stop_transport_pk PRIMARY KEY (id_route_stop_transport)
);

-- Table: stop
CREATE TABLE stop (
    id_stop int NOT NULL,
    stop_status int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    latitude float NOT NULL,
    longitude float NOT NULL,
    description varchar(200) NOT NULL,
    CONSTRAINT stop_pk PRIMARY KEY (id_stop)
);

-- Table: transport
CREATE TABLE transport (
    id_transport int NOT NULL,
    transport_status int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    description varchar(200) NOT NULL,
    transport_info_id_transport_info int NOT NULL,
    CONSTRAINT transport_pk PRIMARY KEY (id_transport)
);

-- Table: transport_info
CREATE TABLE transport_info (
    id_transport_info int NOT NULL,
    tx_hosts varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    type int NOT NULL,
    info_description varchar(200) NOT NULL,
    CONSTRAINT transport_info_pk PRIMARY KEY (id_transport_info)
);

-- Table: user_address
CREATE TABLE user_address (
    id_user_address int NOT NULL,
    address_status int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    latitude float NOT NULL,
    longitude float NOT NULL,
    address_name varchar(100) NOT NULL,
    address_description int NOT NULL,
    users_id_user int NOT NULL,
    CONSTRAINT user_address_pk PRIMARY KEY (id_user_address)
);

-- Table: user_info
CREATE TABLE user_info (
    id_user int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    first_name varchar(200) NOT NULL,
    last_name varchar(200) NOT NULL,
    phone_number int NOT NULL,
    age int NOT NULL,
    CONSTRAINT user_info_pk PRIMARY KEY (id_user)
);

-- Table: users
CREATE TABLE users (
    id_user int NOT NULL,
    u_status int NOT NULL,
    tx_host varchar(200) NOT NULL,
    tx_user varchar(200) NOT NULL,
    tx_date date NOT NULL,
    user_name varchar(100) NOT NULL,
    last_chat varchar(100) NOT NULL,
    user_info_id_user int NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (id_user)
);

-- foreign keys
-- Reference: ride_data_route_stop (table: ride_data)
ALTER TABLE ride_data ADD CONSTRAINT ride_data_route_stop FOREIGN KEY ride_data_route_stop (route_stop_id_route_stop)
    REFERENCES route_stop (id_route_stop);

-- Reference: ride_data_transport (table: ride_data)
ALTER TABLE ride_data ADD CONSTRAINT ride_data_transport FOREIGN KEY ride_data_transport (transport_id_transport)
    REFERENCES transport (id_transport);

-- Reference: ride_data_users (table: ride_data)
ALTER TABLE ride_data ADD CONSTRAINT ride_data_users FOREIGN KEY ride_data_users (users_id_user)
    REFERENCES users (id_user);

-- Reference: route_stop_route (table: route_stop)
ALTER TABLE route_stop ADD CONSTRAINT route_stop_route FOREIGN KEY route_stop_route (route_id_route)
    REFERENCES route (id_route);

-- Reference: route_stop_stop (table: route_stop)
ALTER TABLE route_stop ADD CONSTRAINT route_stop_stop FOREIGN KEY route_stop_stop (stop_id_stop)
    REFERENCES stop (id_stop);

-- Reference: route_stop_transport_route (table: route_stop_transport)
ALTER TABLE route_stop_transport ADD CONSTRAINT route_stop_transport_route FOREIGN KEY route_stop_transport_route (route_id_route)
    REFERENCES route (id_route);

-- Reference: route_stop_transport_transport (table: route_stop_transport)
ALTER TABLE route_stop_transport ADD CONSTRAINT route_stop_transport_transport FOREIGN KEY route_stop_transport_transport (transport_id_transport)
    REFERENCES transport (id_transport);

-- Reference: transport_transport_info (table: transport)
ALTER TABLE transport ADD CONSTRAINT transport_transport_info FOREIGN KEY transport_transport_info (transport_info_id_transport_info)
    REFERENCES transport_info (id_transport_info);

-- Reference: user_address_users (table: user_address)
ALTER TABLE user_address ADD CONSTRAINT user_address_users FOREIGN KEY user_address_users (users_id_user)
    REFERENCES users (id_user);

-- Reference: users_user_info (table: users)
ALTER TABLE users ADD CONSTRAINT users_user_info FOREIGN KEY users_user_info (user_info_id_user)
    REFERENCES user_info (id_user);

-- End of file.

