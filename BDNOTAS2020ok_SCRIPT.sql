-- CREACION DE BASE DE DATOS  (DATA y LOG)
USE master
go

IF DB_ID('BDNOTAS2020ok') IS NOT NULL
BEGIN
	ALTER DATABASE BDNOTAS2020ok
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	
	DROP DATABASE BDNOTAS2020ok
END	
GO

CREATE DATABASE BDNOTAS2020ok
COLLATE MODERN_SPANISH_CI_AI
GO

USE BDNOTAS2020ok
go
SET LANGUAGE SPANISH
GO
SET NOCOUNT ON
GO

-- Creación de las Tablas y Claves Primarias
-- -----------------------------------------

CREATE TABLE ESPECIALIDAD (
	codesp	char(3) NOT NULL PRIMAry key,
    nomesp	varchar(30) NOT NULL,
    costo   int not null
)
go

CREATE TABLE ALUMNOS (
	codalumno	char(5) NOT NULL primary key,
    apealumno   varchar(30) NOT NULL,
    nomalumno   varchar(30) NOT NULL,
    codesp      char(3) NOT NULL REFERENCES ESPECIALIDAD,
    colegio     varchar(50) default('Sin Nombre'),
	eliminado	char(2) default('No')
) 
go

CREATE TABLE PAGOS (
	codpago		int identity(1001,1) NOT NULL Primary Key,	
    codalumno	char(5) NOT NULL REFERENCES ALUMNOS,
    semestre    char(6) NOT NULL,
    ncuota      int NOT NULL,
    monto       int NOT NULL,
    fecha       datetime,
    pagado		char(2) default('No'),
    constraint unique_Pagos UNIQUE(codalumno, semestre, ncuota) 
)
go


CREATE TABLE CURSOS (
	codcurso	char(5) NOT NULL primary key,
    nomcurso    varchar(50) NOT NULL,
    nhoras		int,
	tipo		varchar(2) default('P'),
	eliminado	char(2) default('No')
)
go

CREATE TABLE NOTAS (
	nroreg		int identity(1,1) NOT NULL Primary Key,	
	fechareg    datetime,
    codalumno   char(5) NOT NULL REFERENCES ALUMNOS,
    codcurso    char(5) NOT NULL REFERENCES CURSOS,
	semestre	char(6) NOT NULL,
    ntrabajo	int,
	nparcial    int,
    nfinal      int,
    eliminado	char(2) default('No'),
       constraint unique_Notas UNIQUE(codalumno,codcurso,semestre)
)
go


Insert Into ESPECIALIDAD Values('E01','Computacion e Informatica',2500)
Insert Into ESPECIALIDAD Values('E02','Administracion',1800)
Insert Into ESPECIALIDAD Values('E03','Contabilidad',2000)
Insert Into ESPECIALIDAD Values('E04','Idiomas',1800)
Insert Into ESPECIALIDAD Values('E05','Ing. de Sistemas',2800)
Insert Into ESPECIALIDAD Values('E06','Diseño Grafico',2500)
GO

