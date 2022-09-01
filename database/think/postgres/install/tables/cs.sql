CREATE TABLE IF NOT EXISTS thdb.tk_cs_m_custStatus
(
	statusId	   SMALLINT 	   PRIMARY KEY,
	status	   VARCHAR(16)	   NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_m_creditStatus
(
	statusId	   SMALLINT		   PRIMARY KEY,
	status	   VARCHAR(16)	   NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_m_custCategory
(
	custCatId	   SMALLINT  	   PRIMARY KEY,
	category	   VARCHAR(16)	   NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_m_addressTypes
(
	addrTypeId	   SMALLINT		   PRIMARY KEY,
	type		   VARCHAR(16)	   NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL	   
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_customers
(
	tenantId	   SMALLINT  	   NOT NULL,
	custId	   SERIAL		   NOT NULL,
	categoryId     SMALLINT		   NOT NULL,
	salutation	   VARCHAR(5)	   NOT NULL,
	firstName	   VARCHAR(32)	   ,
	middleName	   VARCHAR(32)	   ,
	lastName	   VARCHAR(32)	   ,
	compName	   VARCHAR(128)	   NOT NULL,
	department	   VARCHAR(128)	   ,
	email		   VARCHAR(128)	   NOT NULL,
	countryCode	   VARCHAR(8)	   NOT NULL,
	phone		   VARCHAR(15)	   NOT NULL,
	mobile	   VARCHAR(15)	   NOT NULL,
	custStatus	   SMALLINT		   DEFAULT 0 NOT NULL,
	custSince	   INTEGER		   DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	creditStatus   INTEGER		   DEFAULT 1 NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	   (tId, custId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_custAddresses
(
	tenantId	   SMALLINT   	   NOT NULL,
	custId	   INTEGER		   NOT NULL,
	addrId	   SERIAL    	   NOT NULL,
	isPrimary	   BOOLEAN		   NOT NULL,
	addrTypeId	   SMALLINT		   NOT NULL, 
	addrName	   VARCHAR(64)	   NOT NULL,
	addrLine1	   VARCHAR(64)	   NOT NULL,
	addrLine2	   VARCHAR(64)	   ,
	addrcity	   VARCHAR(64)	   NOT NULL,
	addrstate	   VARCHAR(64)	   NOT NULL,
	addrZipCode	   VARCHAR(9)	   NOT NULL,
	addrCountry	   VARCHAR(32)	   NOT NULL,
	addrCC	   VARCHAR(8)	   ,
	addrPhone	   VARCHAR(15)	   ,
	validId	   INTEGER		   NOT NULL,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	   (tId, custId, addrId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_custAddrValidity
(
	addrId	   INTEGER		   NOT NULL,
	validId	   SERIAL		   NOT NULL,
	contactPerson  VARCHAR(64)	   ,
	validFrom	   INTEGER		   NOT NULL,
	validTo	   INTEGER		   NOT NULL,
	frequency	   BOOLEAN		   DEFAULT FALSE NOT NULL,
	startRange	   INTEGER		   ,
      endRange	   INTEGER		   ,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	   (addrId, validId)
);

COMMIT;