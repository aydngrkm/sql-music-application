-- Represent users of the application
CREATE TABLE "users" (
    "id" INT,
    "username" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL,
    CHECK(
        length("username") <= 64 AND
        length("password") >= 8 AND
        length("password") <= 64
    )
    PRIMARY KEY("id")
);

-- Represent songs on the application
CREATE TABLE "songs" (
    "id" INT,
    "name" TEXT NOT NULL CHECK(length("name") <= 64),
    PRIMARY KEY("id")
);

-- Represent albums on the application which are created by artists and includes songs
CREATE TABLE "albums" (
    "id" INT,
    "song_id" INT NOT NULL,
    "name" TEXT NOT NULL CHECK(length("name") <= 64),
    PRIMARY KEY("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

-- Represent artists on the application
CREATE TABLE "artists" (
    "id" INT,
    "first_name" TEXT NOT NULL CHECK(length("first_name") <= 64),
    "last_name" TEXT NOT NULL CHECK(length("last_name") <= 64),
    PRIMARY KEY ("id")
);

-- Represent many-to-many relationship between artists and albums
CREATE TABLE "artists_and_albums" (
    "id" INT,
    "album_id" INT,
    "artist_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("album_id") REFERENCES "albums"("id"),
    FOREIGN KEY("artist_id") REFERENCES "artists"("id")
);

-- Represent playlists created by users
CREATE TABLE "playlists" (
    "id" INT,
    "name" TEXT NOT NULL CHECK(length("name") <= 64),
    "user_id" INT,
    "song_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("song_id") REFERENCES "songs"("id")
);

-- Represent users following each other
CREATE TABLE "friends" (
    "id" INT,
    "first_user_id" INT,
    "second_user_id" INT,
    PRIMARY KEY("id"),
    FOREIGN KEY("first_user_id") REFERENCES "users"("id"),
    FOREIGN KEY("second_user_id") REFERENCES "users"("id")
);

-- Create a view
CREATE VIEW "users_playlists" AS
SELECT "username", "playlists"."name" FROM "users"
JOIN "playlists" ON "users"."id" = "playlists"."user_id";

-- Create indexes in order to quickly search users, songs and playlists
CREATE INDEX "user_search" ON "users" ("id");
CREATE INDEX "song_search" ON "songs" ("id");
CREATE INDEX "playlist_search" ON "playlists" ("id");