Insert Into ALUMNOS Values('A0001','Valencia salcedo','Christian','E01','RICARDO PALMA','No')
Insert Into ALUMNOS Values('A0002','Ortiz Rodriguez','Freddy','E01','ALFONSO UGARTE','No')
Insert Into ALUMNOS Values('A0003','Silva Mejia','Ruth Ketty','E02','BARTOLOME HERRERA','No')
Insert Into ALUMNOS Values('A0004','Melendez Noriega','Liliana','E03','RICARDO PALMA','No')
Insert Into ALUMNOS Values('A0005','Huerta Leon','Silvia','E04','SANTA CRUZ','No')
Insert Into ALUMNOS Values('A0006','Carranza Fuentes','Maria Elena','E02','PALMER','No')
Insert Into ALUMNOS Values('A0007','Prado Castro','Gabriela','E01','TRILCE','No')
Insert Into ALUMNOS Values('A0008','Atuncar Mesias','Juan','E05','PALMER','No')
Insert Into ALUMNOS Values('A0009','Aguilar Zavala','Patricia Elena','E01','RICARDO PALMA','No')
Insert Into ALUMNOS Values('A0010','Rodruigez Trujillo','Rubén Eduardo','E01','SANTA CRUZ','No')
Insert Into ALUMNOS Values('A0011','Canales Ruiz','Gino Leonel','E02','ALFONSO UGARTE','No')
Insert Into ALUMNOS Values('A0012','Ruiz Quispe','Edgar','E02','SANTA CRUZ','No')
Insert Into ALUMNOS Values('A0013','PanduroTerrazas','Omar','E03','PALMER','No')
Insert Into ALUMNOS Values('A0014','Zita Padilla','Peter Wilmer','E03','PALMER','No')
Insert Into ALUMNOS Values('A0015','Ternero Ubillús','Luis','E05','TRILCE','No')
Insert Into ALUMNOS Values('A0016','Rivera García','Raúl Joel','E04','RICARDO PALMA','No')
Insert Into ALUMNOS Values('A0017','Pomar García','Ana','E04','MELITON CARBAJAL','No')
Insert Into ALUMNOS Values('A0018','Palomares Venegas','Mercedes','E04','ALFONSO UGARTE','No')
Insert Into ALUMNOS Values('A0019','Ruiz Venegaz','Luis Alberto','E04','SAN MARTIN','No')
Insert Into ALUMNOS Values('A0020','Tejada Bernal','Janet','E04','SACO OLIVEROS','No')
Insert Into ALUMNOS Values('A0021','Sotelo Canales','Juan Carlos','E05','PALMER','No')
Insert Into ALUMNOS Values('A0022','LLosa Montalvan','Karla','E05','TRILCE','No')
Insert Into ALUMNOS Values('A0023','Galarza Torres','Hugo','E03','SACO OLIVEROS','No')
Insert Into ALUMNOS Values('A0024','Valverde Jaramillo','Saul','E05','PALMER','No')
Insert Into ALUMNOS Values('A0025','Cipriano Avila','Roxana','E04','ALFONSO UGARTE','No')
Insert Into ALUMNOS Values('A0026','Rodriguez Quispe','Luis Alberto','E05','SACO OLIVEROS','No')
Insert Into ALUMNOS Values('A0027','Huerta Leon','Marco Antonio','E05','RICARDO PALMA','No')
Insert Into ALUMNOS Values('A0028','Ortiz Fuentes','Ana María','E04','PALMER','No')
Insert Into ALUMNOS Values('A0029','Rivera Jaramillo','Martha','E05','TRILCE','No')
Insert Into ALUMNOS Values('A0030','Bustamante Campos','Guino','E05','SACO OLIVEROS','No')
GO

--  PAGOS   CORRESPONDIENTES
Insert Into PAGOS Values('A0001','2018-1',1,300,'10/04/2018','No')
Insert Into PAGOS Values('A0001','2018-1',2,340,'11/05/2018','No')
Insert Into PAGOS Values('A0001','2018-1',3,340,'12/06/2018','No')
Insert Into PAGOS Values('A0002','2018-1',1,370,'11/04/2018','No')
Insert Into PAGOS Values('A0002','2018-1',2,340,'08/06/2018','No')
Insert Into PAGOS Values('A0003','2018-1',1,340,'04/05/2018','No')
Insert Into PAGOS Values('A0003','2018-1',2,340,'12/06/2018','No')
Insert Into PAGOS Values('A0003','2018-1',3,340,'10/06/2018','No')
Insert Into PAGOS Values('A0004','2018-1',1,300,'03/05/2018','No')
Insert Into PAGOS Values('A0004','2018-1',2,380,'01/06/2018','No')
Insert Into PAGOS Values('A0005','2018-1',1,350,'15/04/2018','No')
Insert Into PAGOS Values('A0005','2018-1',2,360,'18/05/2018','No')
Insert Into PAGOS Values('A0006','2018-1',3,300,'13/04/2018','No')
Insert Into PAGOS Values('A0006','2018-1',1,340,'11/05/2018','No')
Insert Into PAGOS Values('A0006','2018-1',2,390,'12/06/2018','No')
Insert Into PAGOS Values('A0007','2018-1',1,340,'10/05/2018','No')
Insert Into PAGOS Values('A0007','2018-1',2,380,'04/06/2018','No')
Insert Into PAGOS Values('A0007','2018-1',3,440,'30/06/2018','No')
Insert Into PAGOS Values('A0008','2018-1',1,340,'14/04/2018','No')
Insert Into PAGOS Values('A0008','2018-1',2,320,'11/05/2018','No')
Insert Into PAGOS Values('A0009','2018-1',1,340,'07/05/2018','No')
Insert Into PAGOS Values('A0009','2018-1',2,330,'10/05/2018','No')
Insert Into PAGOS Values('A0009','2018-1',3,340,'12/06/2018','No')
Insert Into PAGOS Values('A0010','2018-1',1,340,'13/05/2018','No')
Insert Into PAGOS Values('A0010','2018-1',2,330,'04/06/2018','No')
Insert Into PAGOS Values('A0010','2018-1',3,350,'30/06/2018','No')
Insert Into PAGOS Values('A0011','2018-2',1,340,'11/10/2018','No')
Insert Into PAGOS Values('A0011','2018-2',2,330,'15/11/2018','No')
Insert Into PAGOS Values('A0011','2018-2',3,370,'11/12/2018','No')
Insert Into PAGOS Values('A0012','2018-2',1,340,'11/08/2018','No')
Insert Into PAGOS Values('A0012','2018-2',2,370,'02/09/2018','No')
Insert Into PAGOS Values('A0012','2018-2',3,390,'15/10/2018','No')
Insert Into PAGOS Values('A0013','2018-2',1,340,'11/08/2018','No')
Insert Into PAGOS Values('A0013','2018-2',2,340,'10/09/2018','No')
Insert Into PAGOS Values('A0013','2018-2',3,350,'02/11/2018','No')
Insert Into PAGOS Values('A0013','2018-2',4,370,'11/12/2018','No')
Insert Into PAGOS Values('A0014','2018-2',1,340,'11/10/2018','No')
Insert Into PAGOS Values('A0014','2018-2',2,330,'20/11/2018','No')
Insert Into PAGOS Values('A0014','2018-2',3,350,'14/12/2018','No')
Insert Into PAGOS Values('A0016','2018-2',1,340,'04/09/2018','No')
Insert Into PAGOS Values('A0016','2018-2',2,360,'10/10/2018','No')
Insert Into PAGOS Values('A0016','2018-2',3,340,'12/12/2018','No')
Insert Into PAGOS Values('A0021','2018-2',1,340,'11/07/2018','No')
Insert Into PAGOS Values('A0021','2018-2',2,480,'10/08/2018','No')
Insert Into PAGOS Values('A0021','2018-2',3,340,'15/09/2018','No')
Insert Into PAGOS Values('A0022','2018-2',1,340,'01/08/2018','No')
Insert Into PAGOS Values('A0022','2018-2',2,330,'04/09/2018','No')
Insert Into PAGOS Values('A0022','2018-2',3,350,'12/10/2018','No')
Insert Into PAGOS Values('A0023','2018-2',1,340,'11/09/2018','No')
Insert Into PAGOS Values('A0023','2018-2',2,370,'21/10/2018','No')
Insert Into PAGOS Values('A0023','2018-2',3,370,'14/11/2018','No')
Insert Into PAGOS Values('A0024','2018-2',1,340,'11/08/2018','No')
Insert Into PAGOS Values('A0024','2018-2',2,340,'08/09/2018','No')
Insert Into PAGOS Values('A0024','2018-2',3,340,'14/10/2018','No')
Insert Into PAGOS Values('A0024','2018-2',4,340,'05/12/2018','No')
Insert Into PAGOS Values('A0025','2018-2',1,340,'10/08/2018','No')
Insert Into PAGOS Values('A0025','2018-2',2,370,'13/09/2018','No')
Insert Into PAGOS Values('A0028','2018-2',1,340,'11/10/2018','No')
Insert Into PAGOS Values('A0028','2018-2',2,390,'13/11/2018','No')
go

