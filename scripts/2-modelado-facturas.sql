USE ODS;

DROP TABLE IF EXISTS ODS_HC_FACTURAS;
CREATE TABLE ODS_HC_FACTURAS (
	ID_FACTURA INT(11) NOT NULL PRIMARY KEY,
	ID_CLIENTE INT(11),
    FC_COMIENZO DATETIME,
    FC_FIN DATETIME,
    FC_ESTABLECIMIENTO DATETIME,
    FC_PAGO DATETIME,
    ID_CICLO_FACTURACION INT(3) UNSIGNED,
    IMPORTE DECIMAL(11,2),
    ID_METODO_PAGO INT(3) UNSIGNED,
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

DROP TABLE IF EXISTS ODS_DM_CICLO_FACTURACION;
CREATE TABLE ODS_DM_CICLO_FACTURACION (
	ID_CICLO_FACTURACION INT(3) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DE_CICLO_FACTURACION VARCHAR(512),
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

DROP TABLE IF EXISTS ODS_DM_METODO_PAGO;
CREATE TABLE ODS_DM_METODO_PAGO (
	ID_METODO_PAGO INT(3) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
    DE_METODO_PAGO VARCHAR(512),
    FC_INSERT DATETIME,
    FC_MODIF DATETIME
);

ALTER TABLE ODS_HC_FACTURAS ADD INDEX fk_fac_cli_idx (ID_CLIENTE ASC);
ALTER TABLE ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_cli FOREIGN KEY (ID_CLIENTE)
     REFERENCES ODS_HC_CLIENTES(ID_CLIENTE);

ALTER TABLE ODS_HC_FACTURAS ADD INDEX fk_fac_cic_idx (ID_CICLO_FACTURACION ASC);
ALTER TABLE ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_cic FOREIGN KEY (ID_CICLO_FACTURACION)
     REFERENCES ODS_DM_CICLO_FACTURACION(ID_CICLO_FACTURACION);

ALTER TABLE ODS_HC_FACTURAS ADD INDEX fk_fac_met_idx (ID_METODO_PAGO ASC);
ALTER TABLE ODS_HC_FACTURAS ADD CONSTRAINT fk_fac_met FOREIGN KEY (ID_METODO_PAGO)
     REFERENCES ODS_DM_METODO_PAGO(ID_METODO_PAGO);

