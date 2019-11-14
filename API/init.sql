CREATE TABLE users
(
  id SERIAL PRIMARY KEY UNIQUE,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  passhash VARCHAR(100) NOT NULL,
  jobRole VARCHAR(100) NOT NULL,
  department VARCHAR(100) NOT NULL,
  address VARCHAR(200) NOT NULL
);

INSERT INTO users (firstName, lastName, email, passhash, jobRole, department, address) VALUES ('Admin', 'admin', 'admin@admin.com', 'dkkdkkkslai33333', 'admin', 'admin', 'headquarters');

CREATE TABLE tags
(
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE gifs(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  gif_url VARCHAR(100) NOT NULL,
  tag_name VARCHAR(100),
  date_created Date NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_tags FOREIGN KEY (tag_name) REFERENCES tags (tag_name)
   );

CREATE TABLE articles 
(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  article TEXT NOT NULL,
  tag_name VARCHAR(100),
  date_created DATE NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_tags FOREIGN KEY (tag_name) REFERENCES tags (tag_name)
);

CREATE TABLE gifs_comments
(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  comment VARCHAR(1000) NOT NULL,
  gif_id INT NOT NULL,
  date_created DATE NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_gifs FOREIGN KEY (gif_id) REFERENCES gifs (id)
);

CREATE TABLE articles_comments
(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  comment VARCHAR(1000) NOT NULL,
  article_id INT NOT NULL,
  date_created DATE NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_posts FOREIGN KEY (article_id) REFERENCES articles (id)
);


CREATE TABLE gifs_flags
(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  gif_id INT NOT NULL,
  date_created DATE NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_gifs FOREIGN KEY (gif_id) REFERENCES gifs (id)
);

CREATE TABLE articles_flags(
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  article_id INT NOT NULL,
  date_created DATE NOT NULL,
  CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
  CONSTRAINT fk_articles FOREIGN KEY (article_id) REFERENCES articles (id)
);


CREATE TABLE shared_gifs (
    id SERIAL NOT NULL UNIQUE,
    user_id INT NOT NULL,
    gif_id INT NOT NULL,
    CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_gifs FOREIGN KEY (gif_id) REFERENCES gifs (id)
);

CREATE TABLE shared_articles (
    id SERIAL NOT NULL UNIQUE,
    user_id INT NOT NULL,
    article_id INT NOT NULL,
    CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users (id),
    CONSTRAINT fk_articles FOREIGN KEY (article_id) REFERENCES articles (id)
);

