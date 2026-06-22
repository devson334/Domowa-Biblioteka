-- 1. Tabele pomocnicze
CREATE TABLE Autorzy (
    id_autora INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL
);

CREATE TABLE Gatunki (
    id_gatunku INT PRIMARY KEY AUTO_INCREMENT,
    nazwa_gatunku VARCHAR(50) NOT NULL
);

-- 2. Tabela Czytelnicy
CREATE TABLE Czytelnicy (
    id_czytelnika INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- 3. Tabela Książki
CREATE TABLE Ksiazki (
    id_ksiazki INT PRIMARY KEY AUTO_INCREMENT,
    tytul VARCHAR(100) NOT NULL,
    rok_wydania INT,
    id_autora INT,
    id_gatunku INT,
    FOREIGN KEY (id_autora) REFERENCES Autorzy(id_autora),
    FOREIGN KEY (id_gatunku) REFERENCES Gatunki(id_gatunku)
);

-- 4. Tabela Wypożyczenia
CREATE TABLE Wypozyczenia (
    id_wypozyczenia INT PRIMARY KEY AUTO_INCREMENT,
    id_ksiazki INT,
    id_czytelnika INT,
    data_wypozyczenia DATE NOT NULL,
    data_zwrotu DATE,
    FOREIGN KEY (id_ksiazki) REFERENCES Ksiazki(id_ksiazki),
    FOREIGN KEY (id_czytelnika) REFERENCES Czytelnicy(id_czytelnika)
);

-- PRZYKŁADOWE DANE 
INSERT INTO Autorzy (imie, nazwisko) VALUES ('Adam', 'Mickiewicz'), ('J.K.', 'Rowling');
INSERT INTO Gatunki (nazwa_gatunku) VALUES ('Poemat epicki'), ('Fantasy');
INSERT INTO Czytelnicy (imie, nazwisko, email) VALUES ('Jan', 'Kowalski', 'jan@example.com');

INSERT INTO Ksiazki (tytul, rok_wydania, id_autora, id_gatunku) 
VALUES ('Pan Tadeusz', 1834, 1, 1), ('Harry Potter', 1997, 2, 2);

INSERT INTO Wypozyczenia (id_ksiazki, id_czytelnika, data_wypozyczenia, data_zwrotu) 
VALUES (1, 1, '2026-06-20', NULL);
