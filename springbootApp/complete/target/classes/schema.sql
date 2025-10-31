-- Xóa bảng cũ nếu tồn tại (phải tắt kiểm tra khóa ngoại trước)
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Showtime;
DROP TABLE IF EXISTS Seat;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Customer;
SET FOREIGN_KEY_CHECKS = 1;

-- Bảng Customer
CREATE TABLE Customer (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phoneNumber VARCHAR(20)
);

-- Bảng Movie
CREATE TABLE Movie (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    title VARCHAR(200),
    showTime VARCHAR(100),
    dateTime VARCHAR(100),
    duration INT,
    genre VARCHAR(50),
    age INT
);

-- Bảng Room
CREATE TABLE Room (
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    totalSeats INT
);

-- Bảng Seat
CREATE TABLE Seat (
    id VARCHAR(50) PRIMARY KEY,
    roomId VARCHAR(50),
    seatNumber VARCHAR(20),
    FOREIGN KEY (roomId) REFERENCES Room(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Bảng Showtime
CREATE TABLE Showtime (
    id VARCHAR(50) PRIMARY KEY,
    movieId VARCHAR(50),
    roomId VARCHAR(50),
    startTime DATETIME,
    FOREIGN KEY (movieId) REFERENCES Movie(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (roomId) REFERENCES Room(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Bảng Ticket
CREATE TABLE Ticket (
    id VARCHAR(50) PRIMARY KEY,
    showtimeId VARCHAR(50),
    seatId VARCHAR(50),
    customerId VARCHAR(50),
    price DOUBLE,
    FOREIGN KEY (showtimeId) REFERENCES Showtime(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (seatId) REFERENCES Seat(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (customerId) REFERENCES Customer(id)
        ON DELETE CASCADE ON UPDATE CASCADE
);