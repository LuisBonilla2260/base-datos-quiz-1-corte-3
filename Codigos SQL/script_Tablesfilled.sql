-- Inserciones en la tabla person
INSERT INTO person (state, created_at, first_name, last_name, email, document_number, document_type)
VALUES 
    (1, NOW(), 'John', 'Doe', 'john.doe@example.com', '123456789', 'CC'),
    (1, NOW(), 'Jane', 'Smith', 'jane.smith@example.com', '987654321', 'CC'),
    (1, NOW(), 'Alice', 'Brown', 'alice.brown@example.com', '1122334455', 'CC'),
    (1, NOW(), 'Bob', 'Johnson', 'bob.johnson@example.com', '5566778899', 'CC'),
    (1, NOW(), 'Charlie', 'Davis', 'charlie.davis@example.com', '2233445566', 'TI');

-- Inserciones en la tabla user
INSERT INTO user (state, created_at, password, username, person_id)
VALUES 
    (1, NOW(), 'hashed_password_1', 'johndoe', 1),
    (1, NOW(), 'hashed_password_2', 'janesmith', 2),
    (1, NOW(), 'hashed_password_3', 'alicebrown', 3),
    (1, NOW(), 'hashed_password_4', 'bobjohnson', 4),
    (1, NOW(), 'hashed_password_5', 'charliedavis', 5);

-- Inserciones en la tabla role
INSERT INTO role (state, created_at, code, description, name)
VALUES 
    (1, NOW(), 'ADMIN', 'Administrator role', 'Admin'),
    (1, NOW(), 'USER', 'Standard user role', 'User'),
    (1, NOW(), 'MOD', 'Moderator role', 'Moderator'),
    (1, NOW(), 'SUPPORT', 'Support role', 'Support'),
    (1, NOW(), 'GUEST', 'Guest role', 'Guest');

-- Inserciones en la tabla user_role
INSERT INTO user_role (state, created_at, user_id, role_id)
VALUES 
    (1, NOW(), 1, 1),
    (1, NOW(), 2, 2),
    (1, NOW(), 3, 2),
    (1, NOW(), 4, 3),
    (1, NOW(), 5, 4);

-- Inserciones en la tabla module
INSERT INTO module (state, created_at, code, description, name, path)
VALUES 
    (1, NOW(), 'MOD001', 'User management module', 'User Management', '/user'),
    (1, NOW(), 'MOD002', 'Role management module', 'Role Management', '/role'),
    (1, NOW(), 'MOD003', 'Module for content management', 'Content Management', '/content'),
    (1, NOW(), 'MOD004', 'Module for reports', 'Reports', '/reports'),
    (1, NOW(), 'MOD005', 'Module for settings', 'Settings', '/settings');

-- Inserciones en la tabla view
INSERT INTO view (state, created_at, code, description, name, path)
VALUES 
    (1, NOW(), 'VIEW001', 'User list view', 'User List', '/user/list'),
    (1, NOW(), 'VIEW002', 'User details view', 'User Details', '/user/details'),
    (1, NOW(), 'VIEW003', 'Role list view', 'Role List', '/role/list'),
    (1, NOW(), 'VIEW004', 'Content list view', 'Content List', '/content/list'),
    (1, NOW(), 'VIEW005', 'Report view', 'Reports', '/reports/view');

-- Inserciones en la tabla role_module
INSERT INTO role_module (state, created_at, module_id, role_id)
VALUES 
    (1, NOW(), 1, 1),
    (1, NOW(), 2, 1),
    (1, NOW(), 3, 2),
    (1, NOW(), 4, 3),
    (1, NOW(), 5, 4);

-- Inserciones en la tabla module_view
INSERT INTO module_view (state, created_at, module_id, view_id)
VALUES 
    (1, NOW(), 1, 1),
    (1, NOW(), 1, 2),
    (1, NOW(), 2, 3),
    (1, NOW(), 3, 4),
    (1, NOW(), 4, 5);
