CREATE DATABASE MovieCatalogue;
USE MovieCatalogue;

CREATE TABLE Genre (
    INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(30) NOT NULL
);

CREATE TABLE Director (
    DirectorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
);

CREATE TABLE Rating (
    RatingID INT IDENTITY(1,1) PRIMARY KEY,
    RatingName VARCHAR(30) NOT NULL
);

CREATE TABLE Actor  (
    ActorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL, 
    BirthDate DATE NOT NULL
);

CREATE TABLE Movie (
    MovieID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(128) NOT NULL,
    ReleaseDate DATE NOT NULL,
    -- Foreign Keys
    GenreID INT NOT NULL,
    DirectorID INT NOT NULL,
    RatingID INT NOT NULL,
    -- Constraints
    CONSTRAINT FK_Movie_Genre FOREIGN KEY (GenreID) REFERENCES Genre(GenreID),
    CONSTRAINT FK_Movie_Director FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    CONSTRAINT FK_Movie_Rating FOREIGN KEY (RatingID) REFERENCES Rating(RatingID)
);


