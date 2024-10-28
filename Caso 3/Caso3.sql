SELECT 
    r.name AS role_name,
    m.name AS module_name,
    v.name AS view_name
FROM 
    user u
INNER JOIN 
    person p ON u.person_id = p.id
INNER JOIN 
    user_role ur ON u.id = ur.user_id
INNER JOIN 
    role r ON ur.role_id = r.id
INNER JOIN 
    role_module rm ON r.id = rm.role_id
INNER JOIN 
    module m ON rm.module_id = m.id
INNER JOIN 
    module_view mv ON m.id = mv.module_id
INNER JOIN 
    view v ON mv.view_id = v.id
WHERE 
    u.username = 'johndoe' -- Usuario de ejemplo
    AND u.password = 'password123' -- Contraseña de ejemplo;
