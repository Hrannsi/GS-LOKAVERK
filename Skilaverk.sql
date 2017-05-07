CREATE database 2304003260_lokaverk;
USE 2304003260_lokaverk;

CREATE TABLE flytjandi
(
	ID INT PRIMARY KEY NOT NULL,
    NAFN VARCHAR(255),
    Faedingardagur DATE,
    Danardagur DATE,
    Lysing VARCHAR(255),
    Tegund_Flytjanda VARCHAR(255)
);

CREATE TABLE flokkur
(
	ID INT PRIMARY KEY NOT NULL,
    Nafn VARCHAR(255)
);

CREATE TABLE lag
(
	ID INT PRIMARY KEY NOT NULL,
    NAFN VARCHAR(255),
    Lengd DEC(2,1),
    Texti VARCHAR(255),
    FlokkurID INT,
    FOREIGN KEY (FlokkurID) REFERENCES flokkur(ID)
);

CREATE TABLE tegund
(
	ID INT PRIMARY KEY NOT NULL,
    Nafn VARCHAR(255)
);

CREATE TABLE utgefandi
(
	ID INT PRIMARY KEY NOT NULL,
    Nafn VARCHAR(255),
    FjoldiDiska INT
);

CREATE TABLE diskur
(
	ID INT PRIMARY KEY NOT NULL,
    Nafn varchar(255),
    Utgafudagur DATE,
    TegundID INT,
    FlytjandiID INT,
    UtgefandiID INT,
    FOREIGN KEY (TegundID) REFERENCES tegund(ID),
    FOREIGN KEY (FlytjandiID) REFERENCES flytjandi(ID),
    FOREIGN KEY (UtgefandiID) REFERENCES utgefandi(ID)
);