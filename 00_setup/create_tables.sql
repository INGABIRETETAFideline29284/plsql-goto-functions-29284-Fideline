SET SERVEROUTPUT ON;

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE payroll CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employees CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE departments CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    department_id NUMBER NOT NULL,
    hire_date DATE NOT NULL,
    monthly_salary NUMBER(12,2) NOT NULL,

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    CONSTRAINT chk_employee_salary
        CHECK (monthly_salary > 0)
);

CREATE TABLE payroll (
    payroll_id NUMBER PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    payroll_month DATE NOT NULL,
    basic_salary NUMBER(12,2) NOT NULL,
    tax_amount NUMBER(12,2) NOT NULL,
    net_salary NUMBER(12,2) NOT NULL,

    CONSTRAINT fk_payroll_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id),

    CONSTRAINT chk_basic_salary
        CHECK (basic_salary >= 0),

    CONSTRAINT chk_tax_amount
        CHECK (tax_amount >= 0),

    CONSTRAINT chk_net_salary
        CHECK (net_salary >= 0)
);

INSERT INTO departments
VALUES (10, 'Information Technology');

INSERT INTO departments
VALUES (20, 'Finance');

INSERT INTO departments
VALUES (30, 'Human Resources');

INSERT INTO departments
VALUES (40, 'Marketing');

INSERT INTO departments
VALUES (50, 'Sales');

INSERT INTO employees
VALUES (
    101,
    'Alice',
    'Uwase',
    10,
    DATE '2021-01-15',
    450000
);

INSERT INTO employees
VALUES (
    102,
    'Brian',
    'Mugisha',
    20,
    DATE '2020-06-10',
    650000
);

INSERT INTO employees
VALUES (
    103,
    'Claire',
    'Mukamana',
    30,
    DATE '2022-03-20',
    800000
);

INSERT INTO employees
VALUES (
    104,
    'David',
    'Niyonzima',
    40,
    DATE '2019-09-05',
    950000
);

INSERT INTO employees
VALUES (
    105,
    'Eric',
    'Habimana',
    50,
    DATE '2023-02-01',
    1200000
);

INSERT INTO employees
VALUES (
    106,
    'Grace',
    'Ingabire',
    10,
    DATE '2018-07-12',
    1500000
);

INSERT INTO payroll
VALUES (
    1,
    101,
    DATE '2026-09-01',
    450000,
    22500,
    427500
);

INSERT INTO payroll
VALUES (
    2,
    102,
    DATE '2026-09-01',
    650000,
    65000,
    585000
);

INSERT INTO payroll
VALUES (
    3,
    103,
    DATE '2026-09-01',
    800000,
    80000,
    720000
);

INSERT INTO payroll
VALUES (
    4,
    104,
    DATE '2026-09-01',
    950000,
    95000,
    855000
);

INSERT INTO payroll
VALUES (
    5,
    105,
    DATE '2026-09-01',
    1200000,
    180000,
    1020000
);

INSERT INTO payroll
VALUES (
    6,
    106,
    DATE '2026-09-01',
    1500000,
    225000,
    1275000
);

COMMIT;
