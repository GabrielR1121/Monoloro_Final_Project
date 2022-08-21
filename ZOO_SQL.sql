SET ECHO ON
SET linesize 150;

SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------
-------------- Borrando Tablas ------------- 
--------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda_empleado;
DROP TABLE agenda_empleado CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda_animal;
DROP TABLE agenda_animal   CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE repartido;
DROP TABLE repartido       CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE evento;
DROP TABLE evento          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda;
DROP TABLE agenda          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE animal;
DROP TABLE animal          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
DROP TABLE cueva           CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE empleado;
DROP TABLE empleado        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
DROP TABLE departamento    CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE actividad;
DROP TABLE actividad       CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE calendario;
DROP TABLE calendario      CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE alimento;
DROP TABLE alimento        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE plan_medico;
DROP TABLE plan_medico     CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE contrato;
DROP TABLE contrato        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE sucursal;
DROP TABLE sucursal        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;

 ----------------------------------------------------------------
 -- Author : Gabriel E. Rodriguez Garcia                       --
 -- Num.Est: 841-18-7066                                       --
 -- Curso : SICI-4030 KJ1                                      --
 -- Creado : 10 de deciembre de 2020                           --
 -- Source : Proyecto_Final                                    --
 -- Desc. : Este script ejecuta todas las tareas solicitadas   --
 -- del Proyecto Final.                                        --
 ----------------------------------------------------------------
 --- Comandos de consola solicitados como parte del proyecto  ---
 ----------------------------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla sucursal ------------------                   
