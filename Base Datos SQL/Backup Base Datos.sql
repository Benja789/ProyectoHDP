/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     8/6/2021 12:00:34                            */
/*==============================================================*/


drop table if exists GASOLINA;

drop table if exists HISTORIALIMPLEMENTADOS;

drop table if exists PERIODO;

drop table if exists PREDICCION;

drop table if exists USUARIO;

drop table if exists ZONA;

/*==============================================================*/
/* Table: GASOLINA                                              */
/*==============================================================*/
create table GASOLINA
(
   IDGASOLINA           int not null,
   TIPOGASOLINA         char(15) not null,
   primary key (IDGASOLINA),
   key AK_GASOLINA (TIPOGASOLINA)
);

/*==============================================================*/
/* Table: HISTORIALIMPLEMENTADOS                                */
/*==============================================================*/
create table HISTORIALIMPLEMENTADOS
(
   IDHISTORIAL          int not null,
   IDPERIODO            int,
   PRECIOIMPLEMENTADO   float not null,
   VARIACIONIMPLEMENTADA float not null,
   primary key (IDHISTORIAL)
);

/*==============================================================*/
/* Table: PERIODO                                               */
/*==============================================================*/
create table PERIODO
(
   IDPERIODO            int not null,
   IDGASOLINA           int,
   IDZONA               int,
   FECHAINICIO          date not null,
   FECHAFIN             date not null,
   primary key (IDPERIODO)
);

/*==============================================================*/
/* Table: PREDICCION                                            */
/*==============================================================*/
create table PREDICCION
(
   IDPREDICCION         int not null,
   IDPERIODO            int,
   DUI                  varchar(10),
   PERCIOPREDICTO       float not null,
   VARIACIONPREDICTA    float not null,
   primary key (IDPREDICCION)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   DUI                  varchar(10) not null,
   NOMBRE               varchar(40) not null,
   APELLIDO             varchar(40) not null,
   DEPARTAMENTO         varchar(20) not null,
   MUNICIPIO            varchar(20) not null,
   FECHANACIMIENTO      date not null,
   CORREO               varchar(40) not null,
   CONTRASENA           varchar(16) not null,
   primary key (DUI)
);

/*==============================================================*/
/* Table: ZONA                                                  */
/*==============================================================*/
create table ZONA
(
   IDZONA               int not null,
   NOMBREZONA           varchar(15) not null,
   primary key (IDZONA),
   key AK_ZONA (NOMBREZONA)
);

alter table HISTORIALIMPLEMENTADOS add constraint FK_TIENE foreign key (IDPERIODO)
      references PERIODO (IDPERIODO) on delete restrict on update restrict;

alter table PERIODO add constraint FK_EXISTE foreign key (IDZONA)
      references ZONA (IDZONA) on delete restrict on update restrict;

alter table PERIODO add constraint FK_POSEE foreign key (IDGASOLINA)
      references GASOLINA (IDGASOLINA) on delete restrict on update restrict;

alter table PREDICCION add constraint FK_HACE foreign key (IDPERIODO)
      references PERIODO (IDPERIODO) on delete restrict on update restrict;

alter table PREDICCION add constraint FK_PERTENECE foreign key (DUI)
      references USUARIO (DUI) on delete restrict on update restrict;

