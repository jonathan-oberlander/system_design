-- auth service credentials
CREATE USER 'auth_user'@'localhost' IDENTIFIED BY 'Auth123';

CREATE DATABASE auth;

-- grant premission to auth service to make changes
GRANT ALL PRIVILEGES ON auth.* TO 'auth_user'@'localhost';

USE auth;

-- create table
CREATE TABLE user (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- initial user will have access to auth service gateway
INSERT INTO user (email, password) VALUES ('joh@company.com', 'Admin123');
