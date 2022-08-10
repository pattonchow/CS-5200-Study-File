DROP DATABASE IF EXISTS exam1;
CREATE DATABASE exam1;
USE exam1;

CREATE TABLE key_word(
	key_word_string VARCHAR(128) NOT NULL,
    key_word_position INT NOT NULL PRIMARY KEY
    
);

CREATE TABLE political_blog(
	key_word_position INT PRIMARY KEY,
    FOREIGN KEY (key_word_position) REFERENCES key_word(key_word_position)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE author(
	a_name VARCHAR(64),
    company VARCHAR(128),
    email VARCHAR(128) PRIMARY KEY
);

CREATE TABLE blog_post(
	b_text VARCHAR(256),
    title VARCHAR(64),
    p_date DATE NOT NULL,
    b_id INT NOT NULL PRIMARY KEY,
    email VARCHAR(128),
    k_word INT NOT NULL,
   -- PRIMARY KEY(email,b_id, k_word),
    FOREIGN KEY (email) REFERENCES author(email)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (k_word) REFERENCES key_word (key_word_position)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE reader(
	r_name VARCHAR(64),
    email VARCHAR(128) PRIMARY KEY,
    b_id INT NOT NULL,
    FOREIGN KEY (b_id) REFERENCES blog_post(b_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE blog_post_comment(
	b_c_text VARCHAR(256),
    p_date DATE NOT NULL,
    email VARCHAR(128),
    b_id INT NOT NULL,
    PRIMARY KEY(b_id, email),
	FOREIGN KEY(email) REFERENCES reader(email)
		ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(b_id) REFERENCES blog_post(b_id)
		ON UPDATE CASCADE ON DELETE CASCADE
);


