INSERT INTO Usuario (
    email,
    ranking,
    nome,
    senha,
    tipo,
    desconto
) VALUES
('carlos@email.com', 1, 'Carlos Magno', '123456', 'Aluno', 3),
('joao@email.com', 2, 'João Silva', 'abc123', 'Educador', 15),
('maria@email.com', 3, 'Maria Souza', 'senha123', 'Educador', 3),
('ana@email.com', NULL, 'Ana Oliveira', 'ana123', 'Aluno', NULL),
('pedro@email.com', NULL, 'Pedro Santos', 'pedro123', 'Aluno', NULL);


INSERT INTO Qualificacao (
    cd_diploma,
    usuario_email,
    arquivo,
    link
) VALUES
(1, 'joao@email.com', X'89504E470D0A', 'https://exemplo.com/diploma-joao'),
(2, 'joao@email.com', X'89504E470D0A', 'https://exemplo.com/certificado-joao'),
(3, 'maria@email.com', X'89504E470D0A', 'https://exemplo.com/diploma-maria');


INSERT INTO Arquivo_guia (
    cd_midia,
    arquivo
) VALUES
(1, X'255044462D312E34'),
(2, X'89504E470D0A'),
(3, X'FFD8FFE000104A464946'),
(4, X'255044462D312E34');


INSERT INTO Guia_publicado (
    cd_publicado,
    preco,
    data_criacao,
    descricao,
    tipo
) VALUES
(1, 29.90, '2026-08-01', 'Guia completo de introdução à programação.', 'Pago'),
(2, 0.00, '2026-08-05', 'Material introdutório de matemática básica.', 'Gratuito'),
(3, 19.90, '2026-08-10', 'Guia de fundamentos de banco de dados.', 'Pago');


INSERT INTO Guia (
    cd_guia,
    cd_publicacao,
    autor_email,
    disciplina,
    texto,
    topico
) VALUES
(
    1,
    1,
    'joao@email.com',
    'Programação',
    'Introdução aos conceitos fundamentais de programação, variáveis, operadores e estruturas condicionais.',
    'Fundamentos de Programação'
),
(
    2,
    2,
    'maria@email.com',
    'Matemática',
    'Conteúdo introdutório sobre operações matemáticas, frações e equações de primeiro grau.',
    'Matemática Básica'
),
(
    3,
    3,
    'joao@email.com',
    'Banco de Dados',
    'Introdução aos bancos de dados relacionais, tabelas, chaves primárias e estrangeiras.',
    'Fundamentos de Banco de Dados'
),
(
    4,
    NULL,
    'maria@email.com',
    'Inglês',
    'Conteúdo sobre estruturas básicas da língua inglesa e formação de frases.',
    'Inglês Básico'
);


INSERT INTO Guia_Arquivo (
    cd_arquivo,
    cd_guia
) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3);


INSERT INTO Pergunta_guia (
    cd_pergunta,
    cd_guia,
    enunciado,
    tipo,
    resposta_certa
) VALUES
(
    1,
    1,
    'O que é uma variável em programação?',
    'Dissertativa',
    'É um espaço de memória utilizado para armazenar um valor.'
),
(
    2,
    1,
    'Qual estrutura é utilizada para tomar decisões em um programa?',
    'Alternativa',
    'if'
),
(
    3,
    1,
    'Qual tipo de dado normalmente representa números inteiros?',
    'Alternativa',
    'int'
),
(
    4,
    2,
    'Quanto é 10 + 5?',
    'Alternativa',
    '15'
),
(
    5,
    2,
    'Resolva a equação: x + 5 = 10.',
    'Dissertativa',
    'x = 5'
),
(
    6,
    3,
    'O que é uma chave primária?',
    'Dissertativa',
    'É o atributo ou conjunto de atributos que identifica unicamente cada registro de uma tabela.'
),
(
    7,
    3,
    'Qual comando SQL é utilizado para consultar dados?',
    'Alternativa',
    'SELECT'
);


INSERT INTO Alternativa (
    cd_alternativa,
    cd_pergunta,
    resposta
) VALUES
(1, 2, 'if'),
(2, 2, 'for'),
(3, 2, 'while'),
(4, 2, 'switch'),

(5, 3, 'int'),
(6, 3, 'text'),
(7, 3, 'date'),
(8, 3, 'boolean'),

(9, 4, '10'),
(10, 4, '15'),
(11, 4, '20'),
(12, 4, '25'),

