CREATE DATABASE `linkedin`;

USE `linkedin`;

CREATE TABLE users (
    user_id INT unsigned AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    user_password VARCHAR(128) NOT NULL
)

CREATE TABLE schools (
    school_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(50) NOT NULL UNIQUE,
    school_address VARCHAR(255) NOT NULL UNIQUE,
    school_year DATE NOT NULL,
    school_type ENUM('primary', 'secondary', 'higher education') DEFAULT 'primary',
);

CREATE TABLE companies (
    company_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(50) NOT NULL UNIQUE,
    company_address VARCHAR(255) NOT NULL UNIQUE,
    company_industry ENUM('Technology', 'Education', 'Business') 
    );

CREATE TABLE people_connections (
    user_id INT NOT NULL,
    friend_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, friend_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (friend_id) REFERENCES users(user_id)
);

CREATE TABLE school_connections (
    user_id INT NOT NULL,
    school_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    start_date DATE NOT NULL,
    end_date DATE ,
    degree_type ENUM('BA','MBA','BSC','PHD')
    PRIMARY KEY (user_id, school_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

CREATE TABLE company_connections (
    user_id INT NOT NULL,
    company_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    start_date DATE NOT NULL,
    end_date DATE ,
    PRIMARY KEY (user_id, company_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (comppany_id) REFERENCES companies(company_id)
);
