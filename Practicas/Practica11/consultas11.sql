/*1-PRODUCTO CARTESIANO
todas las clases que puede tener un socio. 
*/
select *
from imparte,socio;

/*2- JOIN 
 las areas que visita un socio y el tipo de membresia con la que cuenta
 (NOMBRE, EDAD, ID SOCIO,AREA QUE VISITA, TIPO MEMBRESIA)
*/

select c.NOMBRE,c.EDAD,b.PK_ID_SOCIO,d.NOMBRE_AREA, g.tipo
from visita a join socio b on a.PK_ID_SOCIO=b.PK_ID_SOCIO, persona c, area d, tener e, MEMBRESIA f,
    tipomembresia g
where b.FK_IDPERSONA=c.PK_ID_PERSONA and
      a.PK_ID_AREA=d.PK_ID_AREA and
      b.PK_ID_SOCIO=e.PK_ID_NO_SOCIO and
      e.PK_ID_NO_MEMB=f.PK_NO_MEMBRESIA and
      f.fk_id_tipo= g.pk_id_tipo    
order by a.PK_ID_SOCIO;

/*3-UNION
Nombre y edad de personas que compraron un producto o clientes que se registraron entre 2012 y 2013*/
select distinct b.PK_ID_CLIENTE, c.nombre
from producto a, cliente b,persona c
where a.fk_id_cliente= b.pk_id_cliente and
    b.fk_idPersona=c.pk_id_persona
UNION
select distinct e.pk_id_cliente, d.nombre --, e.FECHA_REGISTRO
from persona d, cliente e
where e.fk_idPersona=d.PK_ID_PERSONA and
    extract(year from e.fecha_registro) BETWEEN 2012 and 2013;


/*4- INTERSECCION
socios que toman clase de Danza Arabe y Twerk,  y que compraron algun producto

*/
select distinct persona.nombre,persona.edad,socio.pk_id_socio
from socio, clase,nombre_clase, persona
where socio.fk_id_clase=clase.pk_id_clase and
    socio.fk_idpersona=persona.pk_id_persona and
    nombre_clase.pk_id_nombreclase=clase.fk_id_nombreclase and
    clase.FK_ID_NOMBRECLASE in (2,4)
INTERSECT
select c.nombre,c.edad,a.pk_id_socio
from socio a, producto b, persona c
where a.fk_id_cliente=b.fk_id_cliente and 
      a.fk_idpersona=c.pk_id_persona;
      
      
/*5- MINUS
Las personas que se registraron entre 2013 y 2015 pero que no toman clases de zumba.
*/      
select persona.*
from cliente, persona
where cliente.fk_idpersona=persona.pk_id_persona and
    extract(year from cliente.fecha_registro) between 2013 and 2015
MINUS
select a.*
from persona a, clase b, nombre_clase c, socio d
where d.fk_id_clase=b.pk_id_clase and 
     b.fk_id_nombreClase=c.pk_id_nombreClase and
     d.fk_idpersona=a.pk_id_persona and
     c.pk_id_nombreClase=1;
