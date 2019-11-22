/*
1-Socios que no han comprado productos*/
select distinct persona.nombre,persona.edad
from persona,socio
where persona.pk_id_persona=socio.FK_IDPERSONA
minus
select distinct a.NOMBRE,a.EDAD
from persona a, socio b, producto c
where b.FK_ID_CLIENTE=c.FK_ID_CLIENTE and
      b.FK_IDPERSONA=a.PK_ID_PERSONA;

/*2-Clientes y socios que han comprado productos y que tengan edades entre 18 y 35 años*/
select c.NOMBRE, c.EDAD, a.NOMBRE_PRODUCTO
from producto a, cliente b, persona c
where a.FK_ID_CLIENTE=b.PK_ID_CLIENTE and 
        c.PK_ID_PERSONA =b.FK_IDPERSONA and 
        c.EDAD BETWEEN 18 and 35;
        
        
/*3-
Entrenadores cuyo apellido paterno empiece con F y de clases de zumba (nombre completo y clase)
NOTA: no habia ninguno con Z, asi que le cambie la letra por "F" */
select distinct b.nombre ,e.NOMBRE_CLASE 
from Entrenador a, Persona b, IMPARTE c, Clase d,nombre_clase e
where  a.FK_IDPERSONA=b.PK_ID_PERSONA and
        REGEXP_LIKE(b.NOMBRE,'.* [F].*' ) and
        c.FK_ID_EMPLEADO = a.PK_ID_EMPLEADO and
        c.FK_ID_CLASE = d.PK_ID_CLASE and
        e.pk_id_nombreClase=d.fk_id_nombreClase and
        d.FK_ID_NOMBRECLASE=1; 
        
/*4-
Instructores que han dado clase de box y que no empiecen con A en su nombre y cuya edad no sea 25,26,27 
(nombre, edad y clase impartida) 
*/
select distinct d.nombre,d.edad,e.NOMBRE_CLASE
from instructor a, imparte b, clase c, persona d,NOMBRE_CLASE e
where a.PK_ID_INSTRUCTOR=b.FK_ID_INSTRUCTOR and
        b.FK_ID_CLASE = c.PK_ID_CLASE and 
        d.PK_ID_PERSONA=a.FK_IDPERSONA and
        c.FK_ID_NOMBRECLASE=e.PK_ID_NOMBRECLASE and
        c.FK_ID_NOMBRECLASE=3 and
        REGEXP_LIKE(d.nombre, '^[^A].*') and
        d.EDAD NOT IN(25,26,27);
        
/*5-
Productos que han comprado y que terminan en "n", cuya fecha de compra año sido en agosto
(nombre de producto y fecha de compra)*/
select *
from producto a
where REGEXP_LIKE (a.NOMBRE_PRODUCTO,'.*[n]$');

/*6-
Entrenadores que no dieron clase de box, ni zumba pero que la edad sea entre 25 o 60 años y cuyos socios
tengan fecha de ingreso al gimnasio en el año actual 
*/
select distinct d.NOMBRE ,d.EDAD
from entrenador a,imparte b,clase c,persona d,socio e
where a.pk_id_empleado=b.FK_ID_EMPLEADO and
        b.FK_ID_CLASE=c.PK_ID_CLASE and
        c.FK_ID_NOMBRECLASE NOT IN(1,3) and
        a.FK_IDPERSONA=d.PK_ID_PERSONA and
        d.EDAD NOT BETWEEN 26 and 60 
        union 
select Persona.NOMBRE,Persona.EDAD--, Cliente.FECHA_REGISTRO
from Socio,Cliente,Persona
where Socio.FK_ID_CLIENTE=Cliente.PK_ID_CLIENTE and
      Socio.fk_idpersona=persona.PK_ID_PERSONA and
        extract(year from Cliente.fecha_registro)=2017;
        
/*7-
utilizando REGEXP_LIKE y REGEXP_REPLACLE cambia las vocales por alguna consonante y cuyos clientes
terminan su nombre con "S" 
(nombre completo de clientes, clases tomadas)
*/
select  distinct b.NOMBRE, REGEXP_REPLACE(b.nombre,'A|E|I|O|U|a|e|i|o|u','W')nombre_remplazo,e.NOMBRE_CLASE
from cliente a, persona b, socio d,clase c,nombre_clase e
where a.FK_IDPERSONA=b.PK_ID_PERSONA and
        REGEXP_LIKE(b.nombre,'.*[s] .*') and
        --como pide la clase, y solo los socios son los que tienen clase entonces se escogen entre todos los clientes
        d.FK_ID_CLIENTE=a.PK_ID_CLIENTE and
        c.PK_ID_CLASE=d.FK_ID_CLASE and
        e.PK_ID_NOMBRECLASE=c.FK_ID_NOMBRECLASE;
        
/*8-
Muestra los registrs de clientes o socios que han comprado algun producto pero cuya cuenta de vocales sea mayor a 3
en su nombre
(nombre completo del cliente o socio, producto de compra y conteo de vocales en su nombre)*/
select distinct b.NOMBRE,c.NOMBRE_PRODUCTO, REGEXP_COUNT(b.NOMBRE,'A|E|I|O|U|a|e|i|o|u') No_vocales
from cliente a, persona b,producto c
where a.FK_IDPERSONA=b.PK_ID_PERSONA and
    c.FK_ID_CLIENTE=a.PK_ID_CLIENTE and
    REGEXP_COUNT(b.NOMBRE,'A|E|I|O|U|a|e|i|o|u')> 3;

/*9-
Año de ingreso de todas las personas(clientes y socios )cuyp nombre termine en "r"
y el año de ingreso sea desde 2001
(nombre completo, año de resgistro y fecha de ingreso)
NOTA:No exiten registros de 2001, comezo a funcionar desde 2011*/
select distinct a.NOMBRE,b.fecha_registro, EXTRACT(YEAR FROM b.fecha_registro) año
from persona a, cliente b
where a.PK_ID_PERSONA=b.FK_IDPERSONA and
      REGEXP_LIKE(a.nombre,'.*[r] .*') and
      EXTRACT(YEAR FROM b.fecha_registro)>=2011;   
      
