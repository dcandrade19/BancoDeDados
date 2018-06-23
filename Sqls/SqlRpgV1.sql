CREATE TABLE Tipo_Item (
  id_Tipo_Item INT NOT NULL AUTO_INCREMENT,
  nm_Tipo_Item VARCHAR(45),
  PRIMARY KEY (id_Tipo_Item)
);

CREATE TABLE Tipo_Inventario (
  id_Tipo_Inventario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nm_Tipo_Inventario VARCHAR(45) NULL,
  espaco_invent INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Tipo_Inventario)
);

CREATE TABLE Tipo_Habilidade (
  id_Tipo_Habilidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nm_Tipo_Habilidade VARCHAR(45) NULL,
  elemento_habilidade VARCHAR(45) NULL,
  PRIMARY KEY(id_Tipo_Habilidade)
);

CREATE TABLE TIpo_Personagem (
  id_Tipo_Personagem INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nm_Tipo_Personagem VARCHAR(45) NULL,
  PRIMARY KEY(id_Tipo_Personagem)
);

CREATE TABLE Usuario (
  id_Usuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  login VARCHAR(45) NOT NULL,
  senha VARCHAR(45) NOT NULL,
  nm_usuario VARCHAR(45) NULL,
  dt_nasci DATE NULL,
  email VARCHAR(45) NULL,
  pergunta_secreta VARCHAR(45) NULL,
  resposta_secreta VARCHAR(45) NULL,
  PRIMARY KEY(id_Usuario)
);

CREATE TABLE Tipo_Resistencia (
  idTipo_Resistencia INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  vl_base_resist INTEGER UNSIGNED NULL,
  nm_resist VARCHAR(45) NULL,
  elemento_resist VARCHAR(45) NULL,
  PRIMARY KEY(idTipo_Resistencia)
);

CREATE TABLE Tipo_Quest (
  idTipo_Quest INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ds_TipoQuest VARCHAR(45) NULL,
  PRIMARY KEY(idTipo_Quest)
);

