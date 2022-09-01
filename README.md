# thinkV2-db Container  
THINK Web V2 Database Schema

This Code base describes about the Database Schema for all the modules of THINK Web V2.

Tables are segregated into 3 segments –

1.	Master Tables – These tables hold the data which is minimally changed over a period of time. These tables are used mainly to provide dynamicity to system. E.g., adding to product type or subscription type on the fly, etc.
2.	Transaction Tables – These tables hold the transaction data, which is frequently changed/ updated or deleted. For example, orders, customers list etc.
3.	Reports Tables – These tables hold the reporting data to be shown through reports/ tables, etc. Data is transposed from Transactional tables and updated in Reports Tables. For example, number of specific type of orders in a day, month, year, etc. These tables act as intermediate tables between transactional tables and Reports.

# Table Naming Convension

Naming convention of THINK Web 2.0 tables –

<Product Abbreviation>_<Module Abbreviation>_<Master/Transactional/Report>_<Table Name>

For example – Table name “tk_cs_m_custStatus” is read as -
tk – THINK
cs – Customer Service
m – Master
custStatus – Customer Status table

