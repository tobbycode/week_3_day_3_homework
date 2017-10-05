DROP TABLE IF EXISTS collection;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  artist_name VARCHAR(255)
);




CREATE TABLE collection (
  id SERIAL4 PRIMARY KEY,
  album_title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);
