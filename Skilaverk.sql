CREATE database 2304003260_lokaverk;
USE 2304003260_lokaverk;

DROP TABLE flytjandi;

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
    DiskurID INT,
    FOREIGN KEY (FlokkurID) REFERENCES flokkur(ID),
    FOREIGN KEY (DiskurID) REFERENCES diskur(ID)
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

INSERT INTO flytjandi(ID,Nafn,Faedingardagur,Danardagur,Lysing,Tegund_Flytjanda)
VALUES
(1,"Elvis Presley","1935-1-8","1977-8-16","King Of Rock","Rock"),
(2,"Guðmundur Magni Ásgeirsson","1978-12-1",NULL,"Sköllóttur","POP"),
(3,"Wolfgang Amadeus Mozart","1756-1-27","1791-12-5","King Of Classical","Classic"),
(4,"Johann Sebastian Bach","1685-3-31","1750-7-28","Magnaður","Classic"),
(5,"Matt Bellamy","1978-6-9",NULL,"Ekki Mús","Rock"),
(6,"David Guetta","1967-11-7",NULL,"DANCE!","Electronic"),
(7,"Eminem","1972-10-17",NULL,"Hraður","Rap"),
(8,"Mr.Lordi","1974-2-15",NULL,"Djöfillinn","Hard Metal"),
(9,"Skrillex","1988-1-15",NULL,"Djöfull","Dubstep");

INSERT INTO flokkur(ID,Nafn)
VALUES
(1,"Rock"),
(2,"Classic"),
(3,"Pop");

INSERT INTO tegund(ID,Nafn)
VALUES
(1,"Rock"),
(2,"Classic"),
(3,"Pop"),
(4,"Rap"),
(5,"Electronic"),
(6,"Heavy Metal"),
(7,"Dubstep");

INSERT INTO utgefandi(ID,Nafn,FjoldiDiska)
VALUES
(1,"Aberbach",332),
(2,"Spor",119),
(3,"Deutsche Grammophon",132),
(4,"Karussell",123),
(5,"Warner Bros. Records",262),
(6,"Virgin",112),
(7,"FBT Productions",20),
(8,"HMC Music Publishing",197),
(9,"Kobalt Songs Music Publishing",224);

INSERT INTO diskur(ID,Nafn,Utgafudagur,TegundID,FlytjandiID,UtgefandiID)
VALUES
(1,"Loving You Vol.2","1957-7-1",1,1,1),
(2,"ÁMS","2010-6-22",3,2,2),
(3,"Don Giovanni","2012-9-7",2,3,3),
(4,"Violin concerto","1993-1-1",2,4,4),
(5,"The 2nd Law","2012-9-28",1,5,5),
(6,"Nothing but the beat","2011-8-26",5,6,6),
(7,"Infinite","1996-1-1",4,7,7),
(8,"Deadache","2008-10-23",6,8,8),
(9,"Scary Monsters And Nice Sprites","2010-10-22",7,9,9);




SELECT * FROM flytjandi;