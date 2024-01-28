CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL
);

CREATE TABLE ArtistGenres (
    ArtistID INT,
    GenreID INT,
    PRIMARY KEY (ArtistID, GenreID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL,
    ReleaseYear INT CHECK (ReleaseYear >= 1900 AND ReleaseYear <= 2100),
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE TABLE AlbumGenres (
    AlbumID INT,
    GenreID INT,
    PRIMARY KEY (AlbumID, GenreID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY,
    TrackName VARCHAR(255) NOT NULL,
    Duration INT CHECK (Duration >= 0),
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Compilations (
    CompilationID INT PRIMARY KEY,
    CompilationName VARCHAR(255) UNIQUE NOT NULL,
    ReleaseYear INT CHECK (ReleaseYear >= 1900 AND ReleaseYear <= 2100)
);

CREATE TABLE CompilationTracks (
    CompilationID INT,
    TrackID INT,
    PRIMARY KEY (CompilationID, TrackID),
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);
