INSERT INTO thdb.tk_setup_m_subsType(subTypeId, type)
VALUES (1, 'Issue-Based'),
(2, 'Data-Based'),
(3, 'Unit-Based'),
(4, 'Data-Based-With-Issue'),
(5, 'Data-Based-With-Unit');

INSERT INTO thdb.tk_setup_m_contentType(contTypeId, type)
VALUES (1, 'Books'),
(2, 'Periodicals'),
(3, 'Journals');

INSERT INTO thdb.tk_setup_m_contentCategory(contCatId, category)
VALUES (1, 'Print Media'),
(2, 'Electronic Media');

INSERT INTO thdb.tk_setup_m_orderType(orderTypeId, type)
VALUES (1, 'Subscription'),
(2, 'Single Copy'),
(3, 'Product'),
(4, 'Electronic Document'),
(5, 'Basic Package'),
(6, 'AdHoc Package'),
(7, 'Pooled Package'),
(8, 'Quick Order'),
(9, 'Catalog Order');

COMMIT;