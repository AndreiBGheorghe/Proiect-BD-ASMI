CREATE SCHEMA `asmi`;

CREATE TABLE `asmi`.`departamente` (
  `id_departament` INT NOT NULL,
  `nume_departament` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_departament`),
  UNIQUE INDEX `nume_departament_UNIQUE` (`nume_departament` ASC) VISIBLE);
  
CREATE TABLE `asmi`.`resurse` (
  `id_resursa` INT NOT NULL,
  `nume_resursa` VARCHAR(45) NOT NULL,
  `cantitate` INT NULL,
  `id departament` INT NOT NULL,
  PRIMARY KEY (`id_resursa`),
  UNIQUE INDEX `nume_resursa_UNIQUE` (`nume_resursa` ASC) VISIBLE,
  INDEX `id_departament_idx` (`id departament` ASC) VISIBLE,
  CONSTRAINT `id_departament`
    FOREIGN KEY (`id departament`)
    REFERENCES `asmi`.`departamente` (`id_departament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `asmi`.`oras` (
  `id_oras` INT NOT NULL,
  `nume_oras` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_oras`));

CREATE TABLE `asmi`.`voluntari` (
  `id_voluntar` INT NOT NULL,
  `nume_voluntar` VARCHAR(45) NOT NULL,
  `prenume_voluntar` VARCHAR(45) NOT NULL,
  `id_dep` INT NULL,
  `id_oras` INT NOT NULL,
  PRIMARY KEY (`id_voluntar`),
  INDEX `id_departament_idx` (`id_dep` ASC) VISIBLE,
  INDEX `id_oras_idx` (`id_oras` ASC) VISIBLE,
  CONSTRAINT `id_dep`
    FOREIGN KEY (`id_dep`)
    REFERENCES `asmi`.`departamente` (`id_departament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_oras`
    FOREIGN KEY (`id_oras`)
    REFERENCES `asmi`.`oras` (`id_oras`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `asmi`.`jocuri` (
  `id_joc` INT NOT NULL,
  `nume_joc` VARCHAR(45) NOT NULL,
  `nr_participanti` VARCHAR(45) NULL,
  PRIMARY KEY (`id_joc`),
  UNIQUE INDEX `nume_joc_UNIQUE` (`nume_joc` ASC) VISIBLE);

CREATE TABLE `asmi`.`sponsori` (
  `id_sponsor` INT NOT NULL,
  `nume_sponsor` VARCHAR(45) NOT NULL,
  `domeniu` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_sponsor`),
  UNIQUE INDEX `nume_sponsor_UNIQUE` (`nume_sponsor` ASC) VISIBLE);

