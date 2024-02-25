-- Add a new artist
INSERT INTO "artists" ("id", "first_name", "last_name")
VALUES (1, 'Amy', 'Winehouse');

-- Add a new song
INSERT INTO "songs" ("id", "name")
VALUES (1, 'Tears Dry on Their Own');

-- Add a new album
INSERT INTO "albums" ("id", "song_id", "name")
VALUES (1, 1, 'Back to Black');

-- Add new added album and song to relationship table
INSERT INTO "artists_and_albums" ("id", "album_id", "artist_id")
VALUES (1, 1, 1);

-- Select all titles of all albums of an artist
SELECT "name" FROM "albums" WHERE "id" = (
    SELECT "album_id" FROM "artists_and_albums" WHERE "artist_id" = (
        SELECT "id" FROM "artists"
        WHERE "first_name" = 'Amy'
        AND "last_name" = 'Winehouse'
    )
);

-- Add two new users
INSERT INTO "users" ("id", "username", "password")
VALUES (1, 'user1', '123456');

INSERT INTO "users" ("id", "username", "password")
VALUES (2, 'user2', 'qwerty');

-- Add a friend relationship
INSERT INTO "friends" ("id", "first_user_id", "second_user_id")
VALUES (1, 1, 2), (2, 2, 1);

-- Select all friends of an user
SELECT "username" AS "friends" FROM "users"
WHERE "id" IN (
    SELECT "second_user_id" FROM "friends"
    WHERE "first_user_id" = (
        SELECT "id" FROM "users"
        WHERE "username" = 'user1'
    )
);

-- Add a playlist
INSERT INTO "playlists" ("id", "name", "user_id", "song_id")
VALUES (1, 'my_playlist', 1, 1);

-- Select all playlists of an user
SELECT * FROM "users_playlists"
WHERE "username" = 'user1';
