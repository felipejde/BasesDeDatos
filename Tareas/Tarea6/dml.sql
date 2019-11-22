--a. Encontrar el nombre y la ciudad de todos los empleados que trabajan en PEMEX
SELECT distinct e.nombre, e.ciudad
FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.curp = t.curp
	INNER JOIN APP2.EMPRESA.EMPRESAS m ON m.rfc = t.rfc AND m.razon_social = 'PEMEX';

--b. Encontrar todos los empleados que viven en la misma ciudad en la que trabajan.
SELECT distinct *
FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.curp = t.curp
	INNER JOIN APP2.EMPRESA.EMPRESAS m ON m.rfc = t.rfc AND e.ciudad = m.ciudad;

--c. Calcular el salario de todos los directores.
SELECT DISTINCT t.curp, t.rfc, t.salario
FROM APP2.EMPRESA.DIRIGIR d INNER JOIN APP2.EMPRESA.TRABAJAR t ON d.curp = t.curp;

--d. Obtener la informaci�n de los directores y empresas que comenzaron a dirigir dicha empresa
--en el primer y tercer trimestre del a�o que t� elijas.
SELECT d.* , e.*
FROM APP2.EMPRESA.DIRIGIR d INNER JOIN APP2.EMPRESA.EMPLEADOS e ON d.curp  = e.curp
	INNER JOIN APP2.EMPRESA.EMPRESAS m ON m.rfc = d.rfc
WHERE (DATEPART(QUARTER, d.fecha_inicio) = 1 OR  DATEPART(QUARTER, d.fecha_inicio) = 3) 
		AND DATEPART(YEAR, d.fecha_inicio) IN (2012);

--e. Encontrar a todos los empleados que viven en la misma ciudad y en la misma calle que su
--supervisor.
SELECT e2.curp, e2.nombre, e2.paterno, e2.materno, e2.fecha_nac, e2.calle, e2.num, e2.ciudad, e2.codigo_postal
FROM APP2.EMPRESA.SUPERVISAR s INNER JOIN APP2.EMPRESA.EMPLEADOS e ON s.curp_supervisor = e.curp
	INNER JOIN APP2.EMPRESA.EMPLEADOS e2 ON s.curp_empleado = e2.curp
WHERE e.calle = e2.calle AND e.ciudad = e2.ciudad;

--f. Obtener una lista de cada compa��a y el salario promedio que paga.
SELECT e.rfc, AVG(t.salario) AS  salario_promedio
FROM APP2.EMPRESA.EMPRESAS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.rfc = t.rfc
GROUP BY e.rfc;

--g. Empleados que colaboran en proyectos que controlan empresas para las que no trabajan.
(SELECT e.curp, m.rfc
FROM (((APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.COLABORAR c ON e.curp = c.curp)
	INNER JOIN APP2.EMPRESA.PROYECTOS p ON p.num_proy = c.num_proy)
	INNER JOIN APP2.EMPRESA.EMPRESAS m ON m.rfc = p.rfc))
EXCEPT
(SELECT curp, rfc
FROM APP2.EMPRESA.TRABAJAR);

--h. Encontrar el total de salarios pagados por cada compa��a.
SELECT rfc, COUNT(salario) AS total_salarios_pagados
FROM APP2.EMPRESA.TRABAJAR
GROUP BY rfc;

--i. Encontrar informaci�n de los empleados y n�mero de horas que dedican a los proyectos, para
--aquellos empleados que colaboran en al menos dos proyectos y en donde el n�mero de horas
--que dediquen a alg�n proyecto sea mayor a 20.
SELECT *
FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN 
	(SELECT curp, COUNT(num_proy) AS  numero_proyectos, SUM(num_horas) AS num_horas
	FROM APP2.EMPRESA.COLABORAR 
	WHERE num_horas > 20
	GROUP BY curp
	HAVING COUNT(num_proy) >= 2) g ON e.curp = g.curp;

--j. Encontrar la cantidad de empleados en cada compa��a
SELECT rfc, COUNT(curp) AS cantidad_empleados
FROM APP2.EMPRESA.TRABAJAR t
GROUP BY rfc;

