-- 001: datele per jucator ale sistemelor noi (PlayerSystemData).
-- Fiecare sistem are un blob Protobuf per jucator. Schimbarile de format ale unui sistem
-- nu cer migrari noi: Protobuf citeste si versiunile vechi.
-- Se ruleaza o singura data, ca root:  mariadb -u root -p < 001_player_system_data.sql

USE player;

CREATE TABLE IF NOT EXISTS player_system_data
(
	pid        INT UNSIGNED      NOT NULL,
	system_id  SMALLINT UNSIGNED NOT NULL,
	data       MEDIUMBLOB        NOT NULL,
	updated_at TIMESTAMP         NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (pid, system_id)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
