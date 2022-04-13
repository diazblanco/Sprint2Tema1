-- 03. Retorna el llistat dels alumnes que van néixer en 1999.
SELECT * FROM persona WHERE persona.tipo = 'alumno' AND YEAR (fecha_nacimiento) = (SELECT YEAR ('1999-01-01'));

-- 05. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 08. Retorna un llistat amb el nom de tots els departaments que tenen professors que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT departamento.nombre FROM departamento INNER JOIN profesor ON departamento.id = profesor.id_departamento INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor INNER JOIN grado ON asignatura.id_grado = grado.id WHERE grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

-- 09. Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT persona.nombre, apellido1, apellido2 FROM persona INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id WHERE anyo_inicio = 2018;


-- LEFT JOIN & RIGHT JOIN --
-- 01. Retorna un llistat amb els noms de tots els professors i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT DISTINCT departamento.nombre AS 'Nom departament', apellido1, apellido2, persona.nombre AS 'Nom professor' FROM profesor RIGHT JOIN persona ON profesor.id_profesor = persona.id LEFT JOIN departamento ON profesor.id_departamento = departamento.id WHERE persona.tipo = 'profesor' ORDER BY departamento.nombre ASC;

-- 02. Retorna un llistat amb els professors que no estan associats a un departament.
	-- PARA COMPROBAR PROFE SIN DPT, AÑADO REGISTRO EN TABLA PERSONA Y TABLA PROFE, PREVIO MODIFICAR EN TABLA PROFE PARA QUE id_departamento PUEDA SER NULL:
	-- INSERT INTO persona VALUES (25, '73573384L', 'NuevoProfe', 'Stedemann', 'Moriette', 'Almera', 'C/ Guadquivir', '950826825', '1980/08/01', 'M', 'profesor');
	-- INSERT INTO profesor VALUES (25, NULL);
SELECT persona.nombre AS 'Professor' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor WHERE persona.tipo = 'profesor' AND profesor.id_departamento IS NULL;

-- 04. Retorna un llistat amb els professors que no imparteixen cap assignatura.
SELECT DISTINCT persona.nombre FROM persona LEFT JOIN asignatura ON asignatura.id_profesor = persona.id WHERE persona.tipo = 'profesor' AND asignatura.id_profesor IS NULL;


-- RESUM --
-- 09. Retorna un llistat amb el nombre d'assignatures que imparteix cada professor. El llistat ha de tenir en compte aquells professors que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT persona.id, persona.nombre, persona.apellido1, persona.apellido2, COUNT(asignatura.id_profesor) AS 'Nº asignatures' FROM persona LEFT JOIN profesor ON persona.id = profesor.id_profesor LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor WHERE persona.tipo = 'profesor' GROUP BY persona.id ORDER BY COUNT(asignatura.id_profesor) DESC;