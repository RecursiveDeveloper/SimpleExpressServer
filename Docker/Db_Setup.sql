CREATE DATABASE IF NOT EXISTS nodedb;
USE nodedb;

DELIMITER @@

DROP PROCEDURE IF EXISTS create_table_populate;
CREATE PROCEDURE IF NOT EXISTS create_table_populate()
BEGIN
    CREATE TABLE IF NOT EXISTS carta (
        manager_id varchar(45) NOT NULL,
        first_name varchar(45) NOT NULL,
        last_name varchar(45) NOT NULL,
        last_update date NOT NULL,
        PRIMARY KEY (manager_id)
    );

    INSERT INTO carta
        (manager_id, first_name, last_name, last_update)
    VALUES
        (08276,'Brad','Craven',"1976-11-29"),
        (19222,'Kraig','Boucher',"1990-10-10"),
        (23003,'Enrique','Sizemore',"1990-5-26"),
        (80460,'Letha','Wahl',"1971-3-9"),
        (86849,'Harlan','Ludwig',"1997-1-11");
END @@

DELIMITER ; 

CALL create_table_populate;
