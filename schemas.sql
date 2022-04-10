CREATE DATABASE IF NOT EXISTS ORGANIZADOR_EVENTOS;

CREATE TABLE USUARIOS (
	ID_USUARIO BIGSERIAL NOT NULL,
	USERNAME CHARACTER(80) NOT NULL UNIQUE,
	PASSWORD CHARACTER(80) NOT NULL,
	EMAIL CHARACTER(80) NOT NULL UNIQUE,
	APELIDO CHARACTER(80) NOT NULL,
	ATIVO BOOLEAN DEFAULT TRUE,
	DATA_CRIACAO TIMESTAMP DEFAULT NOW(),
	DATA_ATUALIZACAO TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ID_USUARIO)
);

CREATE TABLE CONTATOS (
	ID_CONTATO BIGSERIAL NOT NULL,
	ID_USUARIO_PRINCIPAL BIGSERIAL NOT NULL,
	ID_USUARIO_CONTATO BIGSERIAL NOT NULL,
	APELIDO CHARACTER(80) NOT NULL,
	EMAIL CHARACTER(80) NOT NULL,
	DATA_CRIACAO TIMESTAMP DEFAULT NOW(),
	DATA_ATUALIZACAO TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ID_CONTATO),
	FOREIGN KEY (ID_USUARIO_PRINCIPAL) REFERENCES USUARIOS (ID_USUARIO),
	FOREIGN KEY (ID_USUARIO_CONTATO) REFERENCES USUARIOS (ID_USUARIO)
);

CREATE TABLE EVENTOS (
	ID_EVENTO BIGSERIAL NOT NULL,
	ID_USUARIO BIGSERIAL NOT NULL,
	TITULO CHARACTER(80) NOT NULL,
	DESCRICAO TEXT,
	DATA DATE,
	STATUS BOOLEAN DEFAULT TRUE,
	DATA_CRIACAO TIMESTAMP DEFAULT NOW(),
	DATA_ATUALIZACAO TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ID_EVENTO),
	FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO)
);

CREATE TABLE CONVIDADOS (
	ID_CONVIDADO BIGSERIAL NOT NULL,
	ID_CONTATO BIGSERIAL NOT NULL,
	CONFIRMACAO BOOLEAN DEFAULT FALSE,
	DATA_CRIACAO TIMESTAMP DEFAULT NOW(),
	DATA_ATUALIZACAO TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ID_CONVIDADO),
	FOREIGN KEY (ID_CONTATO) REFERENCES CONTATOS (ID_CONTATO)
);

CREATE TABLE LOCAIS (
	ID_LOCAL BIGSERIAL NOT NULL,
	ID_USUARIO BIGSERIAL NOT NULL,
	DESCRICAO CHARACTER (240),
	CIDADE CHARACTER(80) NOT NULL,
	BAIRRO CHARACTER(160) NOT NULL,
	RUA CHARACTER(160) NOT NULL,
	NUMERO NUMERIC NOT NULL,
	COMPLEMENTO CHARACTER(240),
	DATA_CRIACAO TIMESTAMP DEFAULT NOW(),
	DATA_ATUALIZACAO TIMESTAMP DEFAULT NOW(),
	PRIMARY KEY (ID_LOCAL),
	FOREIGN KEY (ID_USUARIO) REFERENCES USUARIOS (ID_USUARIO)
);

