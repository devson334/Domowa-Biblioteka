--Tabela Autorzy.
CREATE TABLE Autorzy (
    id_autora INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50),
    nazwisko VARCHAR(50)
);

--Tabela Książki.
CREATE TABLE Ksiazki (
    id_ksiazki INT PRIMARY KEY AUTO_INCREMENT,
    tytul VARCHAR(100),
    rok_wydania INT,
    id_autora INT,
    FOREIGN KEY (id_autora) REFERENCES Autorzy(id_autora)
);

--Dodanie autora.
INSERT INTO Autorzy (imie, nazwisko) VALUES ('Adam', 'Mickiewicz');

--Dodanie książki która jest powiązana z autorem.
INSERT INTO Ksiazki (tytul, rok_wydania, id_autora) VALUES ('Pan Tadeusz', 1834, 1);
