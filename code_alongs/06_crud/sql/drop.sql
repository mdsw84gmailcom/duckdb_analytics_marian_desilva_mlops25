-- throws away a table
DROP table database.sql;

-- gives dependency error because the schema is not empty
DROP SCHEMA programming;

-- to delete this schema and all its content
DROP SCHEMA programming CASCADE;