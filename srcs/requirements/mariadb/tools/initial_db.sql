-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS jsebastidb;

-- Crear el usuario y asignarle una contraseña
CREATE USER 'jsebasti'@'%' IDENTIFIED BY 'jsebasti123';

-- Otorgar todos los privilegios al usuario en la base de datos
GRANT ALL PRIVILEGES ON jsebastidb.* TO 'jsebasti'@'%' WITH GRANT OPTION;

-- Actualizar los privilegios
FLUSH PRIVILEGES;

-- Cambiar la contraseña del usuario root
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root1234');