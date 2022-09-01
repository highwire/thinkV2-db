CREATE TABLE IF NOT EXISTS thdb.tk_inv_m_productCategory
(
	prodCatId	  SMALLINT		  PRIMARY KEY,
	category	  VARCHAR(16)	  NOT NULL,
	recStatus	  SMALLINT		  DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_m_invTransferStatus
(
	tStatusId	  SMALLINT  	  PRIMARY KEY,
	status	  VARCHAR(16)	  NOT NULL,
	recStatus	  SMALLINT		  DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_vendors
(
	tenantId      SMALLINT		  NOT NULL,
	vendorId	  SERIAL		  NOT NULL,
	vendorCode	  VARCHAR(15)	  NOT NULL,
	company	  VARCHAR(80)	  ,
	address1	  VARCHAR(64)	  NOT NULL,
	address2	  VARCHAR(64)	  ,
	address3	  VARCHAR(64)	  ,
	city		  VARCHAR(32)	  NOT NULL,
	state		  VARCHAR(32)	  ,
	zipcode	  VARCHAR(8)	  NOT NULL,
	country	  VARCHAR(32)	  NOT NULL,
	email		  VARCHAR(64)	  ,
	phone  	  VARCHAR(15)	  ,
	fax		  VARCHAR(15)	  ,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	  (tenantId, vendorId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_vendorContacts
(
	vendorId	  INTEGER		  PRIMARY KEY,
	salutation	  VARCHAR(5)	  NOT NULL,
	firstName	  VARCHAR(32)	  NOT NULL,
	lastName	  VARCHAR(32)	  NOT NULL,
	email  	  VARCHAR(64)	  ,
	mobile	  VARCHAR(15)	  NOT NULL,
	recStatus     SMALLINT          DEFAULT 1 NOT NULL,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_inventory
(
	tenantId	  SMALLINT		  NOT NULL,
	inventoryId	  SERIAL		  NOT NULL,
	locationId	  INTEGER		  NOT NULL,
	areaId	  INTEGER		  ,
	quantity	  INTEGER		  NOT NULL,
	vCode		  VARCHAR(15)	  ,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL
	PRIMARY KEY   (tenantId, inventoryId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_inventoryLocations
(
	tenantId	  SMALLINT		  NOT NULL,
	locationId	  SERIAL		  NOT NULL,
	locName	  VARCHAR(32)	  NOT NULL,
	address1	  VARCHAR(32)	  NOT NULL,
	address2	  VARCHAR(32)	  ,
	city		  VARCHAR(32)	  NOT NULL,
	state		  VARCHAR(32)	  ,
	zipcode	  VARCHAR(8)	  NOT NULL,
	country	  VARCHAR(32)	  NOT NULL,
	recStatus     SMALLINT          DEFAULT 1 NOT NULL,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	  (tenantId, locationId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_inventoryAreas
(
	tenantId	  SMALLINT		  NOT NULL,
	locationId	  INTEGER		  NOT NULL,
	areaId        SERIAL		  NOT NULL,
	slot		  VARCHAR(32)	  NOT NULL,
	bin		  VARCHAR(32)	  ,
	recStatus     SMALLINT          DEFAULT 1 NOT NULL,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	  (tenantId, locationId, areaId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_inv_t_inventoryTransfers
(
	tenantId      SMALLINT		  NOT NULL,
	transId	  SERIAL		  NOT NULL,
	inventoryId	  INTEGER		  NOT NULL,
	fromLId	  INTEGER		  NOT NULL,
	toLId		  INTEGER		  NOT NULL,
	fromAId	  INTEGER		  ,
	toAId		  INTEGER		  ,
	modifiedBy    VARCHAR(32)       NOT NULL,
      modifiedOn    INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	  (tenantId, transId)
);

COMMIT;