--k. Encontrar el nombre del empleado que gana m�s dinero en cada compa��a.
SELECT n.nombre, n.rfc
FROM (SELECT rfc, MAX(salario) AS salario
	FROM APP2.EMPRESA.TRABAJAR t
	GROUP BY rfc) m 
	INNER JOIN 
	(SELECT rfc, nombre, salario
	FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.curp = t.curp) n 
	ON m.rfc = n.rfc AND m.salario = n.salario;

--l. Obtener una lista de los empleados que ganan m�s del salario promedio que pagan las
--compa��as.
SELECT curp
FROM APP2.EMPRESA.TRABAJAR
WHERE salario > (SELECT AVG(p.salario_promedio) AS salario_promedio
				FROM (SELECT e.rfc, AVG(t.salario) AS  salario_promedio
					FROM APP2.EMPRESA.EMPRESAS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.rfc = t.rfc
					GROUP BY e.rfc) p);

--m. Encontrar la compa��a que tiene menos empleados y listar toda la informaci�n de los mismos.
--Nota: Hay varias compa�ias con el mismo minimo n�mero de empleados(menos empleados).
SELECT a.*
FROM (SELECT rfc, COUNT(curp) AS num_empleados
	FROM APP2.EMPRESA.TRABAJAR
	GROUP BY rfc) e 
	INNER JOIN 
	(SELECT MIN(n.num_empleados) AS min_num_empleados
	FROM (SELECT rfc, COUNT(curp) AS num_empleados
		FROM APP2.EMPRESA.TRABAJAR
		GROUP BY rfc) AS n) m 
	ON e.num_empleados = m.min_num_empleados
	INNER JOIN APP2.EMPRESA.TRABAJAR t ON t.rfc = e.rfc
	INNER JOIN APP2.EMPRESA.EMPLEADOS a ON a.curp = t.curp;

--n. Informaci�n de los proyectos en los que colaboran los empleados que son directores.
SELECT p.*
FROM APP2.EMPRESA.DIRIGIR d INNER JOIN APP2.EMPRESA.COLABORAR c ON d.curp = c.curp
	INNER JOIN  APP2.EMPRESA.PROYECTOS p ON  p.num_proy = c.num_proy;

--o. Encontrar la compa��a que tiene empleados en cada una de las ciudades que hayas
--definido.
SELECT a.rfc AS rfc_compania, COUNT(a.ciudad) AS num_ciudades_definidas
FROM (SELECT  DISTINCT t.rfc, e.ciudad
	FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON t.curp = e.curp) a
	INNER JOIN
	((SELECT DISTINCT ciudad
	FROM APP2.EMPRESA.EMPLEADOS)
	UNION
	(SELECT DISTINCT ciudad
	FROM APP2.EMPRESA.EMPRESAS)) b 
	ON a.ciudad = b.ciudad
	GROUP BY a.rfc
	HAVING COUNT(a.ciudad) = (SELECT COUNT(f.ciudad)
							  FROM ((SELECT DISTINCT ciudad
									 FROM APP2.EMPRESA.EMPLEADOS)
									 UNION
									 (SELECT DISTINCT ciudad
									 FROM APP2.EMPRESA.EMPRESAS)) f);

--p. Empleados que dejaron de colaborar en proyectos, antes de la fecha de finalizaci�n de los
--mismos.
SELECT e.*
FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.COLABORAR c ON e.curp = c.curp
	INNER JOIN APP2.EMPRESA.PROYECTOS p ON p.num_proy = c.num_proy
WHERE c.fecha_fin < p.fecha_fin;

--q. Informaci�n de los empleados que no colaboran en ning�n proyecto.
SELECT m.*
FROM (SELECT curp
	FROM APP2.EMPRESA.EMPLEADOS
	EXCEPT 
	SELECT curp
	FROM APP2.EMPRESA.COLABORAR) e INNER JOIN APP2.EMPRESA.EMPLEADOS m ON  e.curp = m.curp;

