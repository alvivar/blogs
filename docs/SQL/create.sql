
-- DROP TABLE users;

CREATE TABLE users (
	id serial NOT NULL,
	"name" varchar(256) NOT NULL,
	email varchar(256) NOT NULL,
	"password" varchar(256) NOT NULL,
	CONSTRAINT users_pk PRIMARY KEY (id)
);

-- DROP TABLE blogs;

CREATE TABLE blogs (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	"name" varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	CONSTRAINT blogs_pk PRIMARY KEY (id),
	CONSTRAINT blogs_users_fk FOREIGN KEY (user_id) REFERENCES users(id)
);

-- DROP TABLE posts;

CREATE TABLE posts (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	blog_id int4 NOT NULL,
	title varchar(256) NOT NULL,
	"content" varchar(256) NOT NULL,
	CONSTRAINT posts_pk PRIMARY KEY (id),
	CONSTRAINT posts_users_fk FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT posts_blogs_fk FOREIGN KEY (blog_id) REFERENCES blogs(id)
);

-- DROP TABLE tags;

CREATE TABLE tags (
	id serial NOT NULL,
	"name" varchar(256) NOT NULL,
	description varchar(256) NOT NULL,
	CONSTRAINT tags_pk PRIMARY KEY (id)
);

-- DROP TABLE posts_tags;

CREATE TABLE posts_tags (
	id serial NOT NULL,
	post_id int4 NOT NULL,
	tag_id int4 NOT NULL,
	CONSTRAINT posts_tags_pk PRIMARY KEY (id),
	CONSTRAINT posts_tags_posts_fk FOREIGN KEY (post_id) REFERENCES posts(id),
	CONSTRAINT posts_tags_tags_fk FOREIGN KEY (tag_id) REFERENCES tags(id)
);

-- DROP TABLE "comments";

CREATE TABLE "comments" (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	post_id int4 NOT NULL,
	"content" varchar(256) NOT NULL,
	CONSTRAINT comments_pk PRIMARY KEY (id),
	CONSTRAINT comments_users_fk FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT comments_posts_fk FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- DROP TABLE comments_closure;

CREATE TABLE comments_closure (
	id serial NOT NULL,
	ancestor_id int4 NOT NULL,
	descendant_id int4 NOT NULL,
	CONSTRAINT comments_closure_pk PRIMARY KEY (id),
	CONSTRAINT comments_closure_comments_fk_1 FOREIGN KEY (ancestor_id) REFERENCES comments(id),
	CONSTRAINT comments_closure_comments_fk_2 FOREIGN KEY (descendant_id) REFERENCES comments(id)
);

-- DROP TABLE likes;

CREATE TABLE likes (
	id serial NOT NULL,
	user_id int4 NOT NULL,
	post_id int4 NOT NULL,
	liked bool NOT NULL,
	CONSTRAINT likes_pk PRIMARY KEY (id),
	CONSTRAINT likes_users_fk FOREIGN KEY (user_id) REFERENCES users(id),
	CONSTRAINT likes_posts_fk FOREIGN KEY (post_id) REFERENCES posts(id)
);
