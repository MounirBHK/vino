/*==============================================================*/
/* Nom de SGBD :  MySQL                                         */
/* Realisé par Jaouad. A                    */
/*==============================================================*/

drop table if exists vino_achat;
drop table if exists vino_bouteille;
drop table if exists vino_cellier;
drop table if exists vino_cellier_bout;
drop table if exists vino_consommation;
drop table if exists vino_type;
drop table if exists vino_utilisateur;
SET sql_mode = '';
SET GLOBAL sql_mode = '';

/*==============================================================*/
/* Table : vino_utilisateur                                     */
/*==============================================================*/
create table vino_utilisateur
(
   id_utilisateur       smallint unsigned not null AUTO_INCREMENT,
   courriel             varchar(50) not null,
   nom                  varchar(25),
   prenom               varchar(25),
   pswd                 varchar(50) not null,
   role                 char(5),
   date_created         TIMESTAMP,
   date_updated         TIMESTAMP,
   primary key (id_utilisateur)
);

/*==============================================================*/
/* Table : vino_cellier                                         */
/*==============================================================*/
create table vino_cellier
(
   id_cellier           smallint unsigned not null AUTO_INCREMENT,
   id_utilisateur       smallint unsigned not null,
   lib_cellier          varchar(20),
   nbr_colonne          smallint,
   nbr_ligne            smallint,
   capacite             int,
   primary key (id_cellier)
);

/*==============================================================*/
/* Table : vino_bouteille                                       */
/*==============================================================*/
create table vino_bouteille
(
   id_bouteille         smallint unsigned not null AUTO_INCREMENT,
   id_type              smallint unsigned not null,
   nom_bouteille        varchar(255) not null,
   image                varchar(255),
   code_saq             varchar(25),
   pays                 varchar(25),
   description          varchar(255),
   prix_saq             decimal(6,2),
   url_saq              varchar(255),
   url_img              varchar(255),
   format               varchar(20),
   degre_alcool         smallint,
   producteur           varchar(255),
   region               varchar(255),
   millesime            int,
   primary key (id_bouteille)
);


/*==============================================================*/
/* Table : vino_type                                            */
/*==============================================================*/
create table vino_type
(
   id_type              smallint unsigned not null AUTO_INCREMENT,
   type                 varchar(20) not null,
   primary key (id_type)
);

/*==============================================================*/
/* Table : vino_cellier_bout                                    */
/*==============================================================*/
create table vino_cellier_bout
(
   id_cellier           smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   quantite             smallint,
   derniere_trans       date,
   primary key (id_cellier, id_bouteille)
);

/*==============================================================*/
/* Table : vino_achat                                           */
/*==============================================================*/
create table vino_achat
(
   id_utilisateur       smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   date_achat           datetime not null,
   quantite_achat       smallint,
   prix_achat           decimal(6,2),
   primary key (id_utilisateur, id_bouteille, date_achat)
);


/*==============================================================*/
/* Table : vino_consommation                                    */
/*==============================================================*/
create table vino_consommation
(
   id_utilisateur       smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   date_consommation    datetime not null,
   quantite_cons        smallint,
   primary key (id_utilisateur, id_bouteille, date_consommation)
);

alter table vino_achat 
add constraint fk_vino_achat 
foreign key (id_bouteille)
references vino_bouteille (id_bouteille) on delete restrict on update restrict;

alter table vino_achat 
add constraint fk_vino_achat2 
foreign key (id_utilisateur)
references vino_utilisateur (id_utilisateur) on delete restrict on update restrict;

alter table vino_bouteille 
add constraint fk_appartenir 
foreign key (id_type)
references vino_type (id_type) on delete restrict on update restrict;

alter table vino_cellier 
add constraint fk_avoir 
foreign key (id_utilisateur)
references vino_utilisateur (id_utilisateur) on delete restrict on update restrict;

alter table vino_cellier_bout 
add constraint fk_vino_cellier_bout 
foreign key (id_bouteille)
references vino_bouteille (id_bouteille) on delete restrict on update restrict;

alter table vino_cellier_bout 
add constraint fk_vino_cellier_bout2 
foreign key (id_cellier)
references vino_cellier (id_cellier) on delete restrict on update restrict;

alter table vino_consommation 
add constraint fk_vino_consommation 
foreign key (id_bouteille)
references vino_bouteille (id_bouteille) on delete restrict on update restrict;

alter table vino_consommation 
add constraint fk_vino_consommation2 
foreign key (id_utilisateur)
references vino_utilisateur (id_utilisateur) on delete restrict on update restrict;

