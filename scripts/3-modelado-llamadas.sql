USE ODS;

DROP TABLE IF EXISTS ODS_HC_LLAMADAS;
CREATE TABLE ODS_HC_LLAMADAS (
	ID_CONTACTO INT(11) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    STG_ID_CONTACTO INT(11),
	TELEFONO BIGINT(20),
    FC_COMIENZO DATETIME,
    FC_FIN DATETIME,
	ID_SERVICIO INT(3) UNSIGNED,
    TRANSFERIDO BOOLEAN,
    ID_AGENTE INT(3) UNSIGNED,
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

DROP TABLE IF EXISTS ODS_DM_SERVICIOS;
CREATE TABLE ODS_DM_SERVICIOS (
	ID_SERVICIO INT(3) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DE_SERVICIO VARCHAR(512),
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

DROP TABLE IF EXISTS ODS_DM_AGENTES;
CREATE TABLE ODS_DM_AGENTES (
	ID_AGENTE INT(3) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DE_AGENTE VARCHAR(512),
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

ALTER TABLE ODS_HC_LLAMADAS ADD INDEX lla_tel_idx (TELEFONO ASC);
ALTER TABLE ODS_HC_CLIENTES ADD INDEX cli_tel_idx (TELEFONO_CLIENTE ASC);

ALTER TABLE ODS_HC_LLAMADAS ADD INDEX fk_lla_ser_idx (ID_SERVICIO ASC);
ALTER TABLE ODS_HC_LLAMADAS ADD CONSTRAINT fk_lla_ser FOREIGN KEY (ID_SERVICIO)
     REFERENCES ODS_DM_SERVICIOS(ID_SERVICIO);

ALTER TABLE ODS_HC_LLAMADAS ADD INDEX fk_lla_age_idx (ID_AGENTE ASC);
ALTER TABLE ODS_HC_LLAMADAS ADD CONSTRAINT fk_lla_age FOREIGN KEY (ID_AGENTE)
     REFERENCES ODS_DM_AGENTES(ID_AGENTE);
