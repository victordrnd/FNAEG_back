
create table chromosomes(
    NumChromo varchar(30) primary key
    );
    
create table locus(
    CodeLocus varchar(30) primary key,
    Position integer,
    Sequence float,
    NBCarSeq integer,
    LocPdt float,
    LocSvt float,
    NumChromo varchar(30),
    foreign key (NumChromo) references chromosomes(NumChromo)
);
create table personnes(
    Matricule VARCHAR(30) primary key,
    Nom VARCHAR(100),
    Prenom varchar(30),
    DateNaissance date,
    Adresse varchar(255),
    Ville varchar(100),
    Pays varchar(100)
);

CREATE TABLE infractions(
    CodeI varchar(30),
    Libelle varchar(255),
    Niveau int,
    Primary key(CodeI)
);

CREATE TABLE labos(
    CodeLab varchar(30),
    Type varchar(255),
    Ville varchar(255),
    Primary key(CodeLab)
);

Create TABLE fabricants(
    CodeF varchar(30) primary key,
    Nom varchar(255),
    Pays varchar(255),
    Ville varchar(255)
);

create table kits(
    CodeKit varchar(30),
    prix float,
    Annee Date,
    Duree integer,
    CodeF varchar(30),
    Primary key (CodeKit),
    Foreign key (CodeF) references fabricants (CodeF)
);


create table affaires(
    NumAffaire varchar(30) Primary key,
    DateAffaire date,
    Description varchar(255),
    CodeLab varchar(30),
    Foreign key (CodeLab) references labos(CodeLab)
);


create table scelles(
    NumAffaire varchar(30),
    NumScelle varchar(30),
    Description varchar(255),
    primary key (NumAffaire,NumScelle),
    Foreign key (NumAffaire) references affaires(NumAffaire)
);


create table lstProfils(
    NumAffaire varchar(30),
    NumScelle varchar(30),
    NumProfil varchar(30),
    primary key (NumAffaire, NumScelle, NumProfil),
    foreign key (NumAffaire) references affaires(NumAffaire),
    foreign key (NumScelle) references scelles(NumScelle)
);

create table cdes(
    CodeKit varchar(30),
    CodeLab varchar(30),
    DateCde Date,
    Qte integer,
    Primary key(CodeKit, CodeLab, DateCde),
    Foreign key (CodeKit) references kits(CodeKit),
    Foreign key (CodeLab) references labos(CodeLab)
);


create table marqueurs(
    CodeLocus varchar(30),
    CodeKit varchar(30),
    couleur varchar (20),
    primary key (CodeLocus, CodeKit),
    foreign key (CodeKit) references kits(CodeKit)
);

create table profil_individu(
    Matricule varchar(30),
    CodeLocus varchar(30),
    Allele1 float,
    Allele2 float,
    Date Date,
    CodeLab varchar(30),
    primary key (Matricule, CodeLocus),
    Foreign key (CodeLab) references cdes(CodeLab)
);

create table profil_trace(
NumAffaire varchar(30),
NumScelle varchar(30),
NumProfil varchar(30),
Locus varchar(30),
Allele1 varchar(30) NOT NULL,
Allele2 varchar(30) NOT NULL,
Date date NOT NULL,
Foreign key NumAffaire references NumAffaire(FNAEG_LstProfils),
Foreign key NumScelle references NumScelle(FNAEG_LstProfils ),
Foreign key NumProfil references NumProfil(FNAEG_LstProfils),
Foreign key Locus references Locus(FNAEG_Locus),
primary key (NumAffaire, NumScelle, NumProfil, Locus),
);


create table casiers(
    Matricule varchar(30),
    CodeI varchar(30),
    DateI date,
    Description varchar(50),
    Pays varchar(30),
    Ville varchar(30),
    NumAffaire varchar(30),
    primary key(Matricule,CodeI,DateI),
    Foreign key Matricule references personnes(Matricule),
    Foreign key NumAffaire references affaires(NumAffaire)
);