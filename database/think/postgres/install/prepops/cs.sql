INSERT INTO thdb.tk_cs_m_custStatus(statusId, status)
VALUES (0, 'In-Active'),
(1, 'Active'),
(2, 'Hold');

INSERT INTO thdb.tk_cs_m_creditStatus(statusId, status)
VALUES (0, 'Black-Listed'),
(1, 'Strong'),
(2, 'Moderate'),
(3, 'Weak');

INSERT INTO thdb.tk_cs_m_addressTypes(addrTypeId, type)
VALUES (1, 'Primary'),
(2, 'Billing'),
(3, 'Shipping');

COMMIT;