---------------------------------------------------------------
CREATE TABLE sucursal (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(50)              NOT NULL,
        linea_1                               VARCHAR2(40)              NOT NULL, 
        linea_2                               VARCHAR2(40)              NOT NULL, 
        pueblo                                VARCHAR2(20)              NOT NULL,
        estado                                VARCHAR2(20)              NOT NULL,
        codigo_postal                         NUMBER(5)                 NOT NULL,	
        telefono                              VARCHAR(12)               NOT NULL  UNIQUE,		
 CONSTRAINT sucursal_pk                       PRIMARY KEY               (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla contrato ------------------                   
---------------------------------------------------------------
CREATE TABLE contrato (
        id_pk                                 NUMBER(4),
        commentario                           VARCHAR2(50)               NOT NULL,	
 CONSTRAINT contrato_pk                       PRIMARY KEY                (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla plan_medico ---------------                   
---------------------------------------------------------------
CREATE TABLE plan_medico (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(25)                NOT NULL,
        telefono                              VARCHAR2(12)                NOT NULL  UNIQUE,	
 CONSTRAINT plan_medico_pk                    PRIMARY KEY                 (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla alimento ---------------                   
---------------------------------------------------------------
CREATE TABLE alimento (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(25)                 NOT NULL,
        descripcion                           VARCHAR2(50)                 NOT NULL,
        medida                                VARCHAR2(5)                  NOT NULL,
        cantidad                              NUMBER(7)                    NOT NULL,		
 CONSTRAINT alimento_pk                       PRIMARY KEY                  (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla calendario ----------------                   
---------------------------------------------------------------
CREATE TABLE calendario (
        id_pk                                 NUMBER(4),
        dia                                   VARCHAR2(40)                  NOT NULL,
        commentario                           VARCHAR2(50)                  NOT NULL,	
 CONSTRAINT calendario_pk                     PRIMARY KEY                   (id_pk));
 SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla actividad -----------------                   
---------------------------------------------------------------
CREATE TABLE actividad (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(40)                   NOT NULL,
        duracion                              NUMBER(4,2)                    NOT NULL,	
 CONSTRAINT actividad_pk                      PRIMARY KEY                    (id_pk));
 ---------------------------------------------------------------
-------------- Creacion de la tabla departamento ----------------                   
---------------------------------------------------------------
CREATE TABLE departamento (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(40)                   NOT NULL,
        commentario                           VARCHAR2(50)                   NOT NULL,
        id_sucursal_fk1                       NUMBER(4)                      NOT NULL,		
 CONSTRAINT departamento_pk                   PRIMARY KEY                    (id_pk),
 CONSTRAINT id_sucursal_fk1                   FOREIGN KEY                    (id_sucursal_fk1)
                                              REFERENCES sucursal            (id_pk));
 SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla empleado ------------------                   
---------------------------------------------------------------
 CREATE TABLE empleado (
        numero_pk                             NUMBER(4),		
        primer_nombre                         VARCHAR2(15)                    NOT NULL, 
        inicial                               VARCHAR2(1), 
        apellido_paterno                      VARCHAR2(20)                    NOT NULL,
        apellido_materno                      VARCHAR2(20), 
        tipo_emp                              VARCHAR(1)                      NOT NULL,
        celular                               VARCHAR2(12)                    UNIQUE,			
        correo_electronico                    VARCHAR(25)                     NOT NULL  UNIQUE,
        salario_men                           NUMBER(9,2),
        estatus                               VARCHAR(15),
        horas_trabajadas                      NUMBER(3),
        pago                                  NUMBER(9,2),
        licencia                              NUMBER(9),
        asociacion                            VARCHAR2(50),
        cobro                                 NUMBER(9,2),
        id_sucursal_fk1                       NUMBER(4)                       NOT NULL,
        id_departamento_fk2                   NUMBER(4)                       NOT NULL, 
        id_plan_medico_fk3                    NUMBER(4),
        id_contrato_fk4                       NUMBER(4),		
 CONSTRAINT  empleado_pk                      PRIMARY KEY                     (numero_pk),
 CONSTRAINT  id_sucursal__fk1                 FOREIGN KEY                     (id_sucursal_fk1)
                                              REFERENCES sucursal             (id_pk),
 CONSTRAINT  id_departamento_fk2              FOREIGN KEY                     (id_departamento_fk2)
                                              REFERENCES departamento         (id_pk),
 CONSTRAINT  id_plan_fk3                      FOREIGN KEY                     (id_plan_medico_fk3)
                                              REFERENCES plan_medico          (id_pk),
 CONSTRAINT  id_contrato_fk4                  FOREIGN KEY                     (id_contrato_fk4)
                                              REFERENCES contrato             (id_pk));
 SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla cueva ---------------------                   
---------------------------------------------------------------
CREATE TABLE cueva (
        id_pk                                 NUMBER(4),
        id_sucursal_fk1                       NUMBER(4),	
 CONSTRAINT cueva_pk                          PRIMARY KEY                      (id_pk),											  
 CONSTRAINT sucursal_fk1                      FOREIGN KEY                      (id_sucursal_fk1)
                                              REFERENCES sucursal              (id_pk));
  SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla animal ---------------------                   
---------------------------------------------------------------
CREATE TABLE animal (
        id_pk                                 NUMBER(4),
        nombre                                VARCHAR2(25)                      NOT NULL,
        especie                               VARCHAR2(15)                      NOT NULL,
        estatura                              NUMBER(6,2)                       NOT NULL,
        peso                                  NUMBER(6,2)                       NOT NULL,
        id_cueva_fk1                          NUMBER(4),
CONSTRAINT  id_animal                         PRIMARY KEY                       (id_pk),
CONSTRAINT  id_cueva_fk1                      FOREIGN KEY                       (id_cueva_fk1)
                                              REFERENCES cueva                  (id_pk));
 SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla agenda --------------------                  
---------------------------------------------------------------
CREATE TABLE agenda (
        id_pk                                 NUMBER(4),
		descripcion                           VARCHAR2(50)                       NOT NULL,
        id_actividad_fk1                      NUMBER(4)                          NOT NULL,	
 CONSTRAINT agenda_pk                         PRIMARY KEY                       (id_pk),											  
 CONSTRAINT id_actividad_fk1                  FOREIGN KEY                       (id_actividad_fk1)
                                              REFERENCES actividad              (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla evento --------------------                  
---------------------------------------------------------------
CREATE TABLE evento (
        id_calendario_pk_fk1                   NUMBER(4)                          NOT NULL,
        id_sucursal_pk_fk2                     NUMBER(4)                          NOT NULL,
        id_actividad_pk_fk3                    NUMBER(4)                          NOT NULL,
  CONSTRAINT id_evento_pk                      PRIMARY KEY                        (id_calendario_pk_fk1,id_sucursal_pk_fk2,id_actividad_pk_fk3),
  CONSTRAINT id_calendario_pk_fk1              FOREIGN KEY                        (id_calendario_pk_fk1)
                                               REFERENCES calendario              (id_pk),
  CONSTRAINT id_sucursal_pk_fk2                FOREIGN KEY                        (id_sucursal_pk_fk2)
                                               REFERENCES sucursal                (id_pk),
  CONSTRAINT id_actividad_pk_fk3               FOREIGN KEY                        (id_actividad_pk_fk3)
                                               REFERENCES actividad               (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla repartido -----------------                  
---------------------------------------------------------------
CREATE TABLE repartido (
        id_animal_pk_fk1                       NUMBER(4),
        id_alimento_pk_fk2                     NUMBER(4),
  CONSTRAINT id_repartido_pk                   PRIMARY KEY                       (id_animal_pk_fk1,id_alimento_pk_fk2),
  CONSTRAINT id_animal_pk_fk1                  FOREIGN KEY                       (id_animal_pk_fk1)
                                               REFERENCES animal                 (id_pk),
  CONSTRAINT id_alimento_pk_fk2                FOREIGN KEY                       (id_alimento_pk_fk2)
                                               REFERENCES alimento               (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla agenda_animal -------------                  
---------------------------------------------------------------
CREATE TABLE agenda_animal (
        id_agenda_pk_fk1                       NUMBER(4)                          NOT NULL,
        id_animal_pk_fk2                       NUMBER(4),
  CONSTRAINT id_agenda_animal                  PRIMARY KEY                        (id_agenda_pk_fk1,id_animal_pk_fk2),
  CONSTRAINT id_agenda_pk_fk1                  FOREIGN KEY                        (id_agenda_pk_fk1)
                                               REFERENCES agenda                  (id_pk),
  CONSTRAINT id_animal_pk_fk2                  FOREIGN KEY                        (id_animal_pk_fk2)
                                               REFERENCES animal                  (id_pk));
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Creacion de la tabla agenda_empleado -----------                  
---------------------------------------------------------------
CREATE TABLE agenda_empleado (
        id_agenda_pk_fk1                       NUMBER(4),
        id_empleado_pk_fk2                     NUMBER(4)                            NOT NULL,
  CONSTRAINT id_agenda_empleado                PRIMARY KEY                         (id_agenda_pk_fk1,id_empleado_pk_fk2),
  CONSTRAINT id_agenda_pk__fk1                 FOREIGN KEY                         (id_agenda_pk_fk1)
                                               REFERENCES agenda                   (id_pk),
  CONSTRAINT id_empleado_pk_fk2                FOREIGN KEY                         (id_empleado_pk_fk2)
                                               REFERENCES empleado                 (numero_pk));	
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla sucursal ----------                   
---------------------------------------------------------------
INSERT INTO sucursal 
VALUES(1000,'Zoologico Rio Piedras','PR-521 Km 125.2','Bo.Socotroco','San Juan','PR',11671,'939-241-1205');	
INSERT INTO sucursal 
VALUES(1001,'Acuario La Cloaca','PR-925 km 54.8','Sector Matones','Moca','PR',21685,'787-242-1210');	
INSERT INTO sucursal 
VALUES(1002,'Vivero El Pescao','521 Calle Altagracia','Puerto Viejo','Morovis','PR',31684,'939-243-1215');	
INSERT INTO sucursal 
VALUES(1003,'Parque del Vino','23 Calle Clemente','Urb Brisas del Cafe','Aguas Buenas','PR',41677,'787-244-1220');	
INSERT INTO sucursal 
VALUES(1004,'Parque el Leon','21 Avenida Constitucion','Urb. Olores del Vertedero','Caguas','PR',52678,'939-245-1225');	
INSERT INTO sucursal 
VALUES(1005,'Acuario La Pirana','59 Calle Sol','Urb. Parque','Ponce','PR',63214,'787-246-1230');	
INSERT INTO sucursal 
VALUES(1006,'Oficina Region Bayamon','150 Ave. Trump','Urb. Biden','Bayamon','PR',87549,'939-247-1235');	
INSERT INTO sucursal 
VALUES(1007,'Oficina Central','412 Ave. Harris','Bo. El Punto','Guaynabo','PR',69937,'787-248-1240');	
INSERT INTO sucursal 
VALUES(1008,'Oficinas Administrativas','85 Calle Rodaballo','Urb. Pradera','Bayamon','PR',57958,'939-249-1245');	
INSERT INTO sucursal 
VALUES(1009,'Parque Ecuestre','876 Calle Bolivar','Urb. Dictadores','Salinas','PR',87942,'787-250-1250');	
INSERT INTO sucursal 
VALUES(1010,'Mariposario Pueblo','877 Calle Barbosa','Urb. Rosa','Rincon','PR',87943,'787-250-1251');	
INSERT INTO sucursal 
VALUES(1011,'Zoologico Caguas','878 Calle Marin','Urb. Lirio','Caguas','PR',87944,'787-250-1252');	
INSERT INTO sucursal 
VALUES(1012,'Zoologico Arecibo','879 Calle Mogote','Urb. Amapola','Arecibo','PR',87945,'787-250-1253');	
INSERT INTO sucursal 
VALUES(1013,'Oficina Region Ponce','880 Calle Romillo','Urb.Colirubia','Ponce','PR',87946,'787-250-1254');	
INSERT INTO sucursal 
VALUES(1014,'Centro Veterinario','881 Calle Baleares','Urb. Reparto Peces','Salinas','PR',87947,'787-250-1255');	
INSERT INTO sucursal 
VALUES(1015,'Almacen de Alimentos','882 Calle Artemia','Urb. Caparra','Arroyo','PR',87948,'787-250-1256');	
INSERT INTO sucursal 
VALUES(1016,'Oficina Jefe Distrito Central','883 Calle Coco','Urb.Conquistador','Vega Baja','PR',87949,'787-250-1257');	
INSERT INTO sucursal 
VALUES(1017,'Zoologico Ceiba','884 Calle Pasas','Urb. Sable','Ceiba','PR',87950,'787-250-1258');	
INSERT INTO sucursal 
VALUES(1018,'Hospital Central','885 Calle Final','Urb. Espada','Carolina','PR',87951,'787-250-1259');	
INSERT INTO sucursal 
VALUES(1019,'Centro de Investigacion','886 Calle Sur','Urb. Metralla','Salinas','PR',87952,'787-250-1260');	
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla contrato ----------                   
---------------------------------------------------------------	
INSERT INTO contrato 
VALUES(4000,'Vence Diciembre');	
INSERT INTO contrato 
VALUES(4001,'Contrato Temporero');
INSERT INTO contrato 
VALUES(4002,'No cualifica Vacaciones');
INSERT INTO contrato 
VALUES(4003,'Vence Enero 2021');
INSERT INTO contrato 
VALUES(4004,'Beneficio Golf');
INSERT INTO contrato 
VALUES(4005,'Incluye Viajes');
INSERT INTO contrato 
VALUES(4006,'Reembolso Gastos');
INSERT INTO contrato 
VALUES(4007,'Servicios Profesionales');
INSERT INTO contrato 
VALUES(4008,'Subcontato personal');
INSERT INTO contrato 
VALUES(4009,'Batata Hijo del dueno');
INSERT INTO contrato 
VALUES(4010,'Vehiculos de lujo');
INSERT INTO contrato 
VALUES(4011,'Avion Privado');
INSERT INTO contrato 
VALUES(4012,'Suministro Alimento');
INSERT INTO contrato 
VALUES(4013,'Contrato a requerimiento');
INSERT INTO contrato 
VALUES(4014,'Cremacion cadaveres');
INSERT INTO contrato 
VALUES(4015,'Reciclaje');
INSERT INTO contrato 
VALUES(4016,'Suministro Alimentos');
INSERT INTO contrato 
VALUES(4017,'Medicamentos');
INSERT INTO contrato 
VALUES(4018,'Material Enfermeria');
INSERT INTO contrato 
VALUES(4019,'Seguridad Instalaciones');
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla plan_medico -------                   
---------------------------------------------------------------	
INSERT INTO plan_medico 
VALUES(5000,'Triple z','787-418-2090');
INSERT INTO plan_medico 
VALUES(5001,'NNN','939-419-2095');
INSERT INTO plan_medico 
VALUES(5002,'NDT','787-420-2100');
INSERT INTO plan_medico 
VALUES(5003,'ABC','939-421-2105');
INSERT INTO plan_medico 
VALUES(5004,'International','787-422-2110');
INSERT INTO plan_medico 
VALUES(5005,'Seguros Baratos','939-423-2115');
INSERT INTO plan_medico 
VALUES(5006,'Plan Nocubrenada','787-424-2120');
INSERT INTO plan_medico 
VALUES(5007,'Plan Pichipen','939-425-2125');
INSERT INTO plan_medico 
VALUES(5008,'Seguros Caravelita','787-426-2130');
INSERT INTO plan_medico 
VALUES(5009,'Plan Cobrotodo','939-427-2135');
INSERT INTO plan_medico 
VALUES(5010,'Salud Enfermito','787-428-2140');
INSERT INTO plan_medico 
VALUES(5011,'Seguros AAA','939-429-2145');
INSERT INTO plan_medico 
VALUES(5012,'PRELIFE','787-430-2150');
INSERT INTO plan_medico 
VALUES(5013,'Plan Postmortem','939-431-2155');
INSERT INTO plan_medico 
VALUES(5014,'Servicios Mortuarios','787-432-2160');
INSERT INTO plan_medico 
VALUES(5015,'Seguros Tlikido','939-433-2165');
INSERT INTO plan_medico 
VALUES(5016,'Plan de Salud Hoyno','787-434-2170');
INSERT INTO plan_medico 
VALUES(5017,'La Tumba Seguros','939-435-2175');
INSERT INTO plan_medico 
VALUES(5018,'Salud Experimental','787-436-2180');
INSERT INTO plan_medico 
VALUES(5019,'New Life Dummies','939-437-2185');
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla alimento ----------                   
---------------------------------------------------------------	
INSERT INTO alimento 
VALUES(8000,'Proplan','Sin Grano','Oz',65);
INSERT INTO alimento 
VALUES(8001,'Hartz','Con grano','Lb',87);
INSERT INTO alimento 
VALUES(8002,'Eukanuba','Alta proteina','Kg',24);
INSERT INTO alimento 
VALUES(8003,'Hills','Sin gluten','Taza',36);
INSERT INTO alimento 
VALUES(8004,'Science Diet','Sin aditivos','ml',34);
INSERT INTO alimento 
VALUES(8005,'Conagra','Sin preservativos','Oz',87);
INSERT INTO alimento 
VALUES(8006,'Granos del Monte','Baja en grasa','Lb',89);
INSERT INTO alimento 
VALUES(8007,'Semillas Ponce','Alta en grasa','Kg',24);
INSERT INTO alimento 
VALUES(8008,'Heno El Quemao','seco','Taza',24);
INSERT INTO alimento 
VALUES(8009,'Hojas de Cannabis','molidas','ml',36);
INSERT INTO alimento 
VALUES(8010,'Steaks de Venado','Frescosy crudos','Oz',54);
INSERT INTO alimento 
VALUES(8011,'Pollos','enteros sin desplumar','Lb',42);
INSERT INTO alimento 
VALUES(8012,'Madera','seca sin humedad','Kg',21);
INSERT INTO alimento 
VALUES(8013,'Insectos Saludables','granos finos','Taza',11);
INSERT INTO alimento 
VALUES(8014,'Guineos del Sur','enteros por racimo','Lb',1);
INSERT INTO alimento 
VALUES(8015,'Roedores Gustosos','Limpios','Oz',14);
INSERT INTO alimento 
VALUES(8016,'Blue','grano pequeno','Lb',35);
INSERT INTO alimento 
VALUES(8017,'Pedigree','a granel','Kg',85);
INSERT INTO alimento 
VALUES(8018,'Medicis','alineto medicado','Taza',15);
INSERT INTO alimento 
VALUES(8019,'Carnes deComer','Crudas en bloque','Kg',10);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla calendario --------                   
---------------------------------------------------------------
INSERT INTO calendario 
VALUES(9001,'Lunes 15 Junio','Dia de Logros');	
INSERT INTO calendario 
VALUES(9002,'Martes 16 Junio','Seminario Agricultura');
INSERT INTO calendario 
VALUES(9003,'Miercoles 17 Junio','Charla Contra Violencia');
INSERT INTO calendario 
VALUES(9004,'Jueves 18 Junio','Educacion Continua Veterinarios');
INSERT INTO calendario 
VALUES(9005,'Viernes 19 Junio','Clase de Biologia');
INSERT INTO calendario 
VALUES(9006,'Sabado 20 Junio','Gira Escuela Donald J. Trump');
INSERT INTO calendario 
VALUES(9007,'Domingo 21 Junio','Dia de Los Padres');
INSERT INTO calendario 
VALUES(9008,'Lunes 22 Junio','Competencias de Rodeo');
INSERT INTO calendario 
VALUES(9009,'Martes 23 Junio','Identificacion de Aves');
INSERT INTO calendario 
VALUES(9010,'Miercoles 24 Junio','Terapias de Ninos');
INSERT INTO calendario 
VALUES(9011,'Jueves 25 Junio','Clases de Cuidado de Mascotas');
INSERT INTO calendario 
VALUES(9012,'Viernes 26 Junio','Adopcion de Mascotas');
INSERT INTO calendario 
VALUES(9013,'Sabado 27 Junio','Clases de Yoga');
INSERT INTO calendario 
VALUES(9014,'Domingo 28 Junio','Meditaciones con Animales');
INSERT INTO calendario 
VALUES(9015,'Lunes 29 Junio','Trae tu Mascota al Zoologico');
INSERT INTO calendario 
VALUES(9016,'Martes 30 Junio','Maraton del Lechon');
INSERT INTO calendario 
VALUES(9017,'Miercoles 1 Julio','Carreras de Cerditos');
INSERT INTO calendario 
VALUES(9018,'Jueves 2 Julio','Peleas de Gallos');
INSERT INTO calendario 
VALUES(9019,'Viernes 3 Julio','Visita al mariposario');
INSERT INTO calendario 
VALUES(9020,'Sabado 4 Julio','Independencia USA');		  
SHOW USER
SELECT systimestamp FROM dual; 
---------------------------------------------------------------
-------------- Insertando datos en la tabla actividad ---------                   
---------------------------------------------------------------
INSERT INTO actividad 
VALUES(9050,'Concierto de Verano',2.00);
INSERT INTO actividad 
VALUES(9051,'Dia del los hijos ',3.00);
INSERT INTO actividad 
VALUES(9052,'Donacion de Pelo',2.50);
INSERT INTO actividad 
VALUES(9053,'Donativos de Alimento',1.00);
INSERT INTO actividad 
VALUES(9054,'Fiesta Solsiticio',0.30);
INSERT INTO actividad 
VALUES(9055,'Noche de San Juan',3.00);
INSERT INTO actividad 
VALUES(9056,'Mirando las Estrellas',1.50);
INSERT INTO actividad 
VALUES(9057,'Paseos de Animales',2.30);
INSERT INTO actividad 
VALUES(9058,'Graduacion Kinder',0.45);
INSERT INTO actividad 
VALUES(9059,'Cirugia de Ranas',10.00);
INSERT INTO actividad 
VALUES(9060,'Clases de Biologia',8.00);
INSERT INTO actividad 
VALUES(9061,'Practica de Veterinarios',2.00);
INSERT INTO actividad 
VALUES(9062,'Clases de Tablajero',1.00);
INSERT INTO actividad 
VALUES(9063,'Construccion de Jaulas',3.00);
INSERT INTO actividad 
VALUES(9064,'Jardineria Paisajista',2.00);
INSERT INTO actividad 
VALUES(9065,'Charla Douglas Candelario',1.00);
INSERT INTO actividad 
VALUES(9066,'Agronomia Basica',3.00);
INSERT INTO actividad 
VALUES(9067,'Agrimesnura Digital',2.00);
INSERT INTO actividad 
VALUES(9068,'Conservacion de Recursos',1.50);
INSERT INTO actividad 
VALUES(9069,'Purificacion de Agua',2.30);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla departamento ------                   
---------------------------------------------------------------
INSERT INTO departamento 
VALUES(3000,'Veterinaria','Piso 1 Edif. Medico',1000);
INSERT INTO departamento 
VALUES(3001,'Administracion','Piso 8 Edif Principal',1001);
INSERT INTO departamento 
VALUES(3002,'Mantenimiento','Lote 23 Zona Industrial',1002);
INSERT INTO departamento 
VALUES(3003,'Recursos Humanos','Piso 4 Edificio Sur',1003);
INSERT INTO departamento 
VALUES(3004,'Ingenieria','Piso 5 Edificio Norte',1004);
INSERT INTO departamento 
VALUES(3005,'Construccion','Local 3 Zona Este',1005);
INSERT INTO departamento 
VALUES(3006,'Ornato','Local 7 Zona Industrial',1006);
INSERT INTO departamento 
VALUES(3007,'Limpieza','Piso G Zona Principal',1007);
INSERT INTO departamento 
VALUES(3008,'Contabilidad','Piso 7 Edificio Principal',1008);
INSERT INTO departamento 
VALUES(3009,'Operaciones','Piso 2 Zona Portuaria',1009);
INSERT INTO departamento 
VALUES(3010,'Finanzas','Edificio Leon Suite 5',1010);
INSERT INTO departamento 
VALUES(3011,'Ambiental','Lote 24 Zona Industrial',1011);
INSERT INTO departamento 
VALUES(3012,'Nutricion','Piso 5 Edificio Este',1012);
INSERT INTO departamento 
VALUES(3013,'Entretenimiento','Piso 4 Edificio Oeste',1013);
INSERT INTO departamento 
VALUES(3014,'Legal','S10 Edificio Infernal',1014);
INSERT INTO departamento 
VALUES(3015,'Mercadeo','Edificio Billete Suite 2',1015);
INSERT INTO departamento 
VALUES(3016,'Turismo','Torre Norte Piso 2',1016);
INSERT INTO departamento 
VALUES(3017,'Gobierno','Torre Sur Piso 3',1017);
INSERT INTO departamento 
VALUES(3018,'Transportacion','Zona Industrial Alfa',1018);
INSERT INTO departamento 
VALUES(3019,'Enfermeria','Edificio Principal Piso G',1019);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla empleado ----------                   
---------------------------------------------------------------
INSERT INTO empleado 
VALUES(2000,'Erick','A','Gomez','angeles','P','787-250-1250','aa@gmail.com',null,null,null,null,30000,'APBPR',300.00,1000,3001,null,null);
INSERT INTO empleado 
VALUES(2001,'Paloma','B','Gonzalez','Castellanos','G','939-259-1295','pcast@yahoo.com',null,null,null,null,null,null,null,1001,3001,null,4001);
INSERT INTO empleado 
VALUES(2002,'Patricia','C','Guinto','Guitart','P','787-264-1320','pguin@gmail.com',null,null,null,null,30001,'PTU',500.00,1002,3000,null,null);
INSERT INTO empleado 
VALUES(2003,'Joaquin','D','Hernandez','Laguillo','A','787-268-1340','jlagui@lycos.com',2500.00,'Activo',null,null,null,null,null,1003,3001,5003,null);
INSERT INTO empleado 
VALUES(2004,'Higinio',null,'Legaspi','Gongora','G','787-272-1360','higon@gmail.com',null,null,null,null,null,null,null,1004,3002,null,4004);
INSERT INTO empleado 
VALUES(2005,'Aquiles','F','Lopez','Herrera','M','787-274-1370','alo@yahoo.com',null,null,80,800.00,null,null,null,1005,3019,null,null);
INSERT INTO empleado 
VALUES(2006,'Carlos','G','Macias',null,'P','939-291-1455','carmag@gmail.com',null,null,null,null,30002,'PMDC',250.00,1006,3006,null,null);
INSERT INTO empleado 
VALUES(2007,'Fernando','H','Majluf','Guzman','G','787-296-1480','fema@yahoo.com',null,null,null,null,null,null,null,1007,3013,null,4007);
INSERT INTO empleado 
VALUES(2008,'Simon','I','Mendoza','Sanchez','A','939-303-1515','lhamilton@merc.com',1800.00,'Suspendido',null,null,null,null,null,1008,3008,5008,null);
INSERT INTO empleado 
VALUES(2009,'Rodolfo','J','Mohar','Montano','G','787-306-1530','simen@gmail.com',null,null,null,null,null,null,null,1009,3011,null,4009);
INSERT INTO empleado 
VALUES(2010,'Lewis','L','Hamilton','Rodriguez','G','787-374-2015','romo@yahoo.com',null,null,null,null,null,null,null,1010,3010,null,4010);
INSERT INTO empleado 
VALUES(2011,'Valtteri',null,'Bottas',null,'P','939-655-8547','vbottas@coqui.net',null,null,null,null,30003,'PMDC',325.00,1011,3011,null,null);
INSERT INTO empleado 
VALUES(2012,'Max','M','Verstappen','Perez','G','787-321-5879','mverstappen@redbull.com',null,null,null,null,null,null,null,1012,3012,null,4012);
INSERT INTO empleado 
VALUES(2013,'Charles','C','Leclerc','Lugo','M','787-587-8714','cleclerc@ferrari.com',null,null,50,500.00,null,null,null,1013,3013,null,null);
INSERT INTO empleado 
VALUES(2014,'Daniel','D','Ricciardo',null,'G','787-418-8520','dricciardo@renault.com',null,null,null,null,null,null,null,1014,3014,null,null);
INSERT INTO empleado 
VALUES(2015,'Sergio','S','Perez','Morales','A','787-419-8521','sperez@rp.com',1782.00,'Vacaciones',null,null,null,null,null,1015,3015,5015,null);
INSERT INTO empleado 
VALUES(2016,'Lando','L','Norris','Ramos','M','787-412-8522','lnorris@mclaren.com',null,null,75,750.00,null,null,null,1016,3016,null,null);
INSERT INTO empleado 
VALUES(2017,'Carlos','C','Sainz','Marrero','G','787-427-8523','csainz@mclaren.com',null,null,null,null,null,null,null,1017,3011,null,4017);
INSERT INTO empleado 
VALUES(2018,'Alexander','A','Albon','Morgan','M','787-517-8524','aalbon@redbull.com',null,null,100,1000.00,null,null,null,1018,3011,null,null);
INSERT INTO empleado 
VALUES(2019,'Pierre',null,'Gasly','Clay','A','787-617-8525','pgasly@tororosso.com',3600.00,'Reasignado',null,null,null,null,null,1019,3019,5019,null);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla cueva -------------                   
---------------------------------------------------------------
DROP SEQUENCE sequence_1;
CREATE SEQUENCE sequence_1
start with 6000
increment by 1
minvalue 5999
maxvalue 6020
cycle;

INSERT INTO cueva 
VALUES(sequence_1.nextval,1000);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1000);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1002);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1003);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1004);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1004);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1006);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1007);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1008);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1009);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1002);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1011);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1012);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1013);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1014);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1011);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1000);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1017);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1017);
INSERT INTO cueva 
VALUES(sequence_1.nextval,1011);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla animal ------------                   
---------------------------------------------------------------
INSERT INTO animal 
VALUES(7000,'Yuyo','Primate',40.35,65.52,6000);
INSERT INTO animal 
VALUES(7001,'Juan ramon','Felino',21.00,87.13,6001);
INSERT INTO animal 
VALUES(7002,'Chupi','Canino',14.00,24.17,6002);
INSERT INTO animal 
VALUES(7003,'Manuel','Ave',28.00,36.63,6003);
INSERT INTO animal 
VALUES(7004,'Aurora','Reptil',45.00,34.37,6004);
INSERT INTO animal 
VALUES(7005,'Carlos','Insecto',1.98,87.00,6005);
INSERT INTO animal 
VALUES(7006,'Igor','Primate',25.87,89.01,6000);
INSERT INTO animal 
VALUES(7007,'Cesar','Felino',65.43,24.00,6001);
INSERT INTO animal 
VALUES(7008,'Margarita','Canino',41.00,24.90,6002);
INSERT INTO animal 
VALUES(7009,'Blanca estela','Ave',25.00,36.35,6003);
INSERT INTO animal 
VALUES(7010,'Efrain','Reptil',14.00,54.00,6010);
INSERT INTO animal 
VALUES(7011,'Alejandro','Insecto',2.23,42.00,6011);
INSERT INTO animal 
VALUES(7012,'Nestor fabian','Primate',28.00,21.00,6000);
INSERT INTO animal 
VALUES(7013,'Claudia amelia','Felino',36.00,11.67,6000);
INSERT INTO animal 
VALUES(7014,'Koko','Canino',24.00,5.00,6011);
INSERT INTO animal 
VALUES(7015,'Manuel','Ave',51.90,14.00,6003);
INSERT INTO animal 
VALUES(7016,'Manuel antonio','Reptil',12.00,35.58,6004);
INSERT INTO animal 
VALUES(7017,'Luis gerardo','Insecto',3.00,85.00,6005);
INSERT INTO animal 
VALUES(7018,'Jose guillermo','Ave',4.00,15.00,6003);
INSERT INTO animal 
VALUES(7019,'Judith guadalupe','Reptil',36.00,10.35,6004);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla agenda ------------                   
---------------------------------------------------------------
INSERT INTO agenda 
VALUES(9075,'Primera Semana Junio',9050);
INSERT INTO agenda 
VALUES(9076,'3 al 6 de junio nocturno',9051);
INSERT INTO agenda 
VALUES(9077,'Actividad Sabatina',9052);
INSERT INTO agenda 
VALUES(9078,'Solo vespertino',9053);
INSERT INTO agenda 
VALUES(9079,'Madrugadas  de 12 a 6',9054);
INSERT INTO agenda 
VALUES(9080,'Seguna semana de junio',9055);
INSERT INTO agenda 
VALUES(9081,'Solo del 8 al 10 de junio',9056);
INSERT INTO agenda 
VALUES(9082,'4 de julio al cierre del parque',9057);
INSERT INTO agenda 
VALUES(9083,'Apertura del Parque',9058);
INSERT INTO agenda 
VALUES(9084,'Solo para las primeras 100 entradas',9059);
INSERT INTO agenda 
VALUES(9085,'Solo para adultos',9060);
INSERT INTO agenda 
VALUES(9086,'Solo para ninos',9061);
INSERT INTO agenda 
VALUES(9087,'Solo para Senior Citizens',9062);
INSERT INTO agenda 
VALUES(9088,'Solo para parejas',9063);
INSERT INTO agenda 
VALUES(9089,'Solo para mujeres',9064);
INSERT INTO agenda 
VALUES(9090,'Mascotas con cadena',9065);
INSERT INTO agenda 
VALUES(9091,'1 al 4 de julio',9066);
INSERT INTO agenda 
VALUES(9092,'Actividad Dominical',9067);
INSERT INTO agenda 
VALUES(9093,'Dias de semana solamente',9068);
INSERT INTO agenda 
VALUES(9094,'Almuerzos de 12 a 1 de la tarde',9069);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla evento ------------                   
---------------------------------------------------------------
INSERT INTO evento 
VALUES(9001,1000,9050);
INSERT INTO evento 
VALUES(9002,1001,9051);
INSERT INTO evento 
VALUES(9003,1002,9052);
INSERT INTO evento 
VALUES(9004,1003,9053);
INSERT INTO evento 
VALUES(9005,1004,9054);
INSERT INTO evento 
VALUES(9006,1005,9055);
INSERT INTO evento 
VALUES(9007,1006,9056);
INSERT INTO evento 
VALUES(9008,1007,9057);
INSERT INTO evento 
VALUES(9009,1008,9058);
INSERT INTO evento 
VALUES(9010,1009,9059);
INSERT INTO evento 
VALUES(9011,1010,9060);
INSERT INTO evento 
VALUES(9012,1011,9061);
INSERT INTO evento 
VALUES(9013,1012,9062);
INSERT INTO evento 
VALUES(9014,1013,9063);
INSERT INTO evento 
VALUES(9015,1014,9064);
INSERT INTO evento 
VALUES(9016,1015,9065);
INSERT INTO evento 
VALUES(9017,1016,9066);
INSERT INTO evento 
VALUES(9018,1017,9067);
INSERT INTO evento 
VALUES(9019,1018,9068);
INSERT INTO evento 
VALUES(9020,1019,9069);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla repartido ---------                   
---------------------------------------------------------------
INSERT INTO repartido 
VALUES(7000,8000);
INSERT INTO repartido 
VALUES(7001,8001);
INSERT INTO repartido 
VALUES(7002,8002);
INSERT INTO repartido 
VALUES(7003,8003);
INSERT INTO repartido 
VALUES(7004,8004);
INSERT INTO repartido 
VALUES(7005,8005);
INSERT INTO repartido 
VALUES(7006,8006);
INSERT INTO repartido 
VALUES(7007,8007);
INSERT INTO repartido 
VALUES(7008,8008);
INSERT INTO repartido 
VALUES(7009,8009);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla agenda_animal -----                   
---------------------------------------------------------------
INSERT INTO agenda_animal 
VALUES(9075,7000);
INSERT INTO agenda_animal 
VALUES(9076,7001);
INSERT INTO agenda_animal 
VALUES(9077,7002);
INSERT INTO agenda_animal 
VALUES(9078,7003);
INSERT INTO agenda_animal 
VALUES(9079,7004);
INSERT INTO agenda_animal 
VALUES(9080,7005);
INSERT INTO agenda_animal 
VALUES(9081,7006);
INSERT INTO agenda_animal 
VALUES(9082,7007);
INSERT INTO agenda_animal 
VALUES(9083,7008);
INSERT INTO agenda_animal 
VALUES(9084,7009);
SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------------------------
-------------- Insertando datos en la tabla agenda_empleado ---                   
---------------------------------------------------------------
INSERT INTO agenda_empleado 
VALUES(9075,2000);
INSERT INTO agenda_empleado 
VALUES(9076,2001);
INSERT INTO agenda_empleado 
VALUES(9077,2002);
INSERT INTO agenda_empleado 
VALUES(9078,2003);
INSERT INTO agenda_empleado 
VALUES(9079,2004);
INSERT INTO agenda_empleado 
VALUES(9080,2005);
INSERT INTO agenda_empleado 
VALUES(9081,2006);
INSERT INTO agenda_empleado 
VALUES(9082,2007);
INSERT INTO agenda_empleado 
VALUES(9083,2008);
INSERT INTO agenda_empleado 
VALUES(9084,2009);
SHOW USER
SELECT systimestamp FROM dual;
----------------------------------------------
-------------- Ejecutando Queries ------------ 
----------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
--A
SELECT * 
FROM animal;

