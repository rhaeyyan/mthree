CREATE DATABASE MovieCatalogue;
USE MovieCatalogue;

CREATE TABLE Genre (
    GenreID INT IDENTITY(1,1) PRIMARY KEY,
    GenreName VARCHAR(30) NOT NULL
);

CREATE TABLE Director (
    DirectorID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    BirthDate DATE NOT NULL,
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

CREATE TABLE CastMembers (
    CastMemberID INT IDENTITY(1,1) PRIMARY KEY,
    ActorID INT NOT NULL,
    MovieID INT NOT NULL,
    Role VARCHAR(50) NOT NULL,
    -- Constraints
    CONSTRAINT FK_CastMembers_Actor FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    CONSTRAINT FK_CastMembers_Movie FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
    CONSTRAINT UQ_CastMembers_Actor_Movie_Role UNIQUE (ActorID, MovieID, Role) 
);
