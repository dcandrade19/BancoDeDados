create table Tipo_Item(id_Tipo_Item number(3),
  nm_Tipo_Item varchar2(30) not null,
  constraint pk_Tipo_Item primary key(id_Tipo_Item));

create table Tipo_Habilidade(id_Tipo_Habilidade number(2),
   nm_Tipo_Habilidade varchar2(30) not null,
   constraint pk_Tipo_Habilidade primary key(id_Tipo_Habilidade));

create table Tipo_Quest(id_Tipo_Quest number(3),
   nm_Tipo_Quest varchar(30) not null,
   constraint pk_Tipo_Quest primary key(id_Tipo_Quest));

create table Tipo_Personagem(id_Tipo_Personagem number(2),
   nm_Tipo_Personagem varchar(30) not null,
   constraint pk_Tipo_Personagem primary key(id_Tipo_Personagem));

create table Usuario(id_Usuario number(3),
   nm_Login varchar2(30) not null,
   nm_Senha varchar2(30) not null,
   nm_Pessoa varchar2(80) not null,
   dt_Nascimento date not null,
   nm_Email varchar(40) not null,
   nm_Pergunta varchar2(30) not null,
   nm_Resposta varchar2(30) not null,
   dt_Criacao date not null,
   dt_Exclusao date,
   vl_Status number(1) not null,
   constraint pk_Usuario primary key(id_Usuario));

create table Raca(id_Raca number(2),
   nm_Raca varchar2(30) not null,
   ds_Raca varchar2(60) not null,
   vl_Vida_Base number(3) not null,
   vl_Mana_Base number(3) not null,
   vl_Stamina_Base number(3) not null,
   vl_Forca_Raca number(3) not null,
   vl_Inteligencia_Raca number(3) not null,
   vl_Destreza_Raca number(3) not null,
   vl_Agilidade_Raca number(3) not null,
   vl_Sorte_Raca number(3) not null,
   vl_Status number(3) not null,
   constraint pk_Raca primary key(id_Raca));

create table Classe(id_Classe number(2),
   id_Raca number(2) not null,
   vl_Bonus_Forca number(3),
   vl_Bonus_Inteligencia number(3),
   vl_Bonus_Destreza number(3),
   vl_Bonus_Agilidade number(3),
   nm_Classe varchar2(30) not null,
   ds_Classe varchar2(60) not null,
   vl_Bonus_Sorte number(3),
   vl_Status number(1) not null,
   constraint pk_Classe primary key(id_Classe),
   constraint fk_Raca_Classe foreign key(id_Raca) references Raca(id_Raca));

create table Habilidade(id_Habilidade number(3),
   id_Raca number(2),
   id_Classe number(2),
   id_Tipo_Habilidade number(2) not null,
   vl_Tempo_Duracao number(2),
   vl_Tempo_Regeneracao number(2),
   vl_Level_Minimo number(2) not null,
   vl_Custo number(3),
   vl_Status number(1) not null,
   nm_Habilidade varchar2(30) not null,
   ds_Habilidade varchar2(60) not null,
   constraint pk_Habilidade primary key(id_Habilidade),
   constraint fk_Tipo_Habilidade foreign key(id_Tipo_Habilidade) references Tipo_Habilidade(id_Tipo_Habilidade));

create table Personagem(id_Personagem number(4),
  id_Tipo_Personagem number(2) not null,
  id_Usuario number(4) not null,
  nm_Personagem varchar2(40) not null,
  nm_Genero varchar2(1) not null,
  dt_Criacao date not null,
  vl_Experiencia number(6) not null,
  vl_Status number(1) not null,
  vl_Vida_Inicial number(3) not null,
  vl_Mana_Inicial number(3) not null,
  vl_Stamina_Inicial number(3) not null,
  vl_Dano_Base number(3) not null,
  dt_Exclusao date,
  id_Raca number(2) not null,
  id_Classe number(2) not null,
  constraint pk_Personagem primary key(id_Personagem),
  constraint fk_Tipo_Personagem foreign key(id_Tipo_Personagem) references Tipo_Personagem (id_Tipo_Personagem),
  constraint fk_Raca_Personagem foreign key(id_Raca) references Raca(id_Raca),
  constraint fk_Classe_Personagem foreign key(id_Classe) references Classe(id_Classe),
  constraint fk_Usuario_Personagem foreign key(id_Usuario) references Usuario(id_Usuario));

create table Quest(id_Quest number(3),
   id_Personagem number(4),
   id_Tipo_Quest number(2) not null,
   nm_Quest varchar2(40) not null,
   ds_Quest varchar2(80) not null,
   vl_Experiencia number(3) not null,
   vl_Tempo_Duracao number(2),
   vl_Status number(1) not null,
   vl_Level_Minimo number(3),
   dt_Expiracao date,
   dt_Inicio date,
   constraint pk_Quest primary key(id_Quest),
   constraint fk_Tipo_Quest foreign key(id_Tipo_Quest) references Tipo_Quest(id_Tipo_Quest));

create table Item(id_Item number(4),
   id_Classe number(2),
   id_Personagem number(4),
   id_Quest number(3),
   id_Tipo_Item number(2) not null,
   nm_Item varchar2(30) not null,
   ds_Item varchar2(60) not null,
   vl_Ataque number(3),
   vl_Defesa number(3),
   vl_Durabilidade number(3),
   vl_Peso number(3),
   vl_Valor number(6),
   vl_Level_Minimo number(3),
   constraint pk_Item primary key(id_Item),
   constraint fk_Tipo_Item foreign key(id_Tipo_Item) references Tipo_Item(id_Tipo_Item));
