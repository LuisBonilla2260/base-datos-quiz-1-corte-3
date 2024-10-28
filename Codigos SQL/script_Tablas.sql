use db_security;
-- Table: person
CREATE TABLE person (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    address VARCHAR(255),
    document_number VARCHAR(20),
    document_type VARCHAR(20),
    email VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    middle_name VARCHAR(50),
    phone VARCHAR(15),
    second_last_name VARCHAR(50)
);

-- Table: user
CREATE TABLE user (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    password VARCHAR(255),
    username VARCHAR(50),
    person_id BIGINT,
    FOREIGN KEY (person_id) REFERENCES person(id)
);

-- Table: role
CREATE TABLE role (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100)
);

-- Table: module
CREATE TABLE module (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255)
);

-- Table: view
CREATE TABLE view (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    code VARCHAR(20),
    description VARCHAR(255),
    name VARCHAR(100),
    path VARCHAR(255)
);

-- Table: user_role
CREATE TABLE user_role (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    user_id BIGINT,
    role_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Table: role_module
CREATE TABLE role_module (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    module_id BIGINT,
    role_id BIGINT,
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (role_id) REFERENCES role(id)
);

-- Table: module_view
CREATE TABLE module_view (
    id BIGINT PRIMARY KEY,
    created_at DATETIME(6),
    created_by BIGINT,
    deleted_at DATETIME(6),
    deleted_by BIGINT,
    state BIT(1),
    updated_at DATETIME(6),
    updated_by BIGINT,
    module_id BIGINT,
    view_id BIGINT,
    FOREIGN KEY (module_id) REFERENCES module(id),
    FOREIGN KEY (view_id) REFERENCES view(id)
);
