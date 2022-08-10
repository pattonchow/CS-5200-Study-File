/* MANDATORY OR */
CREATE TABLE reggaae(
song_id INT PRIMARY KEY,
temp INT,
METER INT,
staccato INT
); 

CREATE TABLE rock(
song_id INT PRIMARY KEY,
temp INT,
METER INT,
guitar BOOL
);

CREATE TABLE jazz(
song_id INT PRIMARY KEY,
temp INT,
METER INT,
improv BOOL,
scat BOOL
);

/* OPTIONAL OR*/

CREATE TABLE song_type(
song_type VARCHAR(64) PRIMARY KEY
);

CREATE TABLE song(
song_id INT PRIMARY KEY,
temp INT,
meter INT,
song_type VARCHAR(64),
FOREIGN KEY(song_type) REFERENCES song_type(song_type)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE reggae(
song_id INT PRIMARY KEY,
staccato BOOL,
FOREIGN KEY (song_id) REFERENCES song(song_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE rock(
song_id INT PRIMARY KEY,
guitar BOOL,
FOREIGN KEY (song_id) REFERENCES song(song_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE jazz(
song_id INT PRIMARY KEY,
impro BOOL,
scat BOOL,
FOREIGN KEY (song_id) REFERENCES song(song_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);

/* MANDATORY AND */
CREATE TABLE song_type(
song_type VARCHAR(64) PRIMARY KEY
);

CREATE TABLE song(
song_id INT PRIMARY KEY,
temp INT,
meter INT,
song_type VARCHAR(64),
FOREIGN KEY(song_type) REFERENCES song_type(song_type)
ON UPDATE CASCADE ON DELETE CASCADE,
is_rook BOOL,
is_jazz BOOL,
is_reggae BOOL,
staccato INT,
guitar BOOL,
scat BOOL,
improv BOOL
);

/* OPTIONAL AND */
CREATE TABLE song_type(
song_type VARCHAR(64) PRIMARY KEY
);

CREATE TABLE song(
song_id INT PRIMARY KEY,
temp INT,
meter INT,
song_type VARCHAR(64),
FOREIGN KEY(song_type) REFERENCES song_type(song_type)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE song_to_song_type(
song_type VARCHAR(32),
song_id INT,
PRIMARY KEY(song_type, song_id),
FOREIGN KEY(song_type) REFERENCES song_type(song_tyoe)
	ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY(song_id) REFERENCES song(song_id)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE song_detail(
song_id INT PRIMARY KEY,
staccato INT,
guitar BOOL,
scat BOOL,
improv BOOL,
FOREIGN KEY(song_id) REFERENCES song(song_id)
ON UPDATE CASCADE ON DELETE CASCADE
);
