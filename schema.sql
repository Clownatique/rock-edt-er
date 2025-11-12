DROP TABLE IF EXISTS musiciens;
DROP TABLE IF EXISTS instruments;
DROP TABLE IF EXISTS morceaux;
DROP TABLE IF EXISTS vendredi;
DROP TABLE IF EXISTS creneau;
DROP TABLE IF EXISTS appartenir;
DROP TABLE IF EXISTS composer;
DROP TABLE IF EXISTS proposition;

CREATE TABLE musiciens (
    idMu INTEGER PRIMARY KEY AUTOINCREMENT,
    prenom VARCHAR(64),
    nom_famille VARCHAR(64)
);

CREATE TABLE instruments (
    idI INTEGER PRIMARY KEY AUTOINCREMENT,
    typeI VARCHAR(16)
);

CREATE TABLE morceaux (
    idMo INTEGER PRIMARY KEY AUTOINCREMENT,
    progression INTEGER,
    setlist BOOL,
    titre VARCHAR(32)
);

CREATE TABLE vendredi (
    dateV DATE PRIMARY KEY,
    concert_astree BOOL
);

CREATE TABLE creneau (
    dateV DATE,
    duree INTEGER,
    idMo INTEGER,
    idMu INTEGER,
    PRIMARY KEY (dateV, duree),
    FOREIGN KEY (idMo) REFERENCES morceaux(idMo),
    FOREIGN KEY (idMu) REFERENCES musiciens(idMu)
);

CREATE TABLE appartenir (
    idI INTEGER,
    idMu INTEGER,
    PRIMARY KEY (idI, idMu),
    FOREIGN KEY (idI) REFERENCES instruments(idI),
    FOREIGN KEY (idMu) REFERENCES musiciens(idMu)
);

CREATE TABLE composer (
    idMo INTEGER,
    idI INTEGER,
    PRIMARY KEY (idMo, idI),
    FOREIGN KEY (idMo) REFERENCES morceaux(idMo),
    FOREIGN KEY (idI) REFERENCES instruments(idI)
);

CREATE TABLE proposition (
    idMo INTEGER,
    idMu INTEGER,
    proposant BOOL,
    PRIMARY KEY (idMo, idMu),
    FOREIGN KEY (idMo) REFERENCES morceaux(idMo),
    FOREIGN KEY (idMu) REFERENCES musiciens(idMu)
);
