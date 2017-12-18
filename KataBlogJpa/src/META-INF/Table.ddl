--DROP TABLE APP.Post_Tag;
--DROP TABLE APP.Post;
--DROP TABLE APP.Tag;
--DROP TABLE APP.Editor;

CREATE TABLE APP.Editor (id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY, email VARCHAR(255) NOT NULL, name VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, PRIMARY KEY (id), CONSTRAINT UNQ_ UNIQUE (email));
CREATE TABLE APP.Post (id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY, content VARCHAR(255), slug VARCHAR(255) NOT NULL, title VARCHAR(255) NOT NULL, AUTHOR_ID BIGINT, PRIMARY KEY (id));
CREATE TABLE APP.Post_Tag (POSTS_ID BIGINT, TAGS_ID BIGINT);
CREATE TABLE APP.Tag (id BIGINT NOT NULL GENERATED BY DEFAULT AS IDENTITY, name VARCHAR(255) NOT NULL, PRIMARY KEY (id));
ALTER TABLE APP.Post ADD FOREIGN KEY (AUTHOR_ID) REFERENCES APP.Editor (id);
ALTER TABLE APP.Post_Tag ADD FOREIGN KEY (POSTS_ID) REFERENCES APP.Post (id);
ALTER TABLE APP.Post_Tag ADD FOREIGN KEY (TAGS_ID) REFERENCES APP.Tag (id);