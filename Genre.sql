CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL
);

CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL,
    ReleaseYear INT CHECK (ReleaseYear >= 1900 AND ReleaseYear <= 2100)
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

