DROP SCHEMA IF EXISTS WeStudy;
CREATE SCHEMA WeStudy;
USE WeStudy;


CREATE TABLE Usuario (
    email VARCHAR(100) NOT NULL,
    ranking INT,
    nome TEXT NOT NULL,
    senha VARCHAR(64) NOT NULL,
    tipo ENUM('Educador','Aluno') NOT NULL,
    desconto INT,

    CONSTRAINT pk_usuario PRIMARY KEY (email)
);


CREATE TABLE Qualificacao (
    cd_diploma INT NOT NULL,
    usuario_email VARCHAR(100) NOT NULL,
    arquivo BLOB,
    link VARCHAR(500),

    CONSTRAINT pk_qualificacao PRIMARY KEY (cd_diploma),

    CONSTRAINT fk_qualificacao_usuario
        FOREIGN KEY (usuario_email)
        REFERENCES Usuario(email)
);


CREATE TABLE Arquivo_guia (
    cd_midia INT NOT NULL,
    arquivo BLOB NOT NULL,

    CONSTRAINT pk_arquivo_guia PRIMARY KEY (cd_midia)
);


CREATE TABLE Guia_publicado (
    cd_publicado INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_criacao DATE NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    tipo ENUM('Pago','Gratuito') NOT NULL,

    CONSTRAINT pk_guia_publicado PRIMARY KEY (cd_publicado)
);


CREATE TABLE Guia (
    cd_guia INT NOT NULL,
    cd_publicacao INT,
    autor_email VARCHAR(100) NOT NULL,
    disciplina TINYTEXT NOT NULL,
    texto LONGTEXT NOT NULL,
    topico TEXT NOT NULL,

    CONSTRAINT pk_guia PRIMARY KEY (cd_guia),

    CONSTRAINT fk_guia_publicacao
        FOREIGN KEY (cd_publicacao)
        REFERENCES Guia_publicado(cd_publicado),

    CONSTRAINT fk_guia_autor
        FOREIGN KEY (autor_email)
        REFERENCES Usuario(email)
);


CREATE TABLE Guia_Arquivo (
    cd_arquivo INT NOT NULL,
    cd_guia INT NOT NULL,

    CONSTRAINT pk_guia_arquivo
        PRIMARY KEY (cd_arquivo, cd_guia),

    CONSTRAINT fk_guia_arquivo_arquivo
        FOREIGN KEY (cd_arquivo)
        REFERENCES Arquivo_guia(cd_midia),

    CONSTRAINT fk_guia_arquivo_guia
        FOREIGN KEY (cd_guia)
        REFERENCES Guia(cd_guia)
);


CREATE TABLE Pergunta_guia (
    cd_pergunta INT NOT NULL,
    cd_guia INT NOT NULL,
    enunciado TEXT NOT NULL,
    tipo ENUM('Dissertativa','Alternativa') NOT NULL,
    resposta_certa TEXT NOT NULL,

    CONSTRAINT pk_pergunta_guia PRIMARY KEY (cd_pergunta),

    CONSTRAINT fk_pergunta_guia_guia
        FOREIGN KEY (cd_guia)
        REFERENCES Guia(cd_guia)
);


CREATE TABLE Alternativa (
    cd_alternativa INT NOT NULL,
    cd_pergunta INT NOT NULL,
    resposta TINYTEXT NOT NULL,

    CONSTRAINT pk_alternativa PRIMARY KEY (cd_alternativa),

    CONSTRAINT fk_alternativa_pergunta
        FOREIGN KEY (cd_pergunta)
        REFERENCES Pergunta_guia(cd_pergunta)
);


CREATE TABLE Acesso_guia (
    cd_publicacao INT NOT NULL,
    usuario_email VARCHAR(100) NOT NULL,

    CONSTRAINT pk_acesso_guia
        PRIMARY KEY (cd_publicacao, usuario_email),

    CONSTRAINT fk_acesso_guia_publicacao
        FOREIGN KEY (cd_publicacao)
        REFERENCES Guia_publicado(cd_publicado),

    CONSTRAINT fk_acesso_guia_usuario
        FOREIGN KEY (usuario_email)
        REFERENCES Usuario(email)
);


CREATE TABLE Amizade (
    cd_amizade INT NOT NULL,
    amigo_1 VARCHAR(100) NOT NULL,
    amigo_2 VARCHAR(100) NOT NULL,
    status ENUM('Pendente','Aceito') NOT NULL,

    CONSTRAINT pk_amizade PRIMARY KEY (cd_amizade),

    CONSTRAINT fk_amizade_usuario_1
        FOREIGN KEY (amigo_1)
        REFERENCES Usuario(email),

    CONSTRAINT fk_amizade_usuario_2
        FOREIGN KEY (amigo_2)
        REFERENCES Usuario(email)
);


CREATE TABLE Caderno_publicado (
    cd_publicacao INT NOT NULL,
    data_publicacao DATE NOT NULL,
    qt_acessos INT NOT NULL,

    CONSTRAINT pk_caderno_publicado PRIMARY KEY (cd_publicacao)
);


CREATE TABLE Caderno_aluno (
    cd_caderno INT NOT NULL,
    cd_guia INT,
    cd_publicacao INT,
    texto LONGTEXT NOT NULL,
    disciplina TINYTEXT NOT NULL,
    topico TINYTEXT NOT NULL,

    CONSTRAINT pk_caderno_aluno PRIMARY KEY (cd_caderno),

    CONSTRAINT fk_caderno_aluno_guia
        FOREIGN KEY (cd_guia)
        REFERENCES Guia(cd_guia),

    CONSTRAINT fk_caderno_aluno_publicacao
        FOREIGN KEY (cd_publicacao)
        REFERENCES Caderno_publicado(cd_publicacao)
);


CREATE TABLE Sessao (
    cd_sessao INT NOT NULL,
    criador_email VARCHAR(100) NOT NULL,
    cd_guia INT,
    topico TINYTEXT NOT NULL,
    disciplina TINYTEXT NOT NULL,
    privado TINYINT NOT NULL,
    qt_pessoas_limite INT NOT NULL,
    codigo_entrada CHAR(9),
    texto_caderno LONGTEXT,

    CONSTRAINT pk_sessao PRIMARY KEY (cd_sessao),

    CONSTRAINT fk_sessao_criador
        FOREIGN KEY (criador_email)
        REFERENCES Usuario(email),

    CONSTRAINT fk_sessao_guia
        FOREIGN KEY (cd_guia)
        REFERENCES Guia(cd_guia)
);


CREATE TABLE Participante_sessao (
    cd_sessao INT NOT NULL,
    usuario_email VARCHAR(100) NOT NULL,

    CONSTRAINT pk_participante_sessao
        PRIMARY KEY (cd_sessao, usuario_email),

    CONSTRAINT fk_participante_sessao_sessao
        FOREIGN KEY (cd_sessao)
        REFERENCES Sessao(cd_sessao),

    CONSTRAINT fk_participante_sessao_usuario
        FOREIGN KEY (usuario_email)
        REFERENCES Usuario(email)
);


CREATE TABLE Mensagem (
    cd_mensagem INT NOT NULL,
    participante_email VARCHAR(100) NOT NULL,
    cd_sessao INT NOT NULL,
    data DATETIME NOT NULL,
    texto MEDIUMTEXT,
    midia BLOB,

    CONSTRAINT pk_mensagem PRIMARY KEY (cd_mensagem),

    CONSTRAINT fk_mensagem_participante
        FOREIGN KEY (cd_sessao, participante_email)
        REFERENCES Participante_sessao(cd_sessao, usuario_email)
);