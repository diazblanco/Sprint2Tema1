SELECT apellido1, apellido2, persona.nombre FROM persona WHERE persona.tipo = 'alumno' ORDER BY apellido1 ASC;
SELECT persona.nombre, apellido1, apellido2 FROM persona WHERE telefono IS NULL;
SELECT * FROM persona WHERE persona.tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
SELECT * FROM persona WHERE persona.tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%k';
SELECT * FROM asignatura INNER JOIN grado ON asignatura.id_grado = grado.id WHERE cuatrimestre = 1 AND curso = 3 AND grado.id = 7;
SELECT apellido1, apellido2, persona.nombre, departamento.nombre AS 'Nom departament' FROM profesor INNER JOIN persona ON profesor.id_profesor = persona.id INNER JOIN departamento ON profesor.id_departamento = departamento.id ORDER BY apellido1 ASC;
SELECT asignatura.nombre AS 'Nom asignatura', anyo_inicio, anyo_fin FROM alumno_se_matricula_asignatura INNER JOIN asignatura ON id_asignatura = asignatura.id INNER JOIN curso_escolar ON id_curso_escolar = curso_escolar.id INNER JOIN persona ON id_alumno = persona.id WHERE nif = '26902806M';
SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.id = 4;
SELECT DISTINCT persona.nombre, apellido1, apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE anyo_inicio = 2018;

-- LEFT JOIN & RIGHT JOIN
SELECT departamento.nombre AS 'Nom departament', apellido1, apellido2, persona.nombre AS 'Nom professor' FROM profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id;
SELECT * FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE departamento.nombre IS NULL;
SELECT * FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento WHERE profesor.id_profesor IS NULL;
SELECT DISTINCT persona.nombre, apellido1, asignatura.nombre AS 'Nom asignatura' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT asignatura.nombre, profesor.id_profesor FROM asignatura LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor WHERE asignatura.id_profesor IS NULL; -- SELECT DISTINCT asignatura.nombre FROM asignatura WHERE asignatura.id_profesor IS NULL;
SELECT DISTINCT departamento.nombre FROM departamento LEFT JOIN profesor ON departamento.id = profesor.id_departamento LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura WHERE asignatura.id IS NULL;