Insert Into PAGOS Values('A0002','2019-1',1,300,'10/02/2019','No')
Insert Into PAGOS Values('A0002','2019-1',2,370,'16/03/2019','No')
Insert Into PAGOS Values('A0002','2019-1',3,360,'12/04/2019','No')
Insert Into PAGOS Values('A0003','2019-1',1,350,'14/03/2019','No')
Insert Into PAGOS Values('A0003','2019-1',2,350,'14/03/2019','No')
Insert Into PAGOS Values('A0004','2019-1',1,370,'10/05/2019','No')
Insert Into PAGOS Values('A0004','2019-1',2,370,'10/05/2019','No')
Insert Into PAGOS Values('A0005','2019-1',1,380,'09/04/2019','No')
Insert Into PAGOS Values('A0005','2019-1',2,380,'09/05/2019','No')
GO

-- NUEVOS
Insert Into PAGOS Values('A0024','2019-1',1,340,'10/05/2019','No')
Insert Into PAGOS Values('A0024','2019-1',2,340,'08/06/2019','No')
Insert Into PAGOS Values('A0025','2019-1',1,340,'14/05/2019','No')
Insert Into PAGOS Values('A0025','2019-1',2,340,'05/06/2019','No')
Insert Into PAGOS Values('A0026','2019-1',1,340,'10/05/2019','No')
Insert Into PAGOS Values('A0026','2019-1',2,370,'13/06/2019','No')
Insert Into PAGOS Values('A0027','2019-1',1,340,'11/05/2019','No')
Insert Into PAGOS Values('A0027','2019-1',2,390,'13/06/2019','No')
Insert Into PAGOS Values('A0013','2019-1',1,340,'12/01/2019','No')
Insert Into PAGOS Values('A0013','2019-1',2,340,'11/02/2019','No')
Insert Into PAGOS Values('A0014','2019-1',1,340,'10/02/2019','No')
Insert Into PAGOS Values('A0014','2019-1',2,300,'03/03/2019','No')
Insert Into PAGOS Values('A0015','2019-1',1,380,'01/01/2019','No')
Insert Into PAGOS Values('A0015','2019-1',2,350,'15/02/2019','No')
Insert Into PAGOS Values('A0006','2019-1',1,360,'18/02/2019','No')
Insert Into PAGOS Values('A0006','2019-1',2,300,'13/03/2019','No')
GO


