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

CREATE TABLE lag
(
	ID INT PRIMARY KEY NOT NULL,
    Nafn VARCHAR(255),
    Lengd DECIMAL(4,3),
    Texti VARCHAR(255),
    FlytjandiID INT,
    FlokkurID INT,
    DiskurID INT,
    FOREIGN KEY (FlokkurID) REFERENCES flokkur(ID),
    FOREIGN KEY (DiskurID) REFERENCES diskur(ID),
    FOREIGN KEY (FlytjandiID) REFERENCES flytjandi(ID)
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
(1,"21. Öldinn"),
(2,"20. Öldinn"),
(3,"19. Öldinn Og Niður");

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

INSERT INTO lag(ID,Nafn,Lengd,Texti,FlytjandiID,FlokkurID,DiskurID)
VALUES
    (1,"Hot dog",1.11,"Jerry Leiber-Mike Stoller",1,2,1),
    (2,"Mean Woman Blues",2.44,"Claude Demetrius",1,2,1),
    (3,"Got A Lot O' Livin' To Do",2.33,"Aaron Schroeder, Ben Weisman",1,2,1),
    (4,"Ég Er Til",4.05,"Guðmundur Magni Ásgeirsson",2,1,2),
    (5,"Austur Þýsk",3.51,"Guðmundur Magni Ásgeirsson",2,1,2),
    (6,"Eitthvað er í loftinu",3.47,"Guðmundur Magni Ásgeirsson",2,1,2),
    (7,"Ah Pieta Signori Miei",1.49,"W.A Mozart",3,3,3),
    (8,"Or Sai Chi L'onore",6.58,"W.A Mozart",3,3,3),
    (9,"Violin Concerto in D major",6.51,"Johann Sebastian Bach",4,3,4),
    (10,"Violin Concerto in E minor",6.43,"Johann Sebastian Bach",4,3,4),
    (11,"Madness",4.41,"Matt Bellamy",5,1,5),
    (12,"Supremacy",4.55,"Matt Bellamy",5,1,5),
    (13,"Panic Station",3.04,"Matt Bellamy",5,1,5),
    (14,"Survival",4.17,"Matt Bellamy",5,1,5),
    (15,"Where them girls at",5.12,"Mike Caren",6,1,6),
    (16,"With out you",3.28,"Taio Cruz",6,1,6),
    (17,"Infinte",4.11,"Eminem",7,1,7),
    (18,"Monsters keep me company",5.29,"Mr Amen",8,1,8),
	(19,"Kill everybody",4.58,"Sonny Moore",9,1,9),
    (20,"With you",6.29,"Sonny Moore",9,1,9);

SELECT diskur.ID as "Diskur", lag.Nafn FROM diskur INNER JOIN lag ON diskur.ID=lag.DiskurID WHERE diskur.ID = 5;
SELECT flytjandi.Nafn, lag.Nafn FROM flytjandi INNER JOIN lag ON flytjandi.ID=lag.FlytjandiID WHERE flytjandi.ID = 1;
SELECT * FROM lag WHERE Lengd > 5;
SELECT * FROM diskur WHERE Utgafudagur > "2010-12-31";