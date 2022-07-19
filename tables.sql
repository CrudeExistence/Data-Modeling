CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    address VARCHAR(100)
);

CREATE TABLE recipes (
    recipe_id SERIAL PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE grocery_list (
    grocery_list_id SERIAL PRIMARY KEY,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE ingredients (
    ingredients_id SERIAL PRIMARY KEY,
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE occasions (
    occasions_id SERIAL PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE remakes (
    remake_id SERIAL PRIMARY KEY,
    FOREIGN KEY (occasions_id) REFERENCES occasions(occasions_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comments SERIAL PRIMARY KEY,
    comment TEXT,
    like_count INT,
    share_count INT,
    FOREIGN KEY (remake_id) REFERENCES remakes(remake_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

