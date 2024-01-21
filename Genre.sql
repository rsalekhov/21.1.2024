CREATE TABLE IF NOT EXISTS Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS ArtistGenre (
    artist_id INT,
    genre_id INT,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

CREATE TABLE IF NOT EXISTS Album (
    album_id INT PRIMARY KEY,
    album_name VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id)
);

CREATE TABLE IF NOT EXISTS ArtistAlbum (
    artist_id INT,
    album_id INT,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Track (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(255) NOT NULL,
    duration INT NOT NULL,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Compilation (
    compilation_id INT PRIMARY KEY,
    compilation_name VARCHAR(255) NOT NULL,
    release_year INT NOT NULL
);

CREATE TABLE IF NOT EXISTS CompilationTrack (
    compilation_id INT,
    track_id INT,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES Compilation(compilation_id),
    FOREIGN KEY (track_id) REFERENCES Track(track_id)
);