Insert Into PAGOS Values('A0022','2019-2',1,330,'04/09/2019','No')
Insert Into PAGOS Values('A0022','2019-2',2,330,'04/10/2019','No')
Insert Into PAGOS Values('A0022','2019-2',3,350,'12/11/2019','No')
Insert Into PAGOS Values('A0023','2019-2',1,340,'11/09/2019','No')
Insert Into PAGOS Values('A0023','2019-2',2,370,'21/10/2019','No')
Insert Into PAGOS Values('A0023','2019-2',3,370,'14/11/2019','No')
Insert Into PAGOS Values('A0024','2019-2',1,340,'11/08/2019','No')
Insert Into PAGOS Values('A0024','2019-2',2,340,'08/09/2019','No')
Insert Into PAGOS Values('A0024','2019-2',3,340,'14/10/2019','No')
Insert Into PAGOS Values('A0012','2019-2',1,340,'11/10/2019','No')
Insert Into PAGOS Values('A0012','2019-2',2,370,'02/11/2019','No')
Insert Into PAGOS Values('A0013','2019-2',1,390,'15/11/2019','No')
Insert Into PAGOS Values('A0013','2019-2',2,340,'11/12/2019','No')
Insert Into PAGOS Values('A0014','2019-2',1,340,'10/09/2019','No')
Insert Into PAGOS Values('A0014','2019-2',2,350,'02/10/2019','No')
Insert Into PAGOS Values('A0015','2019-2',1,370,'11/11/2019','No')
Insert Into PAGOS Values('A0015','2019-2',2,340,'11/12/2019','No')
Insert Into PAGOS Values('A0016','2019-2',1,330,'20/11/2019','No')
Insert Into PAGOS Values('A0016','2019-2',2,350,'14/12/2019','No')
Insert Into PAGOS Values('A0008','2019-2',1,340,'12/07/2019','No')
Insert Into PAGOS Values('A0008','2019-2',2,340,'11/08/2019','No')
Insert Into PAGOS Values('A0009','2019-2',1,340,'10/08/2019','No')
Insert Into PAGOS Values('A0009','2019-2',2,300,'03/09/2019','No')
Insert Into PAGOS Values('A0010','2019-2',1,380,'01/08/2019','No')
Insert Into PAGOS Values('A0010','2019-2',2,350,'15/09/2019','No')
Insert Into PAGOS Values('A0011','2019-2',1,360,'18/08/2019','No')
Insert Into PAGOS Values('A0011','2019-2',2,300,'13/09/2019','No')
Insert Into PAGOS Values('A0018','2019-2',1,380,'01/10/2019','No')
Insert Into PAGOS Values('A0018','2019-2',2,350,'15/11/2019','No')
Insert Into PAGOS Values('A0019','2019-2',1,360,'18/10/2019','No')
Insert Into PAGOS Values('A0019','2019-2',2,300,'13/11/2019','No')
GO

Insert Into PAGOS Values('A0001','2020-1',1,300,'10/01/2020','No')
Insert Into PAGOS Values('A0001','2020-1',2,340,'11/02/2020','No')
Insert Into PAGOS Values('A0002','2020-1',1,340,'12/01/2020','No')
Insert Into PAGOS Values('A0002','2020-1',2,370,'11/02/2020','No')
Insert Into PAGOS Values('A0002','2020-1',3,340,'08/03/2020','No')
Insert Into PAGOS Values('A0003','2020-1',1,340,'04/01/2020','No')
Insert Into PAGOS Values('A0003','2020-1',2,340,'12/02/2020','No')
Insert Into PAGOS Values('A0004','2020-1',1,340,'10/01/2020','No')
Insert Into PAGOS Values('A0004','2020-1',2,300,'03/02/2020','No')
Insert Into PAGOS Values('A0005','2020-1',1,380,'01/01/2020','No')
Insert Into PAGOS Values('A0005','2020-1',2,350,'15/02/2020','No')
Insert Into PAGOS Values('A0005','2020-1',3,360,'18/03/2020','No')
Insert Into PAGOS Values('A0005','2020-1',4,300,'13/04/2020','No')
Insert Into PAGOS Values('A0006','2020-1',1,340,'11/01/2020','No')
Insert Into PAGOS Values('A0006','2020-1',2,390,'12/02/2020','No')
Insert Into PAGOS Values('A0007','2020-1',1,340,'10/01/2020','No')
Insert Into PAGOS Values('A0007','2020-1',2,380,'04/02/2020','No')
Insert Into PAGOS Values('A0008','2020-1',1,440,'30/01/2020','No')
Insert Into PAGOS Values('A0008','2020-1',2,340,'14/02/2020','No')
Insert Into PAGOS Values('A0008','2020-1',3,320,'11/03/2020','No')

