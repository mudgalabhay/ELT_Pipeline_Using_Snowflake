--create accounts
--accountadmin is super-user for snowflake
use role accountadmin; 

-- create warehouse, database, role
create warehouse dbt_warehouse with warehouse_size='x-small';
create database if not exists dbt_db;
create role if not exists dbt_role;

show grants on warehouse dbt_warehouse;

show warehouses;

-- Grant usage access to dbt_role on our warehouse
grant usage on warehouse dbt_warehouse to role dbt_role;   

-- Grant role to our user[your snowfalke username]
grant role dbt_role to user mudgalabhay;

-- Making sure that role has access to db we created
grant all on database dbt_db to role dbt_role;

-- Switch to dbt_role from admin role
use role dbt_role;

-- create schemaDBT_DB.DBT_SCHEMA.STG_TPCH_ORDERS
create schema dbt_db.dbt_schema;

-- Drop DWH later just so we don't incur cost
use role accountadmin;
drop warehouse if exists dbt_datawarehouse;
drop database if exists dbt_db;
drop role if exists dbt_role;