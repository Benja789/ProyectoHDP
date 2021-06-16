/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     16/6/2021 12:41:59                           */
/*==============================================================*/


drop table if exists GASOLINA;

drop table if exists PERIODO;

drop table if exists PREDICCION;

drop table if exists USUARIO;

drop table if exists ZONA;

/*==============================================================*/
/* Table: GASOLINA                                              */
/*==============================================================*/
create table GASOLINA
(
   IDGASOLINA           varchar(5) not null,
   TIPOGASOLINA         char(15) not null,
   primary key (IDGASOLINA)
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO
(
   IDPERIODO            int not null auto_increment,
   FECHAINICIO          date not null,
   FECHAFIN             date not null,
   primary key (IDPERIODO)
);

/*==============================================================*/
/* Table: PREDICCION                                            */
/*==============================================================*/
create table PREDICCION
(
   IDPREDICCION         int not null auto_increment,
   DUI                  varchar(10),
   IDPERIODO            int,
   IDZONA               varchar(5),
   IDGASOLINA           varchar(5),
   PRECIO               float not null,
   VARIACION            float not null,
   ESTADO               varchar(12) not null,
   primary key (IDPREDICCION)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   DUI                  varchar(10) not null,
   NOMBRES              varchar(40) not null,
   APELLIDOS            varchar(40) not null,
   DEPARTAMENTO         varchar(20) not null,
   MUNICIPIO            varchar(20) not null,
   FECHA_NACIMIENTO     date not null,
   CORREO               varchar(40) not null,
   CONTRASENA           varchar(16) not null,
   primary key (DUI)
);

/*==============================================================*/
/* Table: ZONA                                                  */
/*==============================================================*/
create table ZONA
(
   IDZONA               varchar(5) not null,
   NOMBREZONA           varchar(15) not null,
   primary key (IDZONA)
);

alter table PREDICCION add constraint FK_REFERENCE_3 foreign key (IDPERIODO)
      references PERIODO (IDPERIODO) on delete restrict on update restrict;

alter table PREDICCION add constraint FK_REFERENCE_4 foreign key (IDGASOLINA)
      references GASOLINA (IDGASOLINA) on delete restrict on update restrict;

alter table PREDICCION add constraint FK_REFERENCE_5 foreign key (DUI)
      references USUARIO (DUI) on delete restrict on update restrict;

alter table PREDICCION add constraint FK_REFERENCE_6 foreign key (IDZONA)
      references ZONA (IDZONA) on delete restrict on update restrict;

