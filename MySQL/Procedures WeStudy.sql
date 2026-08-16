DELIMITER $$


DROP PROCEDURE IF EXISTS cadastrar_usuario$$
CREATE PROCEDURE cadastrar_usuario(
    pNome TEXT,
    pEmail VARCHAR(100),
    pSenha VARCHAR(64),
    pTipo ENUM('Educador','Aluno')
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pEmail;

    IF qtd > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Já existe um usuário com esse email';
    ELSE
        INSERT INTO Usuario (
            email,
            ranking,
            nome,
            senha,
            tipo,
            desconto
        )
        VALUES (
            pEmail,
            NULL,
            pNome,
            pSenha,
            pTipo,
            NULL
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_usuario$$
CREATE PROCEDURE consultar_usuario(
    pEmail VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pEmail;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSE
        SELECT *
        FROM Usuario
        WHERE email = pEmail;
    END IF;
END $$


DROP PROCEDURE IF EXISTS atualizar_usuario$$
CREATE PROCEDURE atualizar_usuario(
    pEmail VARCHAR(100),
    pNome TEXT,
    pSenha VARCHAR(64)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pEmail;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSE
        UPDATE Usuario
        SET nome = pNome,
            senha = pSenha
        WHERE email = pEmail;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_usuario$$
CREATE PROCEDURE excluir_usuario(
    pEmail VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pEmail;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSE
        DELETE FROM Usuario
        WHERE email = pEmail;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_qualificacao$$
CREATE PROCEDURE cadastrar_qualificacao(
    pUsuario_email VARCHAR(100),
    pArquivo BLOB,
    pLink VARCHAR(500)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pUsuario_email
    AND tipo = 'Educador';

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Educador não encontrado';
    ELSE
        SELECT IFNULL(MAX(cd_diploma) + 1, 1)
        INTO codigo
        FROM Qualificacao;

        INSERT INTO Qualificacao (
            cd_diploma,
            usuario_email,
            arquivo,
            link
        )
        VALUES (
            codigo,
            pUsuario_email,
            pArquivo,
            pLink
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_qualificacoes$$
CREATE PROCEDURE consultar_qualificacoes(
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pUsuario_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSE
        SELECT *
        FROM Qualificacao
        WHERE usuario_email = pUsuario_email;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_qualificacao$$
CREATE PROCEDURE excluir_qualificacao(
    pCd_diploma INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Qualificacao
    WHERE cd_diploma = pCd_diploma;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Qualificação não encontrada';
    ELSE
        DELETE FROM Qualificacao
        WHERE cd_diploma = pCd_diploma;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_arquivo_guia$$
CREATE PROCEDURE cadastrar_arquivo_guia(
    pArquivo BLOB
)
BEGIN
    DECLARE codigo INT DEFAULT 0;

    SELECT IFNULL(MAX(cd_midia) + 1, 1)
    INTO codigo
    FROM Arquivo_guia;

    INSERT INTO Arquivo_guia (
        cd_midia,
        arquivo
    )
    VALUES (
        codigo,
        pArquivo
    );
END $$


DROP PROCEDURE IF EXISTS excluir_arquivo_guia$$
CREATE PROCEDURE excluir_arquivo_guia(
    pCd_midia INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Arquivo_guia
    WHERE cd_midia = pCd_midia;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Arquivo não encontrado';
    ELSE
        DELETE FROM Arquivo_guia
        WHERE cd_midia = pCd_midia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_guia$$
CREATE PROCEDURE cadastrar_guia(
    pAutor_email VARCHAR(100),
    pDisciplina TINYTEXT,
    pTexto LONGTEXT,
    pTopico TEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pAutor_email
    AND tipo = 'Educador';

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Apenas educadores podem criar guias';
    ELSE
        SELECT IFNULL(MAX(cd_guia) + 1, 1)
        INTO codigo
        FROM Guia;

        INSERT INTO Guia (
            cd_guia,
            cd_publicacao,
            autor_email,
            disciplina,
            texto,
            topico
        )
        VALUES (
            codigo,
            NULL,
            pAutor_email,
            pDisciplina,
            pTexto,
            pTopico
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_guia$$
CREATE PROCEDURE consultar_guia(
    pCd_guia INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado';
    ELSE
        SELECT *
        FROM Guia
        WHERE cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS atualizar_guia$$
CREATE PROCEDURE atualizar_guia(
    pCd_guia INT,
    pAutor_email VARCHAR(100),
    pDisciplina TINYTEXT,
    pTexto LONGTEXT,
    pTopico TEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia
    AND autor_email = pAutor_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado ou usuário não é o autor';
    ELSE
        UPDATE Guia
        SET disciplina = pDisciplina,
            texto = pTexto,
            topico = pTopico
        WHERE cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_guia$$
CREATE PROCEDURE excluir_guia(
    pCd_guia INT,
    pAutor_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia
    AND autor_email = pAutor_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado ou usuário não é o autor';
    ELSE
        DELETE FROM Guia
        WHERE cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS adicionar_arquivo_guia$$
CREATE PROCEDURE adicionar_arquivo_guia(
    pCd_arquivo INT,
    pCd_guia INT
)
BEGIN
    DECLARE qtd_arquivo INT DEFAULT 0;
    DECLARE qtd_guia INT DEFAULT 0;
    DECLARE qtd_relacao INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_arquivo
    FROM Arquivo_guia
    WHERE cd_midia = pCd_arquivo;

    SELECT COUNT(*) INTO qtd_guia
    FROM Guia
    WHERE cd_guia = pCd_guia;

    SELECT COUNT(*) INTO qtd_relacao
    FROM Guia_Arquivo
    WHERE cd_arquivo = pCd_arquivo
    AND cd_guia = pCd_guia;

    IF qtd_arquivo = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Arquivo não encontrado';
    ELSEIF qtd_guia = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado';
    ELSEIF qtd_relacao > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Arquivo já está associado ao guia';
    ELSE
        INSERT INTO Guia_Arquivo (
            cd_arquivo,
            cd_guia
        )
        VALUES (
            pCd_arquivo,
            pCd_guia
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS remover_arquivo_guia$$
CREATE PROCEDURE remover_arquivo_guia(
    pCd_arquivo INT,
    pCd_guia INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia_Arquivo
    WHERE cd_arquivo = pCd_arquivo
    AND cd_guia = pCd_guia;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Associação entre arquivo e guia não encontrada';
    ELSE
        DELETE FROM Guia_Arquivo
        WHERE cd_arquivo = pCd_arquivo
        AND cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_pergunta$$
CREATE PROCEDURE cadastrar_pergunta(
    pCd_guia INT,
    pEnunciado TEXT,
    pTipo ENUM('Dissertativa','Alternativa'),
    pResposta_certa TEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado';
    ELSE
        SELECT IFNULL(MAX(cd_pergunta) + 1, 1)
        INTO codigo
        FROM Pergunta_guia;

        INSERT INTO Pergunta_guia (
            cd_pergunta,
            cd_guia,
            enunciado,
            tipo,
            resposta_certa
        )
        VALUES (
            codigo,
            pCd_guia,
            pEnunciado,
            pTipo,
            pResposta_certa
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_perguntas_guia$$
CREATE PROCEDURE consultar_perguntas_guia(
    pCd_guia INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado';
    ELSE
        SELECT *
        FROM Pergunta_guia
        WHERE cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS atualizar_pergunta$$
CREATE PROCEDURE atualizar_pergunta(
    pCd_pergunta INT,
    pEnunciado TEXT,
    pTipo ENUM('Dissertativa','Alternativa'),
    pResposta_certa TEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Pergunta_guia
    WHERE cd_pergunta = pCd_pergunta;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pergunta não encontrada';
    ELSE
        UPDATE Pergunta_guia
        SET enunciado = pEnunciado,
            tipo = pTipo,
            resposta_certa = pResposta_certa
        WHERE cd_pergunta = pCd_pergunta;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_pergunta$$
CREATE PROCEDURE excluir_pergunta(
    pCd_pergunta INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Pergunta_guia
    WHERE cd_pergunta = pCd_pergunta;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pergunta não encontrada';
    ELSE
        DELETE FROM Pergunta_guia
        WHERE cd_pergunta = pCd_pergunta;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_alternativa$$
CREATE PROCEDURE cadastrar_alternativa(
    pCd_pergunta INT,
    pResposta TINYTEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE qtd_alternativas INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Pergunta_guia
    WHERE cd_pergunta = pCd_pergunta
    AND tipo = 'Alternativa';

    SELECT COUNT(*) INTO qtd_alternativas
    FROM Alternativa
    WHERE cd_pergunta = pCd_pergunta;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pergunta não encontrada ou não é do tipo Alternativa';
    ELSEIF qtd_alternativas >= 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Uma pergunta pode possuir no máximo 5 alternativas';
    ELSE
        SELECT IFNULL(MAX(cd_alternativa) + 1, 1)
        INTO codigo
        FROM Alternativa;

        INSERT INTO Alternativa (
            cd_alternativa,
            cd_pergunta,
            resposta
        )
        VALUES (
            codigo,
            pCd_pergunta,
            pResposta
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_alternativas$$
CREATE PROCEDURE consultar_alternativas(
    pCd_pergunta INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Pergunta_guia
    WHERE cd_pergunta = pCd_pergunta;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pergunta não encontrada';
    ELSE
        SELECT *
        FROM Alternativa
        WHERE cd_pergunta = pCd_pergunta;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_alternativa$$
CREATE PROCEDURE excluir_alternativa(
    pCd_alternativa INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Alternativa
    WHERE cd_alternativa = pCd_alternativa;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Alternativa não encontrada';
    ELSE
        DELETE FROM Alternativa
        WHERE cd_alternativa = pCd_alternativa;
    END IF;
END $$


DROP PROCEDURE IF EXISTS publicar_guia$$
CREATE PROCEDURE publicar_guia(
    pCd_guia INT,
    pPreco DECIMAL(10,2),
    pDescricao VARCHAR(500),
    pTipo ENUM('Pago','Gratuito')
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE publicado INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Guia
    WHERE cd_guia = pCd_guia
    AND cd_publicacao IS NULL;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado ou já publicado';
    ELSE
        SELECT IFNULL(MAX(cd_publicado) + 1, 1)
        INTO publicado
        FROM Guia_publicado;

        INSERT INTO Guia_publicado (
            cd_publicado,
            preco,
            data_criacao,
            descricao,
            tipo
        )
        VALUES (
            publicado,
            pPreco,
            CURDATE(),
            pDescricao,
            pTipo
        );

        UPDATE Guia
        SET cd_publicacao = publicado
        WHERE cd_guia = pCd_guia;
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_guias_publicados$$
CREATE PROCEDURE consultar_guias_publicados()
BEGIN
    SELECT
        G.cd_guia,
        G.autor_email,
        G.disciplina,
        G.topico,
        GP.cd_publicado,
        GP.preco,
        GP.data_criacao,
        GP.descricao,
        GP.tipo
    FROM Guia G
    INNER JOIN Guia_publicado GP
        ON G.cd_publicacao = GP.cd_publicado;
END $$


DROP PROCEDURE IF EXISTS adquirir_guia$$
CREATE PROCEDURE adquirir_guia(
    pCd_publicacao INT,
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd_publicacao INT DEFAULT 0;
    DECLARE qtd_usuario INT DEFAULT 0;
    DECLARE qtd_acesso INT DEFAULT 0;
    DECLARE tipo_guia VARCHAR(20);

    SELECT COUNT(*) INTO qtd_publicacao
    FROM Guia_publicado
    WHERE cd_publicado = pCd_publicacao;

    SELECT COUNT(*) INTO qtd_usuario
    FROM Usuario
    WHERE email = pUsuario_email;

    SELECT COUNT(*) INTO qtd_acesso
    FROM Acesso_guia
    WHERE cd_publicacao = pCd_publicacao
    AND usuario_email = pUsuario_email;

    SELECT tipo INTO tipo_guia
    FROM Guia_publicado
    WHERE cd_publicado = pCd_publicacao;

    IF qtd_publicacao = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia publicado não encontrado';
    ELSEIF qtd_usuario = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSEIF qtd_acesso > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário já possui acesso a este guia';
    ELSE
        INSERT INTO Acesso_guia (
            cd_publicacao,
            usuario_email
        )
        VALUES (
            pCd_publicacao,
            pUsuario_email
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_guias_usuario$$
CREATE PROCEDURE consultar_guias_usuario(
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Usuario
    WHERE email = pUsuario_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSE
        SELECT
            G.cd_guia,
            G.autor_email,
            G.disciplina,
            G.topico,
            GP.cd_publicado,
            GP.preco,
            GP.tipo
        FROM Acesso_guia A
        INNER JOIN Guia_publicado GP
            ON A.cd_publicacao = GP.cd_publicado
        INNER JOIN Guia G
            ON G.cd_publicacao = GP.cd_publicado
        WHERE A.usuario_email = pUsuario_email;
    END IF;
END $$


DROP PROCEDURE IF EXISTS remover_acesso_guia$$
CREATE PROCEDURE remover_acesso_guia(
    pCd_publicacao INT,
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Acesso_guia
    WHERE cd_publicacao = pCd_publicacao
    AND usuario_email = pUsuario_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acesso não encontrado';
    ELSE
        DELETE FROM Acesso_guia
        WHERE cd_publicacao = pCd_publicacao
        AND usuario_email = pUsuario_email;
    END IF;
END $$


DROP PROCEDURE IF EXISTS criar_amizade$$
CREATE PROCEDURE criar_amizade(
    pAmigo_1 VARCHAR(100),
    pAmigo_2 VARCHAR(100)
)
BEGIN
    DECLARE qtd_1 INT DEFAULT 0;
    DECLARE qtd_2 INT DEFAULT 0;
    DECLARE qtd_amizade INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_1
    FROM Usuario
    WHERE email = pAmigo_1;

    SELECT COUNT(*) INTO qtd_2
    FROM Usuario
    WHERE email = pAmigo_2;

    SELECT COUNT(*) INTO qtd_amizade
    FROM Amizade
    WHERE (amigo_1 = pAmigo_1 AND amigo_2 = pAmigo_2)
       OR (amigo_1 = pAmigo_2 AND amigo_2 = pAmigo_1);

    IF qtd_1 = 0 OR qtd_2 = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Um dos usuários não existe';
    ELSEIF pAmigo_1 = pAmigo_2 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível adicionar a si mesmo';
    ELSEIF qtd_amizade > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Já existe uma amizade entre esses usuários';
    ELSE
        SELECT IFNULL(MAX(cd_amizade) + 1, 1)
        INTO codigo
        FROM Amizade;

        INSERT INTO Amizade (
            cd_amizade,
            amigo_1,
            amigo_2,
            status
        )
        VALUES (
            codigo,
            pAmigo_1,
            pAmigo_2,
            'Pendente'
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS atualizar_amizade$$
CREATE PROCEDURE atualizar_amizade(
    pCd_amizade INT,
    pStatus ENUM('Pendente','Aceito','Negado')
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Amizade
    WHERE cd_amizade = pCd_amizade;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amizade não encontrada';
    ELSE
        UPDATE Amizade
        SET status = pStatus
        WHERE cd_amizade = pCd_amizade;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_amizade$$
CREATE PROCEDURE excluir_amizade(
    pCd_amizade INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Amizade
    WHERE cd_amizade = pCd_amizade;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amizade não encontrada';
    ELSE
        DELETE FROM Amizade
        WHERE cd_amizade = pCd_amizade;
    END IF;
END $$


DROP PROCEDURE IF EXISTS publicar_caderno$$
CREATE PROCEDURE publicar_caderno(
    pCd_caderno INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Caderno_aluno
    WHERE cd_caderno = pCd_caderno
    AND cd_publicacao IS NULL;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caderno não encontrado ou já publicado';
    ELSE
        SELECT IFNULL(MAX(cd_publicacao) + 1, 1)
        INTO codigo
        FROM Caderno_publicado;

        INSERT INTO Caderno_publicado (
            cd_publicacao,
            data_publicacao,
            qt_acessos
        )
        VALUES (
            codigo,
            CURDATE(),
            0
        );

        UPDATE Caderno_aluno
        SET cd_publicacao = codigo
        WHERE cd_caderno = pCd_caderno;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_caderno$$
CREATE PROCEDURE cadastrar_caderno(
    pCd_guia INT,
    pTexto LONGTEXT,
    pDisciplina TINYTEXT,
    pTopico TINYTEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    IF pCd_guia IS NOT NULL THEN
        SELECT COUNT(*) INTO qtd
        FROM Guia
        WHERE cd_guia = pCd_guia;

        IF qtd = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Guia não encontrado';
        END IF;
    END IF;

    SELECT IFNULL(MAX(cd_caderno) + 1, 1)
    INTO codigo
    FROM Caderno_aluno;

    INSERT INTO Caderno_aluno (
        cd_caderno,
        cd_guia,
        cd_publicacao,
        texto,
        disciplina,
        topico
    )
    VALUES (
        codigo,
        pCd_guia,
        NULL,
        pTexto,
        pDisciplina,
        pTopico
    );
END $$


DROP PROCEDURE IF EXISTS atualizar_caderno$$
CREATE PROCEDURE atualizar_caderno(
    pCd_caderno INT,
    pTexto LONGTEXT,
    pDisciplina TINYTEXT,
    pTopico TINYTEXT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Caderno_aluno
    WHERE cd_caderno = pCd_caderno;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caderno não encontrado';
    ELSE
        UPDATE Caderno_aluno
        SET texto = pTexto,
            disciplina = pDisciplina,
            topico = pTopico
        WHERE cd_caderno = pCd_caderno;
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_caderno$$
CREATE PROCEDURE consultar_caderno(
    pCd_caderno INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Caderno_aluno
    WHERE cd_caderno = pCd_caderno;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caderno não encontrado';
    ELSE
        SELECT *
        FROM Caderno_aluno
        WHERE cd_caderno = pCd_caderno;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_caderno$$
CREATE PROCEDURE excluir_caderno(
    pCd_caderno INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Caderno_aluno
    WHERE cd_caderno = pCd_caderno;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Caderno não encontrado';
    ELSE
        DELETE FROM Caderno_aluno
        WHERE cd_caderno = pCd_caderno;
    END IF;
END $$


DROP PROCEDURE IF EXISTS criar_sessao$$
CREATE PROCEDURE criar_sessao(
    pCriador_email VARCHAR(100),
    pCd_guia INT,
    pTopico TINYTEXT,
    pDisciplina TINYTEXT,
    pPrivado TINYINT,
    pQt_pessoas_limite INT,
    pCodigo_entrada CHAR(9),
    pTexto_caderno LONGTEXT
)
BEGIN
    DECLARE qtd_usuario INT DEFAULT 0;
    DECLARE qtd_guia INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_usuario
    FROM Usuario
    WHERE email = pCriador_email;

    IF pCd_guia IS NOT NULL THEN
        SELECT COUNT(*) INTO qtd_guia
        FROM Guia
        WHERE cd_guia = pCd_guia;
    END IF;

    IF qtd_usuario = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário criador não encontrado';
    ELSEIF pCd_guia IS NOT NULL AND qtd_guia = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Guia não encontrado';
    ELSE
        SELECT IFNULL(MAX(cd_sessao) + 1, 1)
        INTO codigo
        FROM Sessao;

        INSERT INTO Sessao (
            cd_sessao,
            criador_email,
            cd_guia,
            topico,
            disciplina,
            privado,
            qt_pessoas_limite,
            codigo_entrada,
            texto_caderno
        )
        VALUES (
            codigo,
            pCriador_email,
            pCd_guia,
            pTopico,
            pDisciplina,
            pPrivado,
            pQt_pessoas_limite,
            pCodigo_entrada,
            pTexto_caderno
        );

        INSERT INTO Participante_sessao (
            cd_sessao,
            usuario_email
        )
        VALUES (
            codigo,
            pCriador_email
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_sessoes_abertas$$
CREATE PROCEDURE consultar_sessoes_abertas()
BEGIN
    SELECT
        S.cd_sessao,
        S.criador_email,
        U.nome AS criador,
        S.cd_guia,
        S.topico,
        S.disciplina,
        S.privado,
        S.qt_pessoas_limite,
        COUNT(P.usuario_email) AS participantes
    FROM Sessao S
    INNER JOIN Usuario U
        ON S.criador_email = U.email
    LEFT JOIN Participante_sessao P
        ON S.cd_sessao = P.cd_sessao
    WHERE S.privado = 0
    GROUP BY
        S.cd_sessao,
        S.criador_email,
        U.nome,
        S.cd_guia,
        S.topico,
        S.disciplina,
        S.privado,
        S.qt_pessoas_limite;
END $$


DROP PROCEDURE IF EXISTS entrar_sessao$$
CREATE PROCEDURE entrar_sessao(
    pCd_sessao INT,
    pUsuario_email VARCHAR(100),
    pCodigo_entrada CHAR(9)
)
BEGIN
    DECLARE qtd_sessao INT DEFAULT 0;
    DECLARE qtd_usuario INT DEFAULT 0;
    DECLARE qtd_participante INT DEFAULT 0;
    DECLARE qtd_pessoas INT DEFAULT 0;
    DECLARE limite INT DEFAULT 0;
    DECLARE privada TINYINT DEFAULT 0;
    DECLARE codigo CHAR(9);

    SELECT COUNT(*) INTO qtd_sessao
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    SELECT COUNT(*) INTO qtd_usuario
    FROM Usuario
    WHERE email = pUsuario_email;

    SELECT COUNT(*) INTO qtd_participante
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao
    AND usuario_email = pUsuario_email;

    SELECT privado, qt_pessoas_limite, codigo_entrada
    INTO privada, limite, codigo
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    SELECT COUNT(*) INTO qtd_pessoas
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao;

    IF qtd_sessao = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sessão não encontrada';
    ELSEIF qtd_usuario = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSEIF qtd_participante > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário já está na sessão';
    ELSEIF qtd_pessoas >= limite THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A sessão atingiu o limite de participantes';
    ELSEIF privada = 1 AND codigo <> pCodigo_entrada THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Código de entrada inválido';
    ELSE
        INSERT INTO Participante_sessao (
            cd_sessao,
            usuario_email
        )
        VALUES (
            pCd_sessao,
            pUsuario_email
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS sair_sessao$$
CREATE PROCEDURE sair_sessao(
    pCd_sessao INT,
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;
    DECLARE criador VARCHAR(100);

    SELECT COUNT(*) INTO qtd
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao
    AND usuario_email = pUsuario_email;

    SELECT criador_email INTO criador
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não está na sessão';
    ELSEIF criador = pUsuario_email THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O criador deve encerrar a sessão';
    ELSE
        DELETE FROM Participante_sessao
        WHERE cd_sessao = pCd_sessao
        AND usuario_email = pUsuario_email;
    END IF;
END $$


DROP PROCEDURE IF EXISTS encerrar_sessao$$
CREATE PROCEDURE encerrar_sessao(
    pCd_sessao INT,
    pCriador_email VARCHAR(100)
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Sessao
    WHERE cd_sessao = pCd_sessao
    AND criador_email = pCriador_email;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sessão não encontrada ou usuário não é o criador';
    ELSE
        DELETE FROM Mensagem
        WHERE cd_sessao = pCd_sessao;

        DELETE FROM Participante_sessao
        WHERE cd_sessao = pCd_sessao;

        DELETE FROM Sessao
        WHERE cd_sessao = pCd_sessao;
    END IF;
END $$


DROP PROCEDURE IF EXISTS expulsar_participante$$
CREATE PROCEDURE expulsar_participante(
    pCd_sessao INT,
    pCriador_email VARCHAR(100),
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd_criador INT DEFAULT 0;
    DECLARE qtd_participante INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_criador
    FROM Sessao
    WHERE cd_sessao = pCd_sessao
    AND criador_email = pCriador_email;

    SELECT COUNT(*) INTO qtd_participante
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao
    AND usuario_email = pUsuario_email;

    IF qtd_criador = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não é o criador da sessão';
    ELSEIF qtd_participante = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não está na sessão';
    ELSEIF pCriador_email = pUsuario_email THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O criador não pode expulsar a si mesmo';
    ELSE
        DELETE FROM Mensagem
        WHERE cd_sessao = pCd_sessao
        AND participante_email = pUsuario_email;

        DELETE FROM Participante_sessao
        WHERE cd_sessao = pCd_sessao
        AND usuario_email = pUsuario_email;
    END IF;
END $$


DROP PROCEDURE IF EXISTS cadastrar_participante$$
CREATE PROCEDURE cadastrar_participante(
    pCd_sessao INT,
    pUsuario_email VARCHAR(100)
)
BEGIN
    DECLARE qtd_sessao INT DEFAULT 0;
    DECLARE qtd_usuario INT DEFAULT 0;
    DECLARE qtd_participante INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_sessao
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    SELECT COUNT(*) INTO qtd_usuario
    FROM Usuario
    WHERE email = pUsuario_email;

    SELECT COUNT(*) INTO qtd_participante
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao
    AND usuario_email = pUsuario_email;

    IF qtd_sessao = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sessão não encontrada';
    ELSEIF qtd_usuario = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não encontrado';
    ELSEIF qtd_participante > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário já está na sessão';
    ELSE
        INSERT INTO Participante_sessao (
            cd_sessao,
            usuario_email
        )
        VALUES (
            pCd_sessao,
            pUsuario_email
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_participantes$$
CREATE PROCEDURE consultar_participantes(
    pCd_sessao INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sessão não encontrada';
    ELSE
        SELECT
            P.usuario_email,
            U.nome,
            U.tipo
        FROM Participante_sessao P
        INNER JOIN Usuario U
            ON P.usuario_email = U.email
        WHERE P.cd_sessao = pCd_sessao;
    END IF;
END $$


DROP PROCEDURE IF EXISTS enviar_mensagem$$
CREATE PROCEDURE enviar_mensagem(
    pParticipante_email VARCHAR(100),
    pCd_sessao INT,
    pTexto MEDIUMTEXT,
    pMidia BLOB
)
BEGIN
    DECLARE qtd_participante INT DEFAULT 0;
    DECLARE codigo INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_participante
    FROM Participante_sessao
    WHERE cd_sessao = pCd_sessao
    AND usuario_email = pParticipante_email;

    IF qtd_participante = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não participa desta sessão';
    ELSEIF pTexto IS NULL AND pMidia IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A mensagem precisa possuir texto ou mídia';
    ELSE
        SELECT IFNULL(MAX(cd_mensagem) + 1, 1)
        INTO codigo
        FROM Mensagem;

        INSERT INTO Mensagem (
            cd_mensagem,
            participante_email,
            cd_sessao,
            data,
            texto,
            midia
        )
        VALUES (
            codigo,
            pParticipante_email,
            pCd_sessao,
            NOW(),
            pTexto,
            pMidia
        );
    END IF;
END $$


DROP PROCEDURE IF EXISTS consultar_mensagens$$
CREATE PROCEDURE consultar_mensagens(
    pCd_sessao INT
)
BEGIN
    DECLARE qtd INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd
    FROM Sessao
    WHERE cd_sessao = pCd_sessao;

    IF qtd = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Sessão não encontrada';
    ELSE
        SELECT
            M.cd_mensagem,
            M.participante_email,
            U.nome AS participante,
            M.data,
            M.texto,
            M.midia
        FROM Mensagem M
        INNER JOIN Usuario U
            ON M.participante_email = U.email
        WHERE M.cd_sessao = pCd_sessao
        ORDER BY M.data;
    END IF;
END $$


DROP PROCEDURE IF EXISTS excluir_mensagem$$
CREATE PROCEDURE excluir_mensagem(
    pCd_mensagem INT,
    pCriador_email VARCHAR(100)
)
BEGIN
    DECLARE qtd_mensagem INT DEFAULT 0;
    DECLARE qtd_criador INT DEFAULT 0;

    SELECT COUNT(*) INTO qtd_mensagem
    FROM Mensagem
    WHERE cd_mensagem = pCd_mensagem;

    SELECT COUNT(*) INTO qtd_criador
    FROM Mensagem M
    INNER JOIN Sessao S
        ON M.cd_sessao = S.cd_sessao
    WHERE M.cd_mensagem = pCd_mensagem
    AND S.criador_email = pCriador_email;

    IF qtd_mensagem = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Mensagem não encontrada';
    ELSEIF qtd_criador = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário não é o criador da sessão';
    ELSE
        DELETE FROM Mensagem
        WHERE cd_mensagem = pCd_mensagem;
    END IF;
END $$


DELIMITER ;