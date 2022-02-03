CREATE TABLE Salle(
   IdSAlle INT,
   Designation VARCHAR(50),
   Capacité INT,
   Emplacement VARCHAR(50),
   PRIMARY KEY(IdSAlle)
);

CREATE TABLE Epreuve(
   IdEpreuve INT,
   Ufr VARCHAR(50),
   Année VARCHAR(50),
   DateEpreuve DATE,
   PRIMARY KEY(IdEpreuve)
);

CREATE TABLE Vague(
   IdVague INT,
   Durée DECIMAL(15,2),
   HeureDebut DATE,
   PRIMARY KEY(IdVague)
);

CREATE TABLE Note(
   IdNote INT,
   Resultat DECIMAL(15,2),
   Mention VARCHAR(50),
   PRIMARY KEY(IdNote)
);

CREATE TABLE Correcteur(
   IdCorrecteur VARCHAR(50),
   Name VARCHAR(50),
   PRIMARY KEY(IdCorrecteur),
   UNIQUE(Name)
);

CREATE TABLE Etufiant(
   IdEtudiant VARCHAR(50),
   Name VARCHAR(50),
   PRIMARY KEY(IdEtudiant)
);

CREATE TABLE Domaine(
   Id VARCHAR(50),
   Name VARCHAR(50),
   PRIMARY KEY(Id)
);

CREATE TABLE Lot(
   IdLot INT,
   IdCorrecteur VARCHAR(50) NOT NULL,
   IdVague INT NOT NULL,
   PRIMARY KEY(IdLot),
   FOREIGN KEY(IdCorrecteur) REFERENCES Correcteur(IdCorrecteur),
   FOREIGN KEY(IdVague) REFERENCES Vague(IdVague)
);

CREATE TABLE Copie(
   IdNote INT,
   IdLot INT,
   Id VARCHAR(50),
   IdEtudiant VARCHAR(50) NOT NULL,
   PRIMARY KEY(IdNote, IdLot, Id),
   FOREIGN KEY(IdNote) REFERENCES Note(IdNote),
   FOREIGN KEY(IdLot) REFERENCES Lot(IdLot),
   FOREIGN KEY(Id) REFERENCES Domaine(Id),
   FOREIGN KEY(IdEtudiant) REFERENCES Etufiant(IdEtudiant)
);

CREATE TABLE Convocation(
   IdSAlle INT,
   IdVague INT,
   IdEtudiant VARCHAR(50),
   IdEpreuve INT NOT NULL,
   PRIMARY KEY(IdSAlle, IdVague, IdEtudiant),
   FOREIGN KEY(IdSAlle) REFERENCES Salle(IdSAlle),
   FOREIGN KEY(IdVague) REFERENCES Vague(IdVague),
   FOREIGN KEY(IdEtudiant) REFERENCES Etufiant(IdEtudiant),
   FOREIGN KEY(IdEpreuve) REFERENCES Epreuve(IdEpreuve)
);
