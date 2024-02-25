# SQL Project: Music Application Database

This project represents a database schema for a music application, including tables for users, songs, albums, artists, playlists, and relationships between them.

## Schema Description

The database schema consists of the following tables:

### `users`

- Represents users of the application.
- Attributes:
  - `id`: Unique identifier for each user.
  - `username`: Username of the user (unique).
  - `password`: Password of the user.

### `songs`

- Represents songs available on the application.
- Attributes:
  - `id`: Unique identifier for each song.
  - `name`: Name of the song.

### `albums`

- Represents albums created by artists and includes songs.
- Attributes:
  - `id`: Unique identifier for each album.
  - `song_id`: Foreign key referencing the `id` column in the `songs` table.
  - `name`: Name of the album.

### `artists`

- Represents artists on the application.
- Attributes:
  - `id`: Unique identifier for each artist.
  - `first_name`: First name of the artist.
  - `last_name`: Last name of the artist.

### `artists_and_albums`

- Represents the many-to-many relationship between artists and albums.
- Attributes:
  - `id`: Unique identifier for each relationship.
  - `album_id`: Foreign key referencing the `id` column in the `albums` table.
  - `artist_id`: Foreign key referencing the `id` column in the `artists` table.

### `playlists`

- Represents playlists created by users.
- Attributes:
  - `id`: Unique identifier for each playlist.
  - `name`: Name of the playlist.
  - `user_id`: Foreign key referencing the `id` column in the `users` table.
  - `song_id`: Foreign key referencing the `id` column in the `songs` table.

### `friends`

- Represents users following each other.
- Attributes:
  - `id`: Unique identifier for each relationship.
  - `first_user_id`: Foreign key referencing the `id` column in the `users` table.
  - `second_user_id`: Foreign key referencing the `id` column in the `users` table.

## Views

- `users_playlists`: A view that displays the usernames and names of playlists created by users.

## Indexes

- `user_search`: Index created on the `id` column in the `users` table for quick search.
- `song_search`: Index created on the `id` column in the `songs` table for quick search.
- `playlist_search`: Index created on the `id` column in the `playlists` table for quick search.

## Entity Relationship Diagram (ERD)

![er_diagram](https://github.com/aydngrkm/sql-music-application/assets/96431787/5b2ad3cc-7377-4054-9d36-5c46f557361b)

## Installation

1. Create a new SQLite database or use an existing one.
2. Execute the `schema.sql` script provided in this repository to create the tables, views, and indexes.
3. Populate the tables with data as needed.

## Usage

Once the database schema is set up and populated with data, you can perform various operations such as querying users, songs, playlists, etc., to support the functionalities of your music application.

Example queries can be found in the `queries.sql` file.
