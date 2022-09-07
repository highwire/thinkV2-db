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

CREATE TABLE IF NOT EXISTS thdb.tk_cs_m_addressTypes
(
	addrTypeId	   SMALLINT		   PRIMARY KEY,
	type		   VARCHAR(16)	   NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL	   
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_custCategoryMapping
(
	tenantId	   SMALLINT          NOT NULL,
	custCatId	   SMALLINT  	   NOT NULL,
	category	   VARCHAR(16)	   NOT NULL,
	typeId	   SMALLINT		   NOT NULL,	-- 1-Individual, 2-Non-Individual, 3-Agency
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL,
	PRIMARY KEY    (tenantId, custCatId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_customers
(
	tenantId	   SMALLINT		   NOT NULL,
	customerId	   SERIEL		   NOT NULL,
	custCatId	   SMALLINT		   NOT NULL,
	typeId	   SMALLINT          NOT NULL,
	PRIMARY KEY    (tenantId, customerId, custCatId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_customerIndividual
(
	customerId	   INTEGER		   PRIMARY KEY,
	salutation	   VARCHAR(5)	   NOT NULL,
	firstName	   VARCHAR(32)	   NOT NULL,
	middleName	   VARCHAR(32)	   ,
	lastName	   VARCHAR(32)	   ,
	suffix	   VARCAHR(32)	   ,
	companyName	   VARCHAR(128)	   NOT NULL,
	department	   VARCHAR(128)	   ,
	primaryEmail   VARCHAR(128)	   NOT NULL,
	secondaryEmail VARCHAR(128)	   ,
	countryCode	   VARCHAR(8)	   NOT NULL,
	phone		   VARCHAR(15)	   NOT NULL,
	mobile	   VARCHAR(15)	   NOT NULL,
	custStatus	   SMALLINT		   DEFAULT 0 NOT NULL,
	custSince	   INTEGER		   DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	creditStatus   INTEGER		   DEFAULT 1 NOT NULL,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_customerNonIndividual
(
	customerId	   INTEGER		   PRIMARY KEY,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_customerAgency
(
	customerId	   INTEGER		   PRIMARY KEY,
	recStatus	   SMALLINT		   DEFAULT 1 NOT NULL,
	modifiedBy     VARCHAR(32)       NOT NULL,
      modifiedOn     INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_cs_t_custAddresses
(
	tenantId	   SMALLINT   	   NOT NULL,
	customerId	   INTEGER		   NOT NULL,
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