-- Agregar Datos a la Tabla Curso
-- ==============================

Insert Into CURSOS Values('C0001','Matematica Basica',3,'T','No')
Insert Into CURSOS Values('C0002','Filosofia I',6,'T','No')
Insert Into CURSOS Values('C0003','Psicologia Industrial',5,'T','No')
Insert Into CURSOS Values('C0004','Algoritmica',4,'TP','No')
Insert Into CURSOS Values('C0005','Software de Aplicacion',5,'P','No')
Insert Into CURSOS Values('C0006','Lenguaje de Programacion I',5,'TP','No')
Insert Into CURSOS Values('C0007','Lenguaje Java ',4,'TP','No')
Insert Into CURSOS Values('C0008','Matematica II',3,'T','No')
Insert Into CURSOS Values('C0009','Ingles Tecnico',5,'T','No')
Insert Into CURSOS Values('C0010','Lenguaje de Programacion III',3,'P','No')
Insert Into CURSOS Values('C0011','Aplicaciones Cliente/Servidor',4,'P','No')
GO
Insert Into CURSOS Values('C0012','Aplicaciones Moviles con Java ',5,'P','No')
Insert Into CURSOS Values('C0013','Aplicaciones Distribuidas',5,'P','No')
Insert Into CURSOS Values('C0014','Lenguaje Profesional',2,'T','No')
Insert Into CURSOS Values('C0015','Estudios de Mercado i',3,'T','No')
Insert Into CURSOS Values('C0016','Desarrollo Web I',4,'P','No')
Insert Into CURSOS Values('C0017','Base de Datos I',4,'TP','No')
Insert Into CURSOS Values('C0018','Base de Datos II',4,'TP','No')
Insert Into CURSOS Values('C0019','Modelamiento de BD',3,'TP','No')
Insert Into CURSOS Values('C0020','Desarrollo Web II',4,'P','No')
Insert Into CURSOS Values('C0021','Proyectos Empresariales con .Net',5,'P','No')
GO

-- Agregar Datos a la Tabla NOTAS
-- ===============================

Insert Into NOTAS Values('02/07/2019','A0001','C0001','2019-2',14,11,17,'No')
Insert Into NOTAS Values('02/07/2019','A0001','C0003','2019-2',18,09,15,'No')
Insert Into NOTAS Values('02/07/2019','A0001','C0004','2019-2',20,18,10,'No')
Insert Into NOTAS Values('02/07/2019','A0002','C0001','2019-2',12,15,09,'No')
Insert Into NOTAS Values('02/07/2019','A0002','C0002','2019-2',14,11,05,'No')
Insert Into NOTAS Values('02/07/2019','A0002','C0003','2019-2',15,14,13,'No')
Insert Into NOTAS Values('02/07/2019','A0003','C0008','2019-2',19,12,13,'No')
Insert Into NOTAS Values('02/07/2019','A0003','C0005','2019-2',20,16,14,'No')
Insert Into NOTAS Values('02/07/2019','A0003','C0003','2019-2',14,8,13,'No')
Insert Into NOTAS Values('02/07/2019','A0003','C0004','2019-2',15,7,14,'No')
Insert Into NOTAS Values('03/07/2019','A0004','C0006','2019-2',13,11,12,'No')
Insert Into NOTAS Values('03/07/2019','A0004','C0007','2019-2',14,9,11,'No')
Insert Into NOTAS Values('03/07/2019','A0004','C0005','2019-2',18,13,12,'No')
Insert Into NOTAS Values('03/07/2019','A0005','C0004','2019-2',20,17,16,'No')
Insert Into NOTAS Values('03/07/2019','A0005','C0005','2019-2',15,12,17,'No')
Insert Into NOTAS Values('03/07/2019','A0005','C0003','2019-2',14,6,13,'No')
Insert Into NOTAS Values('04/07/2019','A0006','C0004','2019-2',15,16,15,'No')
Insert Into NOTAS Values('04/07/2019','A0006','C0006','2019-2',14,5,12,'No')
Insert Into NOTAS Values('04/07/2019','A0006','C0007','2019-2',18,8,13,'No')
Insert Into NOTAS Values('04/07/2019','A0007','C0002','2019-2',14,7,9,'No')
Insert Into NOTAS Values('04/07/2019','A0007','C0004','2019-2',20,12,7,'No')
Insert Into NOTAS Values('04/07/2019','A0007','C0005','2019-2',17,11,6,'No')
Insert Into NOTAS Values('05/07/2019','A0008','C0008','2019-2',19,5,8,'No')
Insert Into NOTAS Values('05/07/2019','A0008','C0009','2019-2',14,7,4,'No')
Insert Into NOTAS Values('05/07/2019','A0008','C0004','2019-2',12,5,13,'No')
Insert Into NOTAS Values('05/07/2019','A0009','C0005','2019-2',13,6,13,'No')
Insert Into NOTAS Values('05/07/2019','A0009','C0009','2019-2',15,18,13,'No')
Insert Into NOTAS Values('05/07/2019','A0009','C0010','2019-2',17,12,15,'No')
Insert Into NOTAS Values('05/07/2019','A0010','C0010','2019-2',11,16,14,'No')
Insert Into NOTAS Values('05/07/2019','A0010','C0001','2019-2',12,5,12,'No')
Insert Into NOTAS Values('05/07/2019','A0010','C0003','2019-2',14,12,11,'No')
Insert Into NOTAS Values('06/07/2019','A0011','C0001','2019-2',17,5,13,'No')
Insert Into NOTAS Values('06/07/2019','A0011','C0002','2019-2',16,11,13,'No')
Insert Into NOTAS Values('06/07/2019','A0011','C0004','2019-2',17,7,03,'No')
Insert Into NOTAS Values('06/07/2019','A0012','C0004','2019-2',15,10,08,'No')
Insert Into NOTAS Values('06/07/2019','A0012','C0005','2019-2',14,7,10,'No')
Insert Into NOTAS Values('06/07/2019','A0012','C0006','2019-2',14,17,10,'No')
Insert Into NOTAS Values('06/07/2019','A0013','C0001','2019-2',13,14,10,'No')
Insert Into NOTAS Values('06/07/2019','A0013','C0002','2019-2',18,7,10,'No')
Insert Into NOTAS Values('06/07/2019','A0013','C0004','2019-2',14,12,13,'No')
Insert Into NOTAS Values('07/07/2019','A0013','C0003','2019-2',13,15,12,'No')
Insert Into NOTAS Values('07/07/2019','A0014','C0001','2019-2',14,11,15,'No')
Insert Into NOTAS Values('07/07/2019','A0014','C0003','2019-2',16,15,13,'No')
Insert Into NOTAS Values('07/07/2019','A0014','C0004','2019-2',17,12,18,'No')
Insert Into NOTAS Values('07/07/2019','A0015','C0001','2019-2',15,5,13,'No')
Insert Into NOTAS Values('07/07/2019','A0015','C0003','2019-2',14,14,13,'No')
Insert Into NOTAS Values('07/07/2019','A0015','C0004','2019-2',16,15,12,'No')