SHOW USER
SELECT systimestamp FROM dual;
--B
DESC alimento;

SHOW USER
SELECT systimestamp FROM dual;
--C
SELECT primer_nombre||' '|| inicial || ' ' || apellido_paterno ||' '|| apellido_materno AS "NOMBRE COMPLETO", celular, correo_electronico AS "EMAIL"
FROM empleado;

SHOW USER
SELECT systimestamp FROM dual;
--D                                                                         
SELECT animal.nombre AS "NOMBRE", animal.id_cueva_fk1 AS"ID CUEVA", sucursal.nombre AS "NOMBRE DE SUCURSAL"
FROM animal 
JOIN cueva ON animal.id_cueva_fk1 = cueva.id_pk
JOIN sucursal ON sucursal.id_pk = cueva.id_sucursal_fk1;

SHOW USER
SELECT systimestamp FROM dual;
--E
SELECT especie AS "ESPECIE", COUNT(especie) AS "CANTIDAD"
FROM animal
GROUP BY especie
ORDER BY COUNT(especie) DESC;

SHOW USER
SELECT systimestamp FROM dual;
--F               
SELECT nombre AS "ANIMAL CON MAYOR Y MENOR PESO", peso
FROM animal
WHERE peso IN 
((SELECT MAX(peso) FROM animal), 
( SELECT MIN(peso) FROM animal));

