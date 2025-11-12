iCREATE TABLE musicien (
    id_musicien BIGINT PRIMARY KEY,  -- Changement pour BIGINT pour gérer de grands nombres
    prenom VARCHAR(50),
    nom_de_famille VARCHAR(50),
    est_responsable BOOLEAN
);

CREATE TABLE instrument (
    id_instrument INTEGER PRIMARY KEY,
    type_instrument VARCHAR(50),
    libelle VARCHAR(100)
);

CREATE TABLE composer (
    id_musicien BIGINT,  -- Alignement avec le type BIGINT
    id_instrument INTEGER,
    PRIMARY KEY (id_musicien, id_instrument),
    FOREIGN KEY (id_musicien) REFERENCES musicien(id_musicien),
    FOREIGN KEY (id_instrument) REFERENCES instrument(id_instrument)
);

CREATE TABLE morceau (
    id_morceau INTEGER PRIMARY KEY,
    utiliser BOOLEAN,
    proposer BOOLEAN
);

CREATE TABLE proposer (
    id_proposition INTEGER PRIMARY KEY,
    id_morceau INTEGER,
    id_musicien BIGINT,  -- Alignement avec le type BIGINT
    proposant BOOLEAN,
    FOREIGN KEY (id_morceau) REFERENCES morceau(id_morceau),
    FOREIGN KEY (id_musicien) REFERENCES musicien(id_musicien)
);

CREATE TABLE vendredi (
    id_vendredi INTEGER PRIMARY KEY,
    date DATE,
    concert_astree BOOLEAN
);

CREATE TABLE créneau (
    id_creneau INTEGER PRIMARY KEY,
    id_vendredi INTEGER,
    heure_debut TIME,
    heure_fin TIME,
    durée INTERVAL,
    FOREIGN KEY (id_vendredi) REFERENCES vendredi(id_vendredi)
);

CREATE TABLE répéter (
    id_musicien BIGINT,  -- Alignement avec le type BIGINT
    id_creneau INTEGER,
    PRIMARY KEY (id_musicien, id_creneau),
    FOREIGN KEY (id_musicien) REFERENCES musicien(id_musicien),
    FOREIGN KEY (id_creneau) REFERENCES créneau(id_creneau)
);

