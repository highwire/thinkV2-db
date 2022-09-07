CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_tenantStatus
(
      tStatusId       SMALLINT          PRIMARY KEY,
      status          VARCHAR(16)       NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_userStatus
(
	uStatusId	    SMALLINT	    PRIMARY KEY,
	status	    VARCHAR(16)	    NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_currencies
(
      currencyId      SMALLINT          PRIMARY KEY,
      currName        VARCHAR(20)       NOT NULL,
	code		    VARCHAR(3)	    NOT NULL,
      symbol          VARCHAR(5)        NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_dateFormats
(
      dateFormId      SMALLINT          PRIMARY KEY,
      orderStyle      VARCHAR(3)        NOT NULL,
      yearFormat      VARCHAR(4)        DEFAULT 'yyyy' NOT NULL,
      monthFormat     VARCHAR(4)        DEFAULT 'mmm' NOT NULL,
      dayFormat       VARCHAR(4)        DEFAULT 'dd' NOT NULL,
	separator	    VARCHAR(1)	    NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_timezones
(
      timeZoneId      SMALLINT          PRIMARY KEY,
      move            SMALLINT          DEFAULT 241 NOT NULL,
      dOffset          VARCHAR(5)        DEFAULT '00:00' NOT NULL,
      dst             BOOLEAN           DEFAULT FALSE NOT NULL,
	 recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_systemRoles
(
	sysRoleId       SMALLINT	    PRIMARY KEY,
	name		    VARCHAR(32)	    NOT NULL,
	authString      VARCHAR(32)       NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_systemUsers
(
	userId          SMALLINT   	    PRIMARY KEY,
	username        VARCHAR(64)       NOT NULL,
      password        VARCHAR(128)      NOT NULL,
	firstName	    VARCHAR(32)	    NOT NULL,
	middleName	    VARCHAR(32)	    ,
	lastName	    VARCHAR(32)	    NOT NULL,	
	sysRoleId       SMALLINT	    NOT NULL,
	department      VARCHAR(32)       ,
      mobile          VARCHAR(15)       ,
	salt		    SMALLINT	    ,
      sessiontoken    VARCHAR(512)      ,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_m_configGroups
(
	confGrpId	    SMALLINT	    PRIMARY KEY,
	name		    VARCHAR(32)	    NOT NULL,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_tenants
(
      tenantId        SMALLSERIAL       PRIMARY KEY,
      businessName    VARCHAR(255)      NOT NULL,
      abbreviation    VARCHAR(5)        NOT NULL,
      address1        VARCHAR(255)      NOT NULL,
      address2        VARCHAR(255)      ,
      city            VARCHAR(32)       NOT NULL,
      zipcode         VARCHAR(8)        NOT NULL,
      country         VARCHAR(32)       NOT NULL,
	primaryPhone    VARCHAR(15)	    NOT NULL,
	secondaryPhone  VARCHAR(15)	    ,
	email		    VARCHAR(32)	    NOT NULL,
	website	    VARCHAR(32)	    ,
	iconUrl	    VARCHAR(128)	    ,
	licFileUrl	    VARCHAR(128)      ,
      currencyId      SMALLINT          NOT NULL,
      timeZoneId      SMALLINT          NOT NULL,
      dateFormId      SMALLINT          NOT NULL,
	numOfUsers	    SMALLINT	    NOT NULL,
	orderCap	    SMALLINT	    NOT NULL,
	authString	    VARCHAR(32)       NOT NULL,
	validFrom	    INTEGER		    NOT NULL,
	validTo	    INTEGER		    NOT NULL,
      tenantStatus    SMALLINT          DEFAULT 0 NOT NULL,
      modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL	
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_tenantDomains
(
	tenantId	    SMALLINT          NOT NULL,
	domainId	    SMALLINT	    NOT NULL,
      domain          VARCHAR(32)       NOT NULL,
      modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	    (tenantId, domainId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_tenantContacts
(
	tenantId	    SMALLINT	    NOT NULL,
	contactId	    SERIAL		    NOT NULL,
	name		    VARCHAR(32)	    NOT NULL,
	department	    VARCHAR(32)	    ,
	mobile	    VARCHAR(15)	    NOT NULL,
	email		    VARCHAR(32)	    ,
	isPrimary	    BOOLEAN		    ,
	recStatus	    SMALLINT	    DEFAULT 1 NOT NULL,
	modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY     (tenantId, contactId)
); 

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_tenantRoles
(
	tenantId        SMALLINT          NOT NULL,
      roleId          SMALLINT          NOT NULL,
      name            VARCHAR(32)       NOT NULL,
      authString      VARCHAR(32)       NOT NULL,
	recStatus       SMALLINT          DEFAULT 1 NOT NULL,
      modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	    (tenantId, roleId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_tenantUsers
(
	tenantId  	    SMALLINT          NOT NULL,
      userId          SERIAL            NOT NULL,
      username        VARCHAR(64)       NOT NULL,
      password        VARCHAR(64)       NOT NULL,
	firstName	    VARCHAR(32)	    NOT NULL,
	middleName      VARCHAR(32)       ,
	lastName        VARCHAR(32)       NOT NULL,
	roleId          SMALLINT          NOT NULL,
      mobile          VARCHAR(15)       ,
      sessiontoken    VARCHAR(512)      ,
      modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY	    (tenantId, userId)
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_passwdHistory
(
      userId          INTEGER           NOT NULL,
      password        VARCHAR(64)       NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_iam_t_configurations
(
      tenantId        SMALLINT          NOT NULL,
	configKey	    VARCHAR(64)       NOT NULL,
      groupId         SMALLINT          NOT NULL,
      paramType       VARCHAR(1)        DEFAULT 'S' NOT NULL,
      value           VARCHAR(32)       NOT NULL,
      modifiedBy      VARCHAR(32)       NOT NULL,
      modifiedOn      INTEGER           DEFAULT DATE_PART('epoch', NOW()) NOT NULL,
	PRIMARY KEY     (tenantId, configKey)
);

COMMIT;