SHOW USER
SELECT systimestamp FROM dual;
--G
SELECT especie AS "ESPECIE", AVG(estatura) AS "ESTATURA PROMEDIO"
FROM animal
WHERE especie = 'Ave'
GROUP BY especie;

SHOW USER
SELECT systimestamp FROM dual;
--H 
SELECT nombre AS "DEPARTAMENTO", COUNT(id_departamento_fk2) AS "CANTIDAD DE EMPLEADOS"
FROM departamento LEFT OUTER JOIN empleado 
ON departamento.id_pk = empleado.id_departamento_fk2
GROUP BY nombre
ORDER BY COUNT(id_departamento_fk2) DESC;

SHOW USER
SELECT systimestamp FROM dual;
--I
SELECT primer_nombre||' '|| inicial || ' ' || apellido_paterno ||' '|| apellido_materno AS "NOMBRE COMPLETO", tipo_emp AS "T" 
FROM empleado
WHERE tipo_emp ='A';

SHOW USER
SELECT systimestamp FROM dual;
--J 
SELECT cueva.id_pk AS "CUEVAS DISPONIBLES"
FROM cueva FULL OUTER JOIN animal
ON cueva.id_pk = animal.id_cueva_fk1
WHERE animal.id_cueva_fk1 IS NULL
ORDER BY cueva.id_pk ASC;


