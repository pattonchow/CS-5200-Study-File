use scratch;
/* solution for MANDATORY OR  */ 
CREATE TABLE reggae(song_id Int primary key,
tempo INT,
meter INT,
staccato BOOL ); 

CREATE TABLE rock(song_id Int primary key,
tempo INT,
meter INT,
guitar_solo BOOL ); 

CREATE TABLE jazz (song_id INT primary key,
tempo INT,
meter INT,
improvisation BOOL,
scat bool); 


/* other solution */
CREATE TABLE rock(song_id Int primary key,
tempo INT,
meter INT,
guitar_solo BOOL, 
song_type ENUM('reggae', 'rock', 'jazz' ),
improvisation BOOL,
scat BOOL,
guitar_solo BOOL,
staccato INT);


 
/* solution for OPTIONAL, OR  */

CREATE TABLE song_type (
  song_type VARCHAR(32) primary key ); 

create table song (song_id INT PRIMARY KEY,
                   temp INT,
				   meter INT,
                   song_type VARCHAR(32),
                   FOREIGN KEY (song_type) REFERENCES song_type(song_type)
                   ON UPDATE CASCADE ON DELETE CASCADE ) ; 

CREATE TABLE reggae(song_id Int primary key,
    staccato BOOl,
    FOREIGN KEY (song_id) REFERENCES song(song_id) 
    ON UPDATE CASCADE ON DELETE CASCADE ); 

CREATE TABLE rock(song_id Int primary key,
  guitar_solo BOOL,
  FOREIGN KEY (song_id) REFERENCES song(song_id) 
    ON UPDATE CASCADE ON DELETE CASCADE ); 

CREATE TABLE jazz (song_id Int primary key,
improvisation BOOL,
scat BOOL, 
FOREIGN KEY (song_id) REFERENCES song(song_id) 
    ON UPDATE CASCADE ON DELETE CASCADE ); 
    

/* MANDATORY AND */
/* collapse the hierarchy */
CREATE TABLE song ( 
song_id INT PRIMARY KEY,
                   temp INT,
				   meter INT,
                   is_reggae BOOL,
                   is_rock BOOL,
                   is_jazz BOOL, 
                   staccato INT,
                   guitar_solo BOOL,
                   scat BOOL,
                   improvisation INT ); 
                   
/* OPTIONAL AND */ 
/* one superclass instance can fall into many subclasses */
/* representing this relationship via a separate song_to_song_type table */
CREATE TABLE song_type (
  song_type VARCHAR(32) primary key ); 
  
  
CREATE TABLE song (
   song_id INT PRIMARY KEY,
   tempo INT,
   meter INT ); 
   
CREATE  TABLE song_to_song_type (
  song_type VARCHAR(32),
  song_id INT, 
  PRIMARY KEY (song_type, song_id ),
  foreign key (song_id) references song(song_id),
  foreign key (song_type) references song_type(song_type)); 
  
  CREATE TABLE song_detaIl (song_id INT PRIMARY KEY,
     -- limited_song_type ENUM('reggae', 'rock', 'jazz' ) Mandatory constraint 
     staccato INT, guitar BOOL, improv BOOL, scat BOOL,
     foreign key (song_id) references song(song_id) ); 
  
  /* OPTIONAL AND textbook solution */
  
    CREATE TABLE song_detaIl (song_id INT PRIMARY KEY,
     -- limited_song_type ENUM('reggae', 'rock', 'jazz' ) Mandatory constraint 
     staccato INT, guitar BOOL, improv BOOL, scat BOOL,
     foreign key (song_id) references song(song_id) ); 
     
CREATE TABLE song (
   song_id INT PRIMARY KEY,
   tempo INT,
   meter INT,
   song_type VARCHAR(64)); 
  