CREATE TABLE Genres (
    GenreID INT PRIMARY KEY,
    GenreName VARCHAR(255) NOT NULL
);

CREATE TABLE Artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(255) NOT NULL,
    GenreID INT,
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE Albums (
    AlbumID INT PRIMARY KEY,
    AlbumName VARCHAR(255) NOT NULL,
    ReleaseYear INT,
    ArtistID INT,
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

CREATE TABLE Tracks (
    TrackID INT PRIMARY KEY,
    TrackName VARCHAR(255) NOT NULL,
    Duration INT,
    AlbumID INT,
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID)
);

CREATE TABLE Compilations (
    CompilationID INT PRIMARY KEY,
    CompilationName VARCHAR(255) NOT NULL,
    ReleaseYear INT
);

CREATE TABLE CompilationTracks (
    CompilationID INT,
    TrackID INT,
    PRIMARY KEY (CompilationID, TrackID),
    FOREIGN KEY (CompilationID) REFERENCES Compilations(CompilationID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID)
);