----------------------------------------------
------- CREANDO REPORTE EN SQL-PLUS ---------- 
----------------------------------------------


   ---------------------------------------------
   --   Author: Gabriel E. Rodriguez Garcia   --
   --   Comentarios: Este sript corre y crea  --
   --   un reporte de los empleados y sus     --
   --   departamentos.                        --
   ---------------------------------------------

SET ECHO OFF
SET PAGESIZE 70
SET LINESIZE 200
SET FEEDBACK OFF

TTITLE 'REPORTE DE EMPLEADOS'
BTITLE 'ReporteEmpleados.sql'

COLUMN  primer_nombre                      HEADING  'NOMBRE'                       FORMAT A15
COLUMN  inicial                            HEADING  'INICIAL'                      FORMAT A1
COLUMN  apellido_paterno                   HEADING  'APELLIDO PATERNO'             FORMAT A20
COLUMN  apellido_materno                   HEADING  'APELLIDO MATERNO'             FORMAT A20
COLUMN  celular                            HEADING  'CELULAR'                      FORMAT A13
COLUMN  correo_electronico                 HEADING  'EMAIL'                        FORMAT A25
COLUMN  nombre                             HEADING  'DEPARTAMENTO'                 FORMAT 99999
COLUMN  tipo_emp                           HEADING  'TIPO DE EMPLEADO'             FORMAT A1
COLUMN  numero_pk                          HEADING  'NUMERO DE EMPLEADO'           FORMAT 99999

