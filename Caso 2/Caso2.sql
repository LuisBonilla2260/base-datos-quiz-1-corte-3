SELECT 
    v.name AS view_name,
    m.name AS module_name,
    r.name AS role_name
FROM 
    role r
INNER JOIN 
    role_module rm ON r.id = rm.role_id
INNER JOIN 
    module m ON rm.module_id = m.id
INNER JOIN 
    module_view mv ON m.id = mv.module_id
INNER JOIN 
    view v ON mv.view_id = v.id
WHERE 
    r.name = 'Admin';
