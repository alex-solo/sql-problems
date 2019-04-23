CREATE TABLE lists (
                    id serial PRIMARY KEY,
                    name varchar(100) NOT NULL UNIQUE
                    );

CREATE TABLE todos (
                    id serial PRIMARY KEY,
                    name varchar(100) NOT NULL,
                    completed boolean NOT NULL DEFAULT false,
                    list_id int NOT NULL REFERENCES lists (id)
                    );