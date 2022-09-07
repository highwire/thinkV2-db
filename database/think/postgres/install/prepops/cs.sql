INSERT INTO thdb.tk_cs_m_custStatus(statusId, status)
VALUES (0, 'In-Active'),
(1, 'Active'),
(2, 'Hold');

INSERT INTO thdb.tk_cs_m_creditStatus(statusId, status)
VALUES (0, 'Black-Listed'),
(1, 'Strong'),
(2, 'Moderate'),
(3, 'Weak');

INSERT INTO thdb.tk_cs_m_custCategoryMapping(tenantId, custCatId, category, typeId)
VALUES (1, 'Advertiser', 1),
(2, 'Agent', 1),
(3, 'Contributor', 1),
(4, 'Editor', 1),
(5, 'Individual', 1),
(6, 'Institution', 2),
(7, 'Members', 2),
(8, 'Society', 2),
(9, 'Student', 1),
(10, 'Agency', 3);

INSERT INTO thdb.tk_cs_m_addressTypes(addrTypeId, type)
VALUES (1, 'Primary'),
(2, 'Billing'),
(3, 'Shipping');

COMMIT;