BREAK         ON numero_pk    SKIP 1         ON  REPORT
COMPUTE count OF numero_pk    SKIP 1         ON  REPORT
SPOOL ON
SPOOL C:\Users\grgar\Desktop\ReporteEmpleados.txt

SELECT DISTINCT primer_nombre, inicial ,apellido_paterno,apellido_materno,celular, correo_electronico, tipo_emp, departamento.nombre, empleado.numero_pk
FROM empleado FULL OUTER JOIN departamento
ON (empleado.id_departamento_fk2 = departamento.id_pk) 
WHERE empleado.id_departamento_fk2 IS NOT NULL 
GROUP BY primer_nombre, inicial,apellido_paterno, apellido_materno,celular, correo_electronico, tipo_emp, departamento.nombre,empleado.numero_pk;
		   
SELECT nombre, COUNT(id_departamento_fk2) AS CANTIDAD
FROM departamento LEFT OUTER JOIN empleado 
ON departamento.id_pk = empleado.id_departamento_fk2
GROUP BY nombre
ORDER BY COUNT(id_departamento_fk2) DESC;


CLEAR COMPUTE
CLEAR BREAK
COLUMN primer_nombre             CLEAR
COLUMN inicial                   CLEAR 
COLUMN apellido_paterno          CLEAR
COLUMN apellido_materno          CLEAR
COLUMN celular                   CLEAR
COLUMN correo_electronico        CLEAR
COLUMN tipo_emp                  CLEAR
COLUMN numero_pk                 CLEAR
SPOOL   OFF
BTITLE  OFF
TTITLE  OFF
SET FEEDBACK  ON
SET PAGESIZE 14
SET ECHO ON


SHOW USER
SELECT systimestamp FROM dual;
---------------------------------------------
-------------- Borrando Tablas ------------- 
--------------------------------------------
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda_empleado;
DROP TABLE agenda_empleado CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda_animal;
DROP TABLE agenda_animal   CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE repartido;
DROP TABLE repartido       CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE evento;
DROP TABLE evento          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE agenda;
DROP TABLE agenda          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE animal;
DROP TABLE animal          CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
DROP TABLE cueva           CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE empleado;
DROP TABLE empleado        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
DROP TABLE departamento    CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE actividad;
DROP TABLE actividad       CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE calendario;
DROP TABLE calendario      CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE alimento;
DROP TABLE alimento        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE plan_medico;
DROP TABLE plan_medico     CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE contrato;
DROP TABLE contrato        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;
TRUNCATE TABLE sucursal;
DROP TABLE sucursal        CASCADE CONSTRAINTS;
SHOW USER
SELECT systimestamp FROM dual;

