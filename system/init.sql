-- init
CREATE DATABASE {{ project_name }};
CREATE USER {{ project_name }};
ALTER USER {{ project_name }} PASSWORD '{{ project_name }}';
GRANT ALL ON DATABASE {{ project_name }} TO {{ project_name }};