Insert Into NOTAS Values('02/08/2019','A0016','C0002','2019-2',14,6,13,'No')
Insert Into NOTAS Values('02/08/2019','A0016','C0003','2019-2',14,12,11,'No')
Insert Into NOTAS Values('02/08/2019','A0016','C0006','2019-2',15,17,12,'No')
Insert Into NOTAS Values('02/08/2019','A0021','C0004','2019-2',14,8,17,'No')
Insert Into NOTAS Values('02/08/2019','A0021','C0005','2019-2',13,14,13,'No')
Insert Into NOTAS Values('02/08/2019','A0021','C0006','2019-2',16,17,12,'No')
Insert Into NOTAS Values('05/08/2019','A0022','C0004','2019-2',15,17,13,'No')
Insert Into NOTAS Values('05/08/2019','A0022','C0005','2019-2',18,8,13,'No')
Insert Into NOTAS Values('05/04/2019','A0022','C0003','2019-2',14,7,13,'No')
Insert Into NOTAS Values('05/08/2019','A0023','C0004','2019-2',16,10,13,'No')
Insert Into NOTAS Values('05/08/2019','A0023','C0008','2019-2',18,12,13,'No')
Insert Into NOTAS Values('05/08/2019','A0023','C0009','2019-2',16,18,13,'No')
Insert Into NOTAS Values('08/08/2019','A0024','C0004','2019-2',17,10,3,'No')
Insert Into NOTAS Values('08/08/2019','A0024','C0005','2019-2',14,11,9,'No')
Insert Into NOTAS Values('08/08/2019','A0024','C0003','2019-2',15,16,8,'No')
Insert Into NOTAS Values('08/08/2019','A0024','C0007','2019-2',19,16,13,'No')
Insert Into NOTAS Values('08/08/2019','A0025','C0004','2019-2',14,07,13,'No')
Insert Into NOTAS Values('08/08/2019','A0025','C0005','2019-2',16,10,18,'No')
Insert Into NOTAS Values('10/08/2019','A0028','C0005','2019-2',14,16,13,'No')
Insert Into NOTAS Values('10/08/2019','A0028','C0004','2019-2',18,17,7,'No')
Insert Into NOTAS Values('10/08/2019','A0029','C0004','2019-2',10,11,13,'No')
Insert Into NOTAS Values('10/08/2019','A0030','C0005','2019-2',15,7,10,'No')
Insert Into NOTAS Values('10/08/2019','A0030','C0002','2019-2',14,12,13,'No')
go