(13, 7, 'SELECT'),
(14, 7, 'INSERT'),
(15, 7, 'DELETE'),
(16, 7, 'UPDATE');


INSERT INTO Acesso_guia (
    cd_publicacao,
    usuario_email
) VALUES
(1, 'carlos@email.com'),
(1, 'ana@email.com'),
(3, 'carlos@email.com'),
(3, 'pedro@email.com'),
(2, 'carlos@email.com'),
(2, 'ana@email.com');


INSERT INTO Amizade (
    cd_amizade,
    amigo_1,
    amigo_2,
    status
) VALUES
(1, 'carlos@email.com', 'ana@email.com', 'Aceito'),
(2, 'carlos@email.com', 'pedro@email.com', 'Pendente'),
(3, 'ana@email.com', 'maria@email.com', 'Aceito'),
(4, 'joao@email.com', 'maria@email.com', 'Aceito');


INSERT INTO Caderno_publicado (
    cd_publicacao,
    data_publicacao,
    qt_acessos
) VALUES
(1, '2026-08-02', 120),
(2, '2026-08-06', 75),
(3, '2026-08-11', 250);


INSERT INTO Caderno_aluno (
    cd_caderno,
    cd_guia,
    cd_publicacao,
    texto,
    disciplina,
    topico
) VALUES
(
    1,
    1,
    1,
    '# Fundamentos de Programação

Anotações sobre variáveis, operadores e estruturas condicionais.',
    'Programação',
    'Fundamentos de Programação'
),
(
    2,
    2,
    2,
    '# Matemática Básica

Resumo sobre operações matemáticas e equações de primeiro grau.',
    'Matemática',
    'Matemática Básica'
),
(
    3,
    NULL,
    3,
    '# Anotações de Banco de Dados

Resumo pessoal sobre tabelas, chaves e relacionamentos.',
    'Banco de Dados',
    'Fundamentos de Banco de Dados'
),
(
    4,
    3,
    NULL,
    '# Banco de Dados

Anotações feitas a partir do guia de fundamentos.',
    'Banco de Dados',
    'Fundamentos de Banco de Dados'
);


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
) VALUES
(
    1,
    'carlos@email.com',
    1,
    'Variáveis e estruturas condicionais',
    'Programação',
    0,
    10,
    NULL,
    '# Anotações da sessão

Estudaremos variáveis e estruturas condicionais.'
),
(
    2,
    'ana@email.com',
    2,
    'Equações de primeiro grau',
    'Matemática',
    0,
    8,
    NULL,
    '# Matemática

Resolução de equações de primeiro grau.'
),
(
    3,
    'pedro@email.com',
    3,
    'Chaves primárias e estrangeiras',
    'Banco de Dados',
    1,
    5,
    'ABC123456',
    '# Banco de Dados

Estudo sobre chaves primárias e estrangeiras.'
);


INSERT INTO Participante_sessao (
    cd_sessao,
    usuario_email
) VALUES
(1, 'carlos@email.com'),
(1, 'ana@email.com'),
(1, 'pedro@email.com'),
(2, 'ana@email.com'),
(2, 'carlos@email.com'),
(3, 'pedro@email.com'),
(3, 'carlos@email.com');


INSERT INTO Mensagem (
    cd_mensagem,
    participante_email,
    cd_sessao,
    data,
    texto,
    midia
) VALUES
(
    1,
    'carlos@email.com',
    1,
    '2026-08-15 14:00:00',
    'Vamos começar estudando variáveis.',
    NULL
),
(
    2,
    'ana@email.com',
    1,
    '2026-08-15 14:01:00',
    'Certo! Vou acompanhar pelo guia.',
    NULL
),
(
    3,
    'pedro@email.com',
    1,
    '2026-08-15 14:03:00',
    'Podemos fazer alguns exercícios depois?',
    NULL
),
(
    4,
    'ana@email.com',
    2,
    '2026-08-15 15:00:00',
    'Vamos resolver a primeira equação.',
    NULL
),
(
    5,
    'carlos@email.com',
    2,
    '2026-08-15 15:02:00',
    'A resposta deve ser x = 5.',
    NULL
),
(
    6,
    'pedro@email.com',
    3,
    '2026-08-15 16:00:00',
    'Vamos revisar a diferença entre chave primária e estrangeira.',
    NULL
),
(
    7,
    'carlos@email.com',
    3,
    '2026-08-15 16:02:00',
    'A chave primária identifica unicamente cada registro.',
    NULL
);