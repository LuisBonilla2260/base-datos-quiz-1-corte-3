-- 10 Consultas Básicas

-- 1. Lista de todas las personas en la base de datos con su nombre y correo electrónico
SELECT first_name, last_name, email 
FROM person;

-- 2. Obtener los nombres de usuario de todos los usuarios activos
SELECT username 
FROM user 
WHERE state = 1;

-- 3. Mostrar todos los roles con su código y descripción
SELECT code, description 
FROM role;

-- 4. Lista de módulos con sus nombres y rutas
SELECT name, path 
FROM module;

-- 5. Contar el total de usuarios en la base de datos
SELECT COUNT(*) AS total_users 
FROM user;

-- 6. Obtener el número de vistas disponibles en el sistema
SELECT COUNT(*) AS total_views 
FROM view;

-- 7. Listar todas las vistas que están activas (state = 1)
SELECT name, path 
FROM view 
WHERE state = 1;

-- 8. Verificar los roles asignados a un usuario específico por su username
SELECT r.name 
FROM user u
JOIN user_role ur ON u.id = ur.user_id
JOIN role r ON ur.role_id = r.id
WHERE u.username = 'johndoe';

-- 9. Obtener los nombres de todos los módulos asociados a un rol específico
SELECT m.name 
FROM role r
JOIN role_module rm ON r.id = rm.role_id
JOIN module m ON rm.module_id = m.id
WHERE r.code = 'ADMIN';

-- 10. Verificar si una vista específica pertenece a un módulo determinado
SELECT v.name 
FROM module m
JOIN module_view mv ON m.id = mv.module_id
JOIN view v ON mv.view_id = v.id
WHERE m.name = 'User Management' AND v.name = 'User List';

-- 5 Consultas Complejas

-- 1. Obtener el nombre completo y el rol de cada usuario junto con el nombre del módulo al que tienen acceso
SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name, r.name AS role_name, m.name AS module_name
FROM person p
JOIN user u ON p.id = u.person_id
JOIN user_role ur ON u.id = ur.user_id
JOIN role r ON ur.role_id = r.id
JOIN role_module rm ON r.id = rm.role_id
JOIN module m ON rm.module_id = m.id;

-- 2. Mostrar el nombre completo y las vistas disponibles para un usuario específico con base en su username
SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name, v.name AS view_name
FROM user u
JOIN person p ON u.person_id = p.id
JOIN user_role ur ON u.id = ur.user_id
JOIN role r ON ur.role_id = r.id
JOIN role_module rm ON r.id = rm.role_id
JOIN module m ON rm.module_id = m.id
JOIN module_view mv ON m.id = mv.module_id
JOIN view v ON mv.view_id = v.id
WHERE u.username = 'johndoe';

-- 3. Contar el número total de usuarios por cada rol en el sistema
SELECT r.name AS role_name, COUNT(u.id) AS total_users
FROM role r
LEFT JOIN user_role ur ON r.id = ur.role_id
LEFT JOIN user u ON ur.user_id = u.id
GROUP BY r.name;

-- 4. Listar todos los módulos y, para cada módulo, las vistas que están asignadas, incluyendo los nombres de los roles que pueden acceder a ellas
SELECT m.name AS module_name, v.name AS view_name, r.name AS role_name
FROM module m
JOIN module_view mv ON m.id = mv.module_id
JOIN view v ON mv.view_id = v.id
JOIN role_module rm ON m.id = rm.module_id
JOIN role r ON rm.role_id = r.id
ORDER BY m.name, v.name;

-- 5. Obtener una lista de todos los usuarios junto con sus roles y el número total de módulos a los que tienen acceso
SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name, r.name AS role_name, COUNT(DISTINCT m.id) AS total_modules
FROM person p
JOIN user u ON p.id = u.person_id
JOIN user_role ur ON u.id = ur.user_id
JOIN role r ON ur.role_id = r.id
JOIN role_module rm ON r.id = rm.role_id
JOIN module m ON rm.module_id = m.id
GROUP BY p.first_name, p.last_name, r.name;
