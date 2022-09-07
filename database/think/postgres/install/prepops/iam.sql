INSERT INTO thdb.tk_iam_m_tenantStatus (tStatusId, status)
VALUES (0, 'Inactive'),
(1, 'Trial'),
(2, 'Ready'),
(3, 'Active'),
(4, 'Hold');

INSERT INTO thdb.tk_iam_m_userStatus (uStatusId, status)
VALUES (0, 'InActive'),
(1, 'Active');

INSERT INTO thdb.tk_iam_m_currencies (currencyId, currName, code, symbol)
VALUES (1, 'Leke', 'ALL', 'Lek'),
(2, 'Dollars', 'USD', '$'),
(3, 'Afghanis', 'AFN', '؋'),
(4,  'Pesos', 'ARS', '$'),
(5, 'Guilders', 'AWG', 'ƒ'),
(6, 'Dollars', 'AUD', '$'),
(7, 'New Manats', 'AZN', 'ман'),
(8, 'Dollars', 'BSD', '$'),
(9, 'Dollars', 'BBD', '$');

INSERT INTO thdb.tk_iam_m_dateFormats (dateFormId, orderStyle, yearFormat, monthFormat, dayFormat, separator)
VALUES (1, 'YMD', 'yyyy', 'mm', 'dd', '-'),
(2, 'YMD', 'yyyy', 'mm', 'dd', '.'),
(3, 'YMD', 'yyyy', 'mm', 'dd', '/'),
(4, 'YMD', 'yyyy', 'mmmm', 'dd', ' '),
(5, 'DMY', 'yyyy', 'mm', 'dd', '-'),
(6, 'DMY', 'yyyy', 'mm', 'dd', '.'),
(7, 'DMY', 'yyyy', 'mm', 'dd', '/'),
(8, 'DMY', 'yyyy', 'mmmm', 'dd', ' '),
(9, 'MDY', 'yyyy', 'mm', 'dd', '/'),
(10, 'MDY', 'yyyy', 'mmmm', 'dd', ',');

INSERT INTO thdb.tk_iam_m_timezones (timeZoneId, move, dOffset, dst)
VALUES (1, 43, '14:00', FALSE),
(2, 43, '13:00', FALSE);

INSERT INTO thdb.tk_iam_m_systemRoles (sysRoleId, name, authString)
VALUES (1, 'System Administrator', '111111111'),
(2, 'System Reporting Executive', '001011101');

INSERT INTO thdb.tk_iam_m_systemUsers (userId, username, password, firstName, lastName, sysRoleId)
VALUES (1, 'admin', 'e6e061838856bf47e1de730719fb2609', 'THINK', 'Administrator', 1);

INSERT INTO thdb.tk_iam_m_configGroups (confGrpId, name)
VALUES (1, 'Core'),
(2, 'Alerts'),
(3, 'EOD');

COMMIT;