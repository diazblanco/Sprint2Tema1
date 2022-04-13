-- 03. Llista totes les columnes de la taula producto.
SHOW COLUMNS FROM producto;

-- 10. Llista els noms i els preus de tots els productos de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio,0) FROM producto;

-- 15. Llista els noms dels productos ordenats en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
SELECT nombre FROM producto ORDER BY nombre ASC , precio DESC;

-- 33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante INNER JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo_fabricante;

-- 34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT DISTINCT fabricante.nombre AS 'Nom fabricant', producto.nombre AS 'Nom producte' FROM producto RIGHT JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;