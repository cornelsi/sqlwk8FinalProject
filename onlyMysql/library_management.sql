CREATE DATABASE library_managementdb;

USE library_managementdb;

-- Members Table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    PublishedYear YEAR,
    AvailableCopies INT NOT NULL CHECK (AvailableCopies >= 0)
);

-- BookAuthors Table (Many-to-Many between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Borrowings Table (Many-to-Many between Members and Books)
CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT,
    BookID INT,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Sample Data Insertion

-- Members
INSERT INTO Members (FullName, Email, JoinDate) VALUES
('Wanjiku Mwangi', 'wanjiku@example.com', '2024-01-10'),
('Otieno Ouma', 'otieno@example.com', '2024-02-12'),
('Achieng Aoko', 'achieng@example.com', '2024-03-18'),
('Kamau Njoroge', 'kamau@example.com', '2024-04-05');

-- Authors
INSERT INTO Authors (FullName) VALUES
('Ngũgĩ wa Thiong\'o'),
('Meja Mwangi'),
('Margaret Ogola'),
('Yvonne Adhiambo Owuor');

-- Books
INSERT INTO Books (Title, ISBN, PublishedYear, AvailableCopies) VALUES
('The River Between', '9780141187034', 1965, 4),
('Going Down River Road', '9789966465120', 1976, 5),
('The River and the Source', '9789966498012', 1994, 3),
('Dust', '9780307378860', 2013, 2);

-- BookAuthors
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Borrowings
INSERT INTO Borrowings (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2025-01-10', NULL),
(2, 2, '2025-01-15', '2025-01-25'),
(3, 3, '2025-02-01', NULL),
(4, 4, '2025-02-10', NULL);
