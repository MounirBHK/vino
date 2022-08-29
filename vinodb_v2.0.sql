/*==============================================================*/
/* Nom de SGBD :  MySQL                                         */
/* Realisé par Jaouad. A                    */
/*==============================================================*/

drop table if exists achats;
drop table if exists bouteilles;
drop table if exists celliers;
drop table if exists cellier_bouts;
drop table if exists consommations;
drop table if exists types;
drop table if exists utilisateurs;
SET sql_mode = '';
SET GLOBAL sql_mode = '';

/*==============================================================*/
/* Table : utilisateurs                                     */
/*==============================================================*/
create table utilisateurs
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
/* Table : celliers                                         */
/*==============================================================*/
create table celliers
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
/* Table : bouteilles                                       */
/*==============================================================*/
create table bouteilles
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
/* Table : types                                            */
/*==============================================================*/
create table types
(
   id_type              smallint unsigned not null AUTO_INCREMENT,
   type                 varchar(20) not null,
   primary key (id_type)
);

/*==============================================================*/
/* Table : cellier_bouts                                    */
/*==============================================================*/
create table cellier_bouts
(
   id_cellier           smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   quantite             smallint,
   derniere_trans       date,
   primary key (id_cellier, id_bouteille)
);

/*==============================================================*/
/* Table : achats                                           */
/*==============================================================*/
create table achats
(
   id_utilisateur       smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   date_achat           datetime not null,
   quantite_achat       smallint,
   prix_achat           decimal(6,2),
   primary key (id_utilisateur, id_bouteille, date_achat)
);


/*==============================================================*/
/* Table : consommations                                    */
/*==============================================================*/
create table consommations
(
   id_utilisateur       smallint unsigned not null,
   id_bouteille         smallint unsigned not null,
   date_consommation    datetime not null,
   quantite_cons        smallint,
   primary key (id_utilisateur, id_bouteille, date_consommation)
);

alter table achats 
add constraint fk_achat 
foreign key (id_bouteille)
references bouteilles (id_bouteille) on delete restrict on update restrict;

alter table achats 
add constraint fk_achat2 
foreign key (id_utilisateur)
references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table bouteilles 
add constraint fk_appartenir 
foreign key (id_type)
references types (id_type) on delete restrict on update restrict;

alter table celliers 
add constraint fk_avoir 
foreign key (id_utilisateur)
references utilisateurs (id_utilisateur) on delete restrict on update restrict;

alter table cellier_bouts 
add constraint fk_cellier_bout 
foreign key (id_bouteille)
references bouteilles (id_bouteille) on delete restrict on update restrict;

alter table cellier_bouts 
add constraint fk_cellier_bout2 
foreign key (id_cellier)
references celliers (id_cellier) on delete restrict on update restrict;

alter table consommations 
add constraint fk_consommation 
foreign key (id_bouteille)
references bouteilles (id_bouteille) on delete restrict on update restrict;

alter table consommations 
add constraint fk_consommation2 
foreign key (id_utilisateur)
references utilisateurs (id_utilisateur) on delete restrict on update restrict;