CREATE TABLE Raca (
  id_Raca INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Tipo_Resistencia_idTipo_Resistencia INTEGER UNSIGNED NOT NULL,
  nm_Raca VARCHAR(45) NULL,
  ds_Raca VARCHAR(45) NULL,
  vl_Base_Vida INTEGER UNSIGNED NULL,
  vl_Base_Mana INTEGER UNSIGNED NULL,
  vl_Base_Stamina INTEGER UNSIGNED NULL,
  vl_Forca_raca INTEGER UNSIGNED NULL,
  vl_Int_raca INTEGER UNSIGNED NULL,
  vl_dest_raca INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Raca),
  INDEX Raca_FKIndex1(Tipo_Resistencia_idTipo_Resistencia),
  FOREIGN KEY(Tipo_Resistencia_idTipo_Resistencia)
    REFERENCES Tipo_Resistencia(idTipo_Resistencia)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Item (
  id_Item INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Tipo_Item_id_Tipo_Item INTEGER UNSIGNED NOT NULL,
  nm_item VARCHAR(45) NULL,
  consumivel BOOL NULL,
  PRIMARY KEY(id_Item),
  INDEX Item_FKIndex1(Tipo_Item_id_Tipo_Item),
  FOREIGN KEY(Tipo_Item_id_Tipo_Item)
    REFERENCES Tipo_Item(id_Tipo_Item)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Classe (
  id_Classe INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Raca_id_Raca INTEGER UNSIGNED NOT NULL,
  vl_Forca_classe INTEGER UNSIGNED NULL,
  vl_Int_classe INTEGER UNSIGNED NULL,
  vl_dest_classe INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Classe),
  INDEX Classe_FKIndex1(Raca_id_Raca),
  FOREIGN KEY(Raca_id_Raca)
    REFERENCES Raca(id_Raca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Habilidade (
  id_Habilidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Raca_id_Raca INTEGER UNSIGNED NOT NULL,
  Classe_id_Classe INTEGER UNSIGNED NOT NULL,
  Tipo_Habilidade_id_Tipo_Habilidade INTEGER UNSIGNED NOT NULL,
  dano_base_hab INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Habilidade),
  INDEX Habilidade_FKIndex1(Tipo_Habilidade_id_Tipo_Habilidade),
  INDEX Habilidade_FKIndex2(Classe_id_Classe),
  INDEX Habilidade_FKIndex3(Raca_id_Raca),
  FOREIGN KEY(Tipo_Habilidade_id_Tipo_Habilidade)
    REFERENCES Tipo_Habilidade(id_Tipo_Habilidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Classe_id_Classe)
    REFERENCES Classe(id_Classe)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Raca_id_Raca)
    REFERENCES Raca(id_Raca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Personagem (
  id_Personagem INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Raca_id_Raca INTEGER UNSIGNED NOT NULL,
  TIpo_Personagem_id_Tipo_Personagem INTEGER UNSIGNED NOT NULL,
  Usuario_id_Usuario INTEGER UNSIGNED NOT NULL,
  nm_Personagem VARCHAR(45) NULL,
  genero INTEGER UNSIGNED NULL,
  dt_Criacao DATE NULL,
  vl_Experiencia INTEGER UNSIGNED NULL,
  status_2 INTEGER UNSIGNED NULL,
  vl_Vida_Inic INTEGER UNSIGNED NULL,
  vl_Mana_Inic INTEGER UNSIGNED NULL,
  vl_Stamina_Inic INTEGER UNSIGNED NULL,
  vl_Base_Dano INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Personagem),
  INDEX Personagem_FKIndex1(Usuario_id_Usuario),
  INDEX Personagem_FKIndex2(TIpo_Personagem_id_Tipo_Personagem),
  INDEX Personagem_FKIndex4(Raca_id_Raca),
  FOREIGN KEY(Usuario_id_Usuario)
    REFERENCES Usuario(id_Usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(TIpo_Personagem_id_Tipo_Personagem)
    REFERENCES TIpo_Personagem(id_Tipo_Personagem)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Raca_id_Raca)
    REFERENCES Raca(id_Raca)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Inventario (
  id_Inventario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Item_id_Item INTEGER UNSIGNED NOT NULL,
  Personagem_id_Personagem INTEGER UNSIGNED NOT NULL,
  Tipo_Inventario_id_Tipo_Inventario INTEGER UNSIGNED NOT NULL,
  qtd_itens INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Inventario),
  INDEX Inventario_FKIndex1(Tipo_Inventario_id_Tipo_Inventario),
  INDEX Inventario_FKIndex2(Personagem_id_Personagem),
  INDEX Inventario_FKIndex3(Item_id_Item),
  FOREIGN KEY(Tipo_Inventario_id_Tipo_Inventario)
    REFERENCES Tipo_Inventario(id_Tipo_Inventario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Personagem_id_Personagem)
    REFERENCES Personagem(id_Personagem)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Item_id_Item)
    REFERENCES Item(id_Item)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Cidade (
  id_Cidade INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Personagem_id_Personagem INTEGER UNSIGNED NOT NULL,
  nm_Cidade VARCHAR(45) NULL,
  sqm_cidade INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Cidade),
  INDEX Cidade_FKIndex1(Personagem_id_Personagem),
  FOREIGN KEY(Personagem_id_Personagem)
    REFERENCES Personagem(id_Personagem)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Quest (
  id_Quest INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Item_id_Item INTEGER UNSIGNED NOT NULL,
  Cidade_id_Cidade INTEGER UNSIGNED NOT NULL,
  Personagem_id_Personagem INTEGER UNSIGNED NOT NULL,
  Tipo_Quest_idTipo_Quest INTEGER UNSIGNED NOT NULL,
  nm_Quest INTEGER UNSIGNED NULL,
  ds_Quest VARCHAR(45) NULL,
  qt_exp_recomp INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_Quest),
  INDEX Quest_FKIndex1(Tipo_Quest_idTipo_Quest),
  INDEX Quest_FKIndex2(Personagem_id_Personagem),
  INDEX Quest_FKIndex3(Cidade_id_Cidade),
  INDEX Quest_FKIndex4(Item_id_Item),
  FOREIGN KEY(Tipo_Quest_idTipo_Quest)
    REFERENCES Tipo_Quest(idTipo_Quest)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Personagem_id_Personagem)
    REFERENCES Personagem(id_Personagem)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Cidade_id_Cidade)
    REFERENCES Cidade(id_Cidade)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Item_id_Item)
    REFERENCES Item(id_Item)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