CREATE TABLE `asmi`.`proiecte` (
  `id_proiect` INT NOT NULL,
  `nume_proiect` VARCHAR(45) NOT NULL,
  `data_inceput` DATE NOT NULL,
  `data_finalizare` DATE NOT NULL,
  `id_joc` INT NULL,
  `id_sponsor` INT NULL,
  PRIMARY KEY (`id_proiect`),
  UNIQUE INDEX `nume_proiect_UNIQUE` (`nume_proiect` ASC) VISIBLE,
  INDEX `id_joc_idx` (`id_joc` ASC) VISIBLE,
  INDEX `id_sponsor_idx` (`id_sponsor` ASC) VISIBLE,
  CONSTRAINT `id_joc`
    FOREIGN KEY (`id_joc`)
    REFERENCES `asmi`.`jocuri` (`id_joc`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_sponsor`
    FOREIGN KEY (`id_sponsor`)
    REFERENCES `asmi`.`sponsori` (`id_sponsor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `asmi`.`atributii` (
  `id¬_atributie` INT NOT NULL,
  `nume_atributie` VARCHAR(45) NOT NULL,
  `id_voluntar` INT NOT NULL,
  `id_proiect` INT NOT NULL,
  PRIMARY KEY (`id¬_atributie`),
  INDEX `id_voluntar_idx` (`id_voluntar` ASC) VISIBLE,
  INDEX `id_proiect_idx` (`id_proiect` ASC) VISIBLE,
  CONSTRAINT `id_voluntar`
    FOREIGN KEY (`id_voluntar`)
    REFERENCES `asmi`.`voluntari` (`id_voluntar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_proiect`
    FOREIGN KEY (`id_proiect`)
    REFERENCES `asmi`.`proiecte` (`id_proiect`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `asmi`.`departamente` (`id_departament`, `nume_departament`) VALUES ('1', 'Design&PR');
INSERT INTO `asmi`.`departamente` (`id_departament`, `nume_departament`) VALUES ('2', 'Educational');
INSERT INTO `asmi`.`departamente` (`id_departament`, `nume_departament`) VALUES ('3', 'HumanResources');
INSERT INTO `asmi`.`departamente` (`id_departament`, `nume_departament`) VALUES ('4', 'Management&Fundraising');

INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('1', 'CameraFoto', '1', '1');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('2', 'Badge', '150', '2');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('3', 'Minge', '5', '3');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('4', 'Balon', '45', '3');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('5', 'Boxa', '1', '3');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('6', 'CabluHDMI', '2', '1');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('7', 'RollUp', '4', '4');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('8', 'Banner', '1', '4');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('9', 'Laptop', '1', '1');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('10', 'Videoproiector', '1', '2');
INSERT INTO `asmi`.`resurse` (`id_resursa`, `nume_resursa`, `cantitate`, `id_departament`) VALUES ('11', 'Megafon', '1', '3');

INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('1', 'Alba Iulia');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('2', 'Arad');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('3', 'Pitești');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('4', 'Bacău');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('5', 'Oradea');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('6', 'Bistrița');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('7', 'Botoșani');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('8', 'Brasov');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('9', 'Brăila');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('10', 'București');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('11', 'Buzău');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('12', 'Reșița');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('13', 'Călărași');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('14', 'Cluj-Napoca');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('15', 'Constanța');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('16', 'Sfântu Gheorghe');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('17', 'Târgoviște');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('18', 'Craiova');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('19', 'Galați');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('20', 'Giurgiu');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('21', 'Târgu Jiu');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('22', 'Miercurea Ciuc');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('23', 'Deva');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('24', 'Slobozia');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('25', 'Iași');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('26', 'Baia Mare');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('27', 'Drobeta-Turnu Severin');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('28', 'Târgu Mureș');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('29', 'Piatra Neamț');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('30', 'Slatina');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('31', 'Ploiești');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('32', 'Satu Mare');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('33', 'Zalău');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('34', 'Sibiu');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('35', 'Suceava');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('36', 'Alexandria');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('37', 'Timișoara');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('38', 'Tulcea');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('39', 'Vaslui');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('40', 'Râmnicu Vâlcea');
INSERT INTO `asmi`.`orase` (`id_oras`, `nume_oras`) VALUES ('41', 'Focșani');

INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('1', 'Moroșan', 'Eric', '2', '7');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('2', 'Gheorghe', 'Radu', '4', '18');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('3', 'Chițu', 'Tudor', '2', '29');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('4', 'Delcea', 'Loredana', '3', '18');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('5', 'Prisăcaru', 'Georgiana', '2', '23');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('6', 'Costache', 'Carolina', '1', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('7', 'Ingeaua', 'Alexandru', '2', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('8', 'Gheorghe', 'Andrei', '3', '9');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('9', 'Gherasim', 'Corina', '4', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('10', 'Baciu', 'Rareș', '1', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('11', 'Boț', 'George', '1', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('12', 'Botezatu', 'Cosmin', '1', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('13', 'Brânzea', 'Mălina', '1', '11');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('14', 'Căpitanu', 'Andreea', '1', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('15', 'Ciurescu', 'Andreea', '1', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('16', 'Cochiorca', 'Oana', '1', '4');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('17', 'Dîrțu', 'Ecaterina', '1', '35');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('18', 'Mincu', 'Adrian', '1', '31');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('19', 'Nica', 'Cătălina', '1', '30');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('20', 'Potlog', 'Ioana', '1', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('21', 'Suditu', 'Ana', '1', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('22', 'Badea', 'Bianca', '2', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('23', 'Bejenaru', 'Andrada', '2', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('24', 'Bogos', 'Andrei', '2', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('25', 'Corneciu', 'Darius', '2', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('26', 'Epure', 'Carlo', '2', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('27', 'Ichim', 'Anca', '2', '9');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('28', 'Ionescu', 'Raluca', '2', '31');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('29', 'Mihalcea', 'Alexandru', '2', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('30', 'Nazare', 'Elena', '2', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('31', 'Olaru', 'Claudiu', '2', '4');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('32', 'Heros', 'Amalia', '2', '7');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('33', 'Decun', 'Izabela', '2', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('34', 'Bălăiță', 'Cosmin', '3', '4');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('35', 'Bivol', 'Mihai', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('36', 'Cazacu', 'Claudia', '3', '27');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('37', 'Dănăilă', 'Mihai', '3', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('38', 'Sîrbu', 'Robert', '3', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('39', 'Dundar', 'Mehmet', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('40', 'Maftei', 'Ștefan', '3', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('41', 'Ivan', 'Bogdan', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('42', 'Gheorghe', 'Cosmina', '3', '9');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('43', 'Dobre', 'Elena', '3', '31');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('44', 'Chiriac', 'Ella', '3', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('45', 'Boeriu', 'Cosmin', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('46', 'Anghel', 'Mădălina', '4', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('47', 'Ciobanu', 'Paul', '4', '4');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('48', 'Dobrin', 'Ionuț', '4', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('49', 'Ghenea', 'Andrei', '4', '19');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('50', 'Ghercă', 'Darius', '4', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('51', 'Mirigel', 'Radu', '4', '18');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('52', 'Oprea', 'Anca', '4', '18');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('53', 'Pincu', 'Iulia', '4', '20');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('54', 'Popa', 'Daniel', '4', '39');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('55', 'Radu', 'Raluca', '4', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('56', 'Tillinger', 'Marius', '4', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('57', 'Apostol', 'Vlad', '4', '13');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('58', 'Florian', 'Luca', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('59', 'Pița', 'Bogdan', '3', '31');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('60', 'Șerba', 'Luca', '3', '10');
INSERT INTO `asmi`.`voluntari` (`id_voluntar`, `nume_voluntar`, `prenume_voluntar`, `id_dep`, `id_oras`) VALUES ('61', 'Velcea', 'Mihnea', '3', '10');

INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('1', 'Samurai', '100');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('2', 'Cine sunt eu?', '10');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('3', 'Sincronizare', '50');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('4', 'Adevărat sau fals', '20');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('5', 'Ninșah', '100');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('6', 'Paste', '10');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('7', 'Pizza Umană', '20');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('8', 'Ceasul', '100');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('9', 'Casă, Locatari, Cutremur', '50');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('10', 'Kings', '100');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('11', 'Taxi', '50');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('12', 'Cercul', '10');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('13', 'Hârtia igienică', '10');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('14', 'Mingea cu provocări', '15');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('15', 'De ce ai întârziat?', '10');
INSERT INTO `asmi`.`jocuri` (`id_joc`, `nume_joc`, `nr_participanti`) VALUES ('16', 'Găsește-ți fratele/sora', '20');

INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('1', 'Adobe', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('2', 'Google', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('3', 'Softbinator', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('4', 'Heineken', 'Băuturi');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('5', 'Muller', 'Băuturi');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('6', 'Bitdefender', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('7', 'Veridion', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('8', 'Siemens', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('9', 'Canva', 'IT');
INSERT INTO `asmi`.`sponsori` (`id_sponsor`, `nume_sponsor`, `domeniu`) VALUES ('10', 'JetBrains', 'IT');

INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('1', 'Teambuilding', '2023-08-24', '2023-08-27', '10', '4');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('2', 'Admitere', '2023-07-10', '2023-07-10', '1', '2');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('3', 'Cariere', '2023-03-13', '2023-03-15', '1', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('4', 'SmartHack', '2023-11-11', '2023-11-12', '1', '3');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('5', 'Practică', '2023-10-16', '2023-10-20', '1', '6');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('6', 'Tu cum stai cu licența?', '2023-03-27', '2023-03-31', '2', '2');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('7', 'Recrutări', '2023-10-09', '2023-10-22', '8', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('8', 'Mentorat', '2023-11-18', '2023-11-18', '1', '2');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('9', 'Artă`n Dar', '2023-12-07', '2023-12-19', '1', '5');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('10', 'MateInfoUB', '2023-04-15', '2023-04-16', '11', '7');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('11', 'UBSU', '2023-07-17', '2023-07-23', '5', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('12', 'Marea Ieșeală', '2023-09-29', '2023-09-29', '6', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('13', 'Tre` să caut', '2023-10-07', '2023-10-07', '1', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('14', 'Escape Room', '2023-12-02', '2023-12-03', '2', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('15', 'Secret Santa', '2023-12-20', '2023-12-20', '1', '5');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('16', 'Bumtzi', '2023-10-14', '2023-10-14', '2', '4');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('17', 'HobbyHub', '2023-11-30', '2023-12-01', '2', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('18', 'Prezentarea ofertelor de Master', '2023-05-08', '2023-05-12', '1', '1');
INSERT INTO `asmi`.`proiecte` (`id_proiect`, `nume_proiect`, `data_inceput`, `data_finalizare`, `id_joc`, `id_sponsor`) VALUES ('19', 'MiniTB', '2023-11-18', '2023-11-19', '11', '9');

INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('1', 'QuizNight', '3', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('2', 'TreasureHunt', '7', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('3', 'Bagaje', '12', '2');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('4', 'Sală', '25', '2');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('5', 'Mâncare', '30', '3');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('6', 'Stand', '3', '3');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('7', 'Mâncare', '8', '4');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('8', 'Zona de pauză', '37', '4');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('9', 'Tabel', '42', '5');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('10', 'Repartizare', '48', '5');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('11', 'Promovare', '15', '6');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('12', 'Prezentare', '10', '6');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('13', 'Workshop', '19', '7');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('14', 'Interviu', '29', '7');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('15', 'Mentor', '31', '8');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('16', 'Mentee', '52', '8');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('17', 'Stand', '59', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('18', 'Afișe', '60', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('19', 'Jocuri', '1', '10');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('20', 'Concurs', '2', '10');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('21', 'Mâncare', '7', '11');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('22', 'Facultate', '8', '11');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('23', 'Jocuri', '4', '12');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('24', 'Coordonare', '2', '12');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('25', 'Coordonare', '16', '13');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('26', 'Joc final', '18', '13');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('27', 'Puzzle', '24', '14');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('28', 'Tabel', '27', '14');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('29', 'Tabel', '29', '15');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('30', 'Brățări', '57', '16');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('31', 'Promovare', '43', '16');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('32', 'Tabel', '44', '17');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('33', 'Trainer', '36', '17');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('34', 'Prezentare', '45', '18');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('35', 'Jocuri', '49', '19');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('36', 'Coordonare', '54', '19');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('37', 'LerParty', '24', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('38', 'StandUp', '17', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('39', 'Teatru', '6', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('40', 'Împodobit', '6', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('41', 'Muzică', '9', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('42', 'Training', '15', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('43', 'Olimpiada', '22', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('44', 'Party', '30', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('45', 'BoardGames', '57', '9');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('46', 'Transport', '32', '1');
INSERT INTO `asmi`.`atributii` (`id¬_atributie`, `nume_atributie`, `id_voluntar`, `id_proiect`) VALUES ('47', 'Intrare', '2', '2');
