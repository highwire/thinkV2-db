CREATE TABLE IF NOT EXISTS thdb.tk_setup_m_subsType
(
	subTypeId		SMALLINT		PRIMARY KEY,
	type			VARCHAR(32)		NOT NULL,
	recStatus		SMALLINT		DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_setup_m_contentType
(
	contTypeId		SMALLINT		PRIMARY KEY,
	type			VARCHAR(16)		NOT NULL,
	recStatus		SMALLINT		DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_setup_m_contentCategory
(
	contCatId		SMALLINT		PRIMARY KEY,
	category		VARCHAR(16)		NOT NULL,
	recStatus		SMALLINT		DEFAULT 1 NOT NULL
);

CREATE TABLE IF NOT EXISTS thdb.tk_setup_m_orderType
(
	orderTypeId		SMALLINT		PRIMARY KEY,
	type			VARCHAR(16)		NOT NULL,
	recStatus		SMALLINT		DEFAULT 1 NOT NULL
);