------------------------------------------
Insert Into NOTAS Values('10/03/2020','A0001','C0006','2020-1',14,11,17,'No')
Insert Into NOTAS Values('10/03/2020','A0001','C0009','2020-1',15,09,15,'No')
Insert Into NOTAS Values('10/03/2020','A0001','C0014','2020-1',14,18,3,'No')
Insert Into NOTAS Values('10/03/2020','A0002','C0010','2020-1',13,15,9,'No')
Insert Into NOTAS Values('10/03/2020','A0002','C0012','2020-1',18,11,03,'No')
Insert Into NOTAS Values('10/03/2020','A0002','C0020','2020-1',14,14,13,'No')
Insert Into NOTAS Values('10/03/2020','A0003','C0020','2020-1',16,12,13,'No')
Insert Into NOTAS Values('10/03/2020','A0003','C0015','2020-1',18,16,14,'No')
Insert Into NOTAS Values('10/03/2020','A0003','C0019','2020-1',14,8,13,'No')
Insert Into NOTAS Values('10/03/2020','A0003','C0021','2020-1',13,7,14,'No')
Insert Into NOTAS Values('10/03/2020','A0004','C0016','2020-1',12,11,12,'No')
Insert Into NOTAS Values('10/03/2020','A0004','C0009','2020-1',14,9,11,'No')
Insert Into NOTAS Values('10/03/2020','A0004','C0008','2020-1',16,7,12,'No')
Insert Into NOTAS Values('10/03/2020','A0005','C0016','2020-1',17,17,16,'No')
Insert Into NOTAS Values('10/03/2020','A0005','C0007','2020-1',15,12,17,'No')
Insert Into NOTAS Values('10/03/2020','A0005','C0013','2020-1',14,6,13,'No')
Insert Into NOTAS Values('10/03/2020','A0006','C0014','2020-1',14,16,15,'No')
Insert Into NOTAS Values('10/03/2020','A0006','C0016','2020-1',15,5,12,'No')
Insert Into NOTAS Values('10/03/2020','A0006','C0017','2020-1',13,12,13,'No')
Insert Into NOTAS Values('10/03/2020','A0007','C0021','2020-1',15,12,19,'No')
Insert Into NOTAS Values('10/03/2020','A0007','C0008','2020-1',14,12,17,'No')
Insert Into NOTAS Values('10/03/2020','A0007','C0009','2020-1',14,11,16,'No')
Insert Into NOTAS Values('10/03/2020','A0008','C0018','2020-1',13,15,12,'No')
Insert Into NOTAS Values('10/03/2020','A0008','C0019','2020-1',14,17,14,'No')
Insert Into NOTAS Values('10/03/2020','A0008','C0020','2020-1',18,15,13,'No')
Insert Into NOTAS Values('10/03/2020','A0009','C0021','2020-1',14,16,14,'No')
Insert Into NOTAS Values('10/03/2020','A0009','C0020','2020-1',15,18,13,'No')
Insert Into NOTAS Values('10/03/2020','A0009','C0014','2020-1',14,12,15,'No')
Insert Into NOTAS Values('10/03/2020','A0010','C0017','2020-1',13,16,14,'No')
Insert Into NOTAS Values('10/03/2020','A0010','C0011','2020-1',18,5,12,'No')
Insert Into NOTAS Values('10/03/2020','A0010','C0019','2020-1',14,12,11,'No')
Insert Into NOTAS Values('10/03/2020','A0011','C0021','2020-1',16,5,13,'No')
Insert Into NOTAS Values('10/03/2020','A0011','C0012','2020-1',16,11,13,'No')
Insert Into NOTAS Values('10/03/2020','A0011','C0009','2020-1',18,12,13,'No')
Insert Into NOTAS Values('10/03/2020','A0012','C0009','2020-1',14,10,08,'No')
Insert Into NOTAS Values('10/03/2020','A0012','C0019','2020-1',15,11,10,'No')
Insert Into NOTAS Values('10/03/2020','A0012','C0016','2020-1',16,17,10,'No')
Insert Into NOTAS Values('10/03/2020','A0013','C0011','2020-1',14,14,13,'No')
Insert Into NOTAS Values('10/03/2020','A0013','C0014','2020-1',14,12,13,'No')
go

Insert Into NOTAS Values('10/04/2020','A0014','C0013','2020-1',14,15,13,'No')
Insert Into NOTAS Values('10/04/2020','A0015','C0014','2020-1',13,15,12,'No')
Insert Into NOTAS Values('10/04/2020','A0016','C0012','2020-1',14,6,13,'No')
Insert Into NOTAS Values('10/04/2020','A0016','C0013','2020-1',15,12,11,'No')
Insert Into NOTAS Values('10/04/2020','A0017','C0004','2020-1',15,10,08,'No')
Insert Into NOTAS Values('10/04/2020','A0017','C0005','2020-1',14,7,10,'No')
Insert Into NOTAS Values('10/04/2020','A0018','C0006','2020-1',16,17,10,'No')
Insert Into NOTAS Values('10/04/2020','A0018','C0011','2020-1',15,14,13,'No')
Insert Into NOTAS Values('10/04/2020','A0018','C0012','2020-1',14,7,10,'No')
Insert Into NOTAS Values('10/04/2020','A0019','C0004','2020-1',13,12,13,'No')
Insert Into NOTAS Values('10/04/2020','A0019','C0003','2020-1',14,15,12,'No')
Insert Into NOTAS Values('10/04/2020','A0019','C0001','2020-1',13,11,15,'No')
Insert Into NOTAS Values('10/04/2020','A0020','C0003','2020-1',15,15,13,'No')
Insert Into NOTAS Values('10/04/2020','A0020','C0004','2020-1',16,12,18,'No')
Insert Into NOTAS Values('10/04/2020','A0021','C0014','2020-1',16,10,17,'No')
Insert Into NOTAS Values('10/04/2020','A0021','C0015','2020-1',13,14,10,'No')
Insert Into NOTAS Values('10/04/2020','A0021','C0016','2020-1',18,17,12,'No')
Insert Into NOTAS Values('10/04/2020','A0022','C0014','2020-1',14,17,13,'No')
Insert Into NOTAS Values('10/04/2020','A0022','C0021','2020-1',15,8,13,'No')
Insert Into NOTAS Values('10/04/2020','A0022','C0020','2020-1',16,7,13,'No')
Insert Into NOTAS Values('10/04/2020','A0023','C0014','2020-1',15,10,13,'No')
Insert Into NOTAS Values('10/04/2020','A0023','C0018','2020-1',14,12,13,'No')
Insert Into NOTAS Values('10/04/2020','A0023','C0019','2020-1',16,18,13,'No')
Insert Into NOTAS Values('10/04/2020','A0024','C0014','2020-1',17,10,13,'No')
Insert Into NOTAS Values('10/04/2020','A0024','C0010','2020-1',14,11,9,'No')
Insert Into NOTAS Values('10/04/2020','A0024','C0013','2020-1',13,16,8,'No')
Insert Into NOTAS Values('10/04/2020','A0024','C0017','2020-1',15,16,13,'No')
Insert Into NOTAS Values('10/04/2020','A0025','C0014','2020-1',14,09,13,'No')
Insert Into NOTAS Values('10/04/2020','A0025','C0015','2020-1',15,10,18,'No')
Insert Into NOTAS Values('10/04/2020','A0026','C0011','2020-1',16,11,15,'No')
Insert Into NOTAS Values('10/04/2020','A0026','C0013','2020-1',13,15,13,'No')
Insert Into NOTAS Values('10/04/2020','A0026','C0021','2020-1',14,12,18,'No')
Insert Into NOTAS Values('10/04/2020','A0027','C0014','2020-1',16,8,17,'No')
Insert Into NOTAS Values('10/04/2020','A0027','C0015','2020-1',17,14,11,'No')
Insert Into NOTAS Values('10/04/2020','A0027','C0016','2020-1',16,17,12,'No')
Insert Into NOTAS Values('10/04/2020','A0028','C0014','2020-1',14,17,13,'No')
Insert Into NOTAS Values('10/04/2020','A0028','C0020','2020-1',13,16,13,'No')
Insert Into NOTAS Values('10/04/2020','A0028','C0021','2020-1',14,17,7,'No')
Insert Into NOTAS Values('10/04/2020','A0029','C0018','2020-1',16,11,13,'No')
Insert Into NOTAS Values('10/04/2020','A0029','C0015','2020-1',17,7,10,'No')
Insert Into NOTAS Values('10/04/2020','A0029','C0020','2020-1',16,17,10,'No')
Insert Into NOTAS Values('10/04/2020','A0029','C0019','2020-1',14,14,8,'No')
Insert Into NOTAS Values('10/04/2020','A0030','C0018','2020-1',15,7,10,'No')
Insert Into NOTAS Values('10/04/2020','A0030','C0021','2020-1',16,12,13,'No')
go

------------------------------
-- agregar una nueva columna a la tabla PAGOS
ALTER TABLE PAGOS
  ADD FechaPago Datetime DEFAULT NULL
GO

--SELECT * FROM PAGOS
--GO

ALTER TABLE ESPECIALIDAD
  ADD eliminado char(2) default('No') with values
GO

SELECT 'Base de Datos BDNOTAS2020ok creada correctamente' AS Mensaje
GO
PRINT 'Base de Datos BDNOTAS2020ok creada correctamente'
GO

SET NOCOUNT OFF
GO