--r. Encontrar la informaci�n de las compa��as que tienen al menos dos empleados en la misma
--ciudad en que tienen sus instalaciones
SELECT *
FROM (SELECT m.rfc, COUNT(e.curp) AS num_empleados_misma_ciudad
	  FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.TRABAJAR t ON e.curp = t.curp
	  INNER JOIN APP2.EMPRESA.EMPRESAS m ON m.rfc = t.rfc
	  WHERE e.ciudad = m.ciudad
	  GROUP BY m.rfc) d INNER JOIN APP2.EMPRESA.EMPRESAS e ON e.rfc = d.rfc
WHERE num_empleados_misma_ciudad >= 2;

--s. Proyecto que m�s empleados requiere (o requiri�) y el n�mero de horas que �stos le
--dedicaron.
--Nota: Son varios proyectos ya que todos ellos tienen el maximo numero de empleados, y tienen la misma cantidad.
SELECT m.num_proy, SUM(num_horas) AS total_num_horas
FROM APP2.EMPRESA.COLABORAR c 
	INNER JOIN
	(SELECT num_proy
	FROM (SELECT num_proy, COUNT(curp) AS num_empleados
		  FROM APP2.EMPRESA.COLABORAR
		  GROUP BY num_proy) n
		  INNER JOIN
	      (SELECT MAX(n.num_empleados) AS max_num_empleados
		   FROM (SELECT num_proy, COUNT(curp) AS num_empleados
				 FROM APP2.EMPRESA.COLABORAR
				 GROUP BY num_proy) n) m
				 ON m.max_num_empleados = n.num_empleados) m 
	ON m.num_proy = c.num_proy
	GROUP BY m.num_proy;

--t. Empleados que comenzaron a colaborar en proyectos en la misma fecha de su cumplea�os
SELECT e.*
FROM APP2.EMPRESA.EMPLEADOS e INNER JOIN APP2.EMPRESA.COLABORAR c ON e.curp = c.curp
WHERE DATEPART(DAY, e.fecha_nac) = DATEPART(DAY, c.fecha_inicio)
	AND DATEPART(M, e.fecha_nac) = DATEPART(M, c.fecha_inicio);

--u. Obtener una lista del n�mero de empleados que supervisa cada supervisor.
SELECT curp_supervisor, COUNT(curp_empleado) AS num_supervisados
FROM APP2.EMPRESA.SUPERVISAR
GROUP BY curp_supervisor;

--v. Obtener una lista de los directores de m�s de 50 a�os.
SELECT e.*, FLOOR((CAST(CONVERT(CHAR(8), GETDATE(), 112) AS INT) -
				   CAST(CONVERT(CHAR(8), e.fecha_nac, 112) AS INT))/10000) AS edad
FROM APP2.EMPRESA.DIRIGIR d INNER JOIN APP2.EMPRESA.EMPLEADOS e ON d.curp = e.curp
WHERE FLOOR((CAST(CONVERT(CHAR(8), GETDATE(), 112) AS INT) -
			 CAST(CONVERT(CHAR(8), e.fecha_nac, 112) AS INT))/10000) > 50;

--w. Obtener una lista de los empleados cuyo apellido paterno comience con las letras A, D, G, J,
--L, P o R.
SELECT *
FROM APP2.EMPRESA.EMPLEADOS
WHERE paterno LIKE '[A, D, G, J]%';

--x. N�mero de empleados que colaboran en los proyectos que controla cada empresa para
--aquellos proyectos que hayan iniciado en diciembre.
SELECT COUNT(curp) AS num_empleados
FROM APP2.EMPRESA.PROYECTOS p INNER JOIN APP2.EMPRESA.COLABORAR c ON p.num_proy = c.num_proy
WHERE DATEPART(M ,p.fecha_inicio) = 12;

--y. Crea una vista con la informaci�n de los empleados y compa��as en que trabajan, de aquellos
--empleados que lo hagan en al menos tres compa��as diferentes.

--Esta consulta esta en el archivo dml - y.sql