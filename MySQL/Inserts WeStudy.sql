USE WeStudy;

INSERT INTO Materia (cd_materia, nm_materia) VALUES
(1, 'Matemática'),
(2, 'História'),
(3, 'Português'),
(4, 'Física'),
(5, 'Química'),
(6, 'Biologia'),
(7, 'Geografia'),
(8, 'Inglês'),
(9, 'Programação'),
(10, 'Banco de Dados'),
(11, 'Filosofia'),
(12, 'Sociologia');


INSERT INTO Usuario (email, ranking, nome, senha, tipo, desconto) VALUES
('carlos@email.com', 1500, 'Carlos Magno', '123456', 'Aluno', 10),
('ana@email.com', 1800, 'Ana Souza', '123456', 'Aluno', 5),
('joao@email.com', 1200, 'João Silva', '123456', 'Aluno', 0),
('lucas@email.com', 1350, 'Lucas Oliveira', '123456', 'Aluno', 10),
('beatriz@email.com', 1650, 'Beatriz Santos', '123456', 'Aluno', 15),
('gabriel@email.com', 1100, 'Gabriel Costa', '123456', 'Aluno', 0),
('fernanda@email.com', 1950, 'Fernanda Lima', '123456', 'Aluno', 5),
('rafael@email.com', 1450, 'Rafael Almeida', '123456', 'Aluno', 10),
('mariana@email.com', 2200, 'Mariana Oliveira', '123456', 'Educador', 15),
('pedro@email.com', 2000, 'Pedro Santos', '123456', 'Educador', 10),
('juliana@email.com', 2350, 'Juliana Martins', '123456', 'Educador', 20),
('ricardo@email.com', 1900, 'Ricardo Ferreira', '123456', 'Educador', 5),
('camila@email.com', 2100, 'Camila Rocha', '123456', 'Educador', 10),
('thiago@email.com', 1750, 'Thiago Mendes', '123456', 'Educador', 0);


INSERT INTO Qualificacao
(cd_diploma, usuario_email, arquivo, link) VALUES

(1, 'mariana@email.com', NULL, 'https://exemplo.com/mariana/matematica'),
(2, 'mariana@email.com', NULL, 'https://exemplo.com/mariana/fisica'),

(1, 'pedro@email.com', NULL, 'https://exemplo.com/pedro/programacao'),
(2, 'pedro@email.com', NULL, 'https://exemplo.com/pedro/banco-dados'),

(1, 'juliana@email.com', NULL, 'https://exemplo.com/juliana/historia'),
(2, 'juliana@email.com', NULL, 'https://exemplo.com/juliana/geografia'),

(1, 'ricardo@email.com', NULL, 'https://exemplo.com/ricardo/quimica'),

(1, 'camila@email.com', NULL, 'https://exemplo.com/camila/portugues'),
(2, 'camila@email.com', NULL, 'https://exemplo.com/camila/filosofia'),

(1, 'thiago@email.com', NULL, 'https://exemplo.com/thiago/biologia');


INSERT INTO Arquivo_guia
(cd_midia, arquivo) VALUES
(1, 'Arquivo matematica'),
(2, 'Arquivo historia'),
(3, 'Arquivo portugues'),
(4, 'Arquivo fisica'),
(5, 'Arquivo quimica'),
(6, 'Arquivo biologia'),
(7, 'Arquivo geografia'),
(8, 'Arquivo ingles'),
(9, 'Arquivo javascript'),
(10, 'Arquivo banco de dados'),
(11, 'Arquivo filosofia'),
(12, 'Arquivo sociologia');


INSERT INTO Guia_publicado
(cd_publicado, preco, data_criacao, descricao, tipo) VALUES
(1, 0.00, '2026-08-01', 'Introdução à função de segundo grau', 'Gratuito'),
(2, 19.90, '2026-08-02', 'História do Brasil para vestibulares', 'Pago'),
(3, 29.90, '2026-08-03', 'JavaScript para iniciantes', 'Pago'),
(4, 0.00, '2026-08-04', 'Introdução à Física', 'Gratuito'),
(5, 24.90, '2026-08-05', 'Química orgânica', 'Pago'),
(6, 15.90, '2026-08-06', 'Biologia celular', 'Pago'),
(7, 0.00, '2026-08-07', 'Geografia do Brasil', 'Gratuito'),
(8, 12.90, '2026-08-08', 'Inglês para iniciantes', 'Pago'),
(9, 34.90, '2026-08-09', 'Banco de dados com MySQL', 'Pago'),
(10, 0.00, '2026-08-10', 'Introdução à Filosofia', 'Gratuito'),
(11, 18.90, '2026-08-11', 'Sociologia para vestibulares', 'Pago'),
(12, 22.90, '2026-08-12', 'Equações e funções', 'Pago'),
(13, 0.00, '2026-08-13', 'Gramática básica', 'Gratuito'),
(14, 27.90, '2026-08-14', 'Física mecânica', 'Pago'),
(15, 39.90, '2026-08-15', 'Programação com Node.js', 'Pago');


INSERT INTO Guia
(cd_guia, cd_publicacao, autor_email, disciplina, texto, topico) VALUES
(1, 1, 'mariana@email.com', 'Matemática', 'Conteúdo sobre funções de segundo grau, raízes, vértice e representação gráfica.', 'Função de segundo grau'),
(2, 2, 'juliana@email.com', 'História', 'Conteúdo sobre os principais acontecimentos da História do Brasil.', 'História do Brasil'),
(3, 3, 'pedro@email.com', 'Programação', 'Conteúdo introdutório sobre JavaScript, variáveis, funções e estruturas de controle.', 'JavaScript'),
(4, 4, 'mariana@email.com', 'Física', 'Introdução aos conceitos de velocidade, aceleração e movimento.', 'Cinemática'),
(5, 5, 'ricardo@email.com', 'Química', 'Introdução à química orgânica e suas principais funções.', 'Química orgânica'),
(6, 6, 'thiago@email.com', 'Biologia', 'Resumo sobre células, organelas e funções celulares.', 'Biologia celular'),
(7, 7, 'juliana@email.com', 'Geografia', 'Estudo sobre regiões brasileiras, relevo e clima.', 'Geografia do Brasil'),
(8, 8, 'camila@email.com', 'Inglês', 'Vocabulário e estruturas básicas para conversação em inglês.', 'Inglês básico'),
(9, 9, 'pedro@email.com', 'Banco de Dados', 'Introdução a bancos relacionais, tabelas, chaves e comandos SQL.', 'MySQL'),
(10, 10, 'camila@email.com', 'Filosofia', 'Introdução aos principais filósofos e conceitos filosóficos.', 'Filosofia'),
(11, 11, 'juliana@email.com', 'Sociologia', 'Introdução aos conceitos fundamentais da sociologia.', 'Sociologia'),
(12, 12, 'mariana@email.com', 'Matemática', 'Estudo sobre equações, funções e resolução de problemas matemáticos.', 'Equações'),
(13, 13, 'camila@email.com', 'Português', 'Estudo das principais regras gramaticais da língua portuguesa.', 'Gramática'),
(14, 14, 'mariana@email.com', 'Física', 'Estudo das leis de Newton e conceitos fundamentais da mecânica.', 'Mecânica'),
(15, 15, 'pedro@email.com', 'Programação', 'Introdução ao desenvolvimento de APIs utilizando Node.js e Express.', 'Node.js');


INSERT INTO Guia_Arquivo
(cd_arquivo, cd_guia) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15);


INSERT INTO Pergunta_guia
(cd_pergunta, cd_guia, enunciado, tipo, resposta_certa) VALUES

(1, 1, 'Qual fórmula é utilizada para encontrar as raízes de uma equação do segundo grau?', 'Alternativa', 'Fórmula de Bhaskara'),
(2, 1, 'O que representa o vértice de uma parábola?', 'Dissertativa', 'Representa o ponto de máximo ou mínimo da parábola'),

(1, 2, 'Em que ano ocorreu a Independência do Brasil?', 'Alternativa', '1822'),
(2, 2, 'Quem proclamou a Independência do Brasil?', 'Alternativa', 'Dom Pedro I'),

(1, 3, 'O que é uma variável?', 'Dissertativa', 'Um espaço utilizado para armazenar um valor'),
(2, 3, 'Qual palavra-chave pode declarar uma constante em JavaScript?', 'Alternativa', 'const'),

(1, 4, 'Qual grandeza representa a variação da velocidade no tempo?', 'Alternativa', 'Aceleração'),
(2, 4, 'O que é velocidade média?', 'Dissertativa', 'A razão entre o deslocamento e o intervalo de tempo'),

(1, 5, 'Qual elemento possui símbolo C?', 'Alternativa', 'Carbono'),

(1, 6, 'Qual organela é responsável pela produção de energia celular?', 'Alternativa', 'Mitocôndria'),

(1, 7, 'Quantas regiões possui o Brasil?', 'Alternativa', '5'),

(1, 8, 'Qual é a tradução de hello?', 'Alternativa', 'Olá'),

(1, 9, 'Qual comando SQL é usado para consultar dados?', 'Alternativa', 'SELECT'),

(1, 10, 'Quem escreveu A República?', 'Alternativa', 'Platão'),

(1, 11, 'Qual é o objeto de estudo da sociologia?', 'Dissertativa', 'A sociedade e as relações sociais'),

(1, 12, 'Resolva a equação x + 5 = 10.', 'Dissertativa', '5'),

(1, 13, 'Qual é a classe gramatical da palavra rapidamente?', 'Alternativa', 'Advérbio'),

(1, 14, 'Qual lei de Newton trata da ação e reação?', 'Alternativa', 'Terceira Lei de Newton'),

(1, 15, 'Qual biblioteca é utilizada para criar servidores HTTP em Node.js?', 'Alternativa', 'Express'),
(2, 15, 'O que é uma API?', 'Dissertativa', 'Uma interface que permite a comunicação entre sistemas');


INSERT INTO Alternativa
(cd_alternativa, cd_pergunta, cd_guia, resposta) VALUES

(1, 1, 1, 'Fórmula de Bhaskara'),
(2, 1, 1, 'Teorema de Pitágoras'),
(3, 1, 1, 'Regra de Três'),
(4, 1, 1, 'Fórmula de Newton'),

(1, 1, 2, '1500'),
(2, 1, 2, '1800'),
(3, 1, 2, '1822'),
(4, 1, 2, '1889'),

(1, 2, 2, 'Dom Pedro I'),
(2, 2, 2, 'Tiradentes'),
(3, 2, 2, 'Getúlio Vargas'),
(4, 2, 2, 'Dom João VI'),

(1, 2, 3, 'var'),
(2, 2, 3, 'let'),
(3, 2, 3, 'const'),
(4, 2, 3, 'function'),

(1, 1, 4, 'Velocidade'),
(2, 1, 4, 'Aceleração'),
(3, 1, 4, 'Distância'),
(4, 1, 4, 'Tempo'),

(1, 1, 5, 'Oxigênio'),
(2, 1, 5, 'Carbono'),
(3, 1, 5, 'Hidrogênio'),
(4, 1, 5, 'Nitrogênio'),

(1, 1, 6, 'Ribossomo'),
(2, 1, 6, 'Mitocôndria'),
(3, 1, 6, 'Lisossomo'),
(4, 1, 6, 'Núcleo'),

(1, 1, 7, '3'),
(2, 1, 7, '4'),
(3, 1, 7, '5'),
(4, 1, 7, '6'),

(1, 1, 8, 'Tchau'),
(2, 1, 8, 'Obrigado'),
(3, 1, 8, 'Olá'),
(4, 1, 8, 'Por favor'),

(1, 1, 9, 'INSERT'),
(2, 1, 9, 'UPDATE'),
(3, 1, 9, 'SELECT'),
(4, 1, 9, 'DELETE'),

(1, 1, 10, 'Aristóteles'),
(2, 1, 10, 'Platão'),
(3, 1, 10, 'Sócrates'),
(4, 1, 10, 'Descartes'),

(1, 1, 13, 'Substantivo'),
(2, 1, 13, 'Adjetivo'),
(3, 1, 13, 'Advérbio'),
(4, 1, 13, 'Verbo'),

(1, 1, 14, 'Primeira Lei de Newton'),
(2, 1, 14, 'Segunda Lei de Newton'),
(3, 1, 14, 'Terceira Lei de Newton'),
(4, 1, 14, 'Lei da Gravitação'),

(1, 1, 15, 'React'),
(2, 1, 15, 'Express'),
(3, 1, 15, 'Angular'),
(4, 1, 15, 'Vue');


INSERT INTO Acesso_guia
(cd_publicacao, usuario_email) VALUES

(1, 'carlos@email.com'),
(1, 'ana@email.com'),
(1, 'joao@email.com'),
(1, 'lucas@email.com'),

(2, 'carlos@email.com'),
(2, 'joao@email.com'),
(2, 'beatriz@email.com'),

(3, 'ana@email.com'),
(3, 'gabriel@email.com'),
(3, 'fernanda@email.com'),

(4, 'carlos@email.com'),
(4, 'rafael@email.com'),

(5, 'ana@email.com'),
(5, 'beatriz@email.com'),

(6, 'lucas@email.com'),
(6, 'gabriel@email.com'),

(7, 'carlos@email.com'),
(7, 'fernanda@email.com'),

(8, 'ana@email.com'),
(8, 'rafael@email.com'),

(9, 'carlos@email.com'),
(9, 'ana@email.com'),
(9, 'joao@email.com'),

(10, 'beatriz@email.com'),
(10, 'lucas@email.com'),

(11, 'fernanda@email.com'),
(11, 'rafael@email.com'),

(12, 'carlos@email.com'),
(12, 'ana@email.com'),

(13, 'joao@email.com'),
(13, 'beatriz@email.com'),

(14, 'lucas@email.com'),
(14, 'gabriel@email.com'),

(15, 'carlos@email.com'),
(15, 'fernanda@email.com');


INSERT INTO Amizade
(cd_amizade, amigo_1, amigo_2, status) VALUES
(1, 'carlos@email.com', 'ana@email.com', 'Aceito'),
(2, 'carlos@email.com', 'joao@email.com', 'Pendente'),
(3, 'carlos@email.com', 'lucas@email.com', 'Aceito'),
(4, 'ana@email.com', 'joao@email.com', 'Aceito'),
(5, 'ana@email.com', 'beatriz@email.com', 'Aceito'),
(6, 'joao@email.com', 'gabriel@email.com', 'Pendente'),
(7, 'lucas@email.com', 'rafael@email.com', 'Aceito'),
(8, 'beatriz@email.com', 'fernanda@email.com', 'Aceito'),
(9, 'gabriel@email.com', 'carlos@email.com', 'Pendente'),
(10, 'rafael@email.com', 'ana@email.com', 'Aceito'),
(11, 'carlos@email.com', 'fernanda@email.com', 'Aceito'),
(12, 'lucas@email.com', 'beatriz@email.com', 'Pendente'),
(13, 'joao@email.com', 'rafael@email.com', 'Aceito'),
(14, 'gabriel@email.com', 'lucas@email.com', 'Aceito'),
(15, 'fernanda@email.com', 'ana@email.com', 'Pendente');


INSERT INTO Caderno_aluno
(cd_caderno, usuario_email, cd_guia, cd_publicacao, texto, disciplina, topico) VALUES

(1, 'carlos@email.com', 1, 1, 'Anotações sobre função de segundo grau, raízes e vértice.', 'Matemática', 'Função de segundo grau'),
(2, 'carlos@email.com', NULL, NULL, 'Anotações pessoais sobre Revolução Industrial.', 'História', 'Revolução Industrial'),
(3, 'carlos@email.com', 9, 2, 'Anotações sobre comandos SELECT e INSERT.', 'Banco de Dados', 'MySQL'),
(4, 'carlos@email.com', NULL, NULL, 'Anotações sobre interpretação de texto.', 'Português', 'Interpretação'),

(1, 'ana@email.com', 3, 1, 'Anotações sobre variáveis e funções em JavaScript.', 'Programação', 'JavaScript'),
(2, 'ana@email.com', 10, 2, 'Anotações sobre Platão e Sócrates.', 'Filosofia', 'Filosofia'),
(3, 'ana@email.com', NULL, NULL, 'Resumo sobre genética.', 'Biologia', 'Genética'),

(1, 'joao@email.com', 2, 1, 'Resumo sobre História do Brasil.', 'História', 'História do Brasil'),
(2, 'joao@email.com', 11, 2, 'Resumo sobre conceitos de sociologia.', 'Sociologia', 'Sociologia'),
(3, 'joao@email.com', NULL, NULL, 'Anotações sobre ligações químicas.', 'Química', 'Ligações químicas'),

(1, 'lucas@email.com', 4, 1, 'Resumo sobre velocidade média e aceleração.', 'Física', 'Cinemática'),
(2, 'lucas@email.com', 12, 2, 'Exercícios sobre equações.', 'Matemática', 'Equações'),

(1, 'beatriz@email.com', 5, 1, 'Resumo sobre funções orgânicas.', 'Química', 'Química orgânica'),
(2, 'beatriz@email.com', 13, 2, 'Resumo de classes gramaticais.', 'Português', 'Gramática'),

(1, 'gabriel@email.com', 6, 1, 'Resumo sobre células e organelas.', 'Biologia', 'Biologia celular'),
(2, 'gabriel@email.com', 14, 2, 'Resumo das leis de Newton.', 'Física', 'Mecânica'),

(1, 'fernanda@email.com', 7, 1, 'Anotações sobre regiões do Brasil.', 'Geografia', 'Geografia do Brasil'),
(2, 'fernanda@email.com', 15, 2, 'Anotações sobre criação de APIs com Node.js.', 'Programação', 'Node.js'),

(1, 'rafael@email.com', 8, 1, 'Vocabulário básico em inglês.', 'Inglês', 'Inglês básico'),
(2, 'rafael@email.com', NULL, NULL, 'Anotações pessoais sobre geometria.', 'Matemática', 'Geometria');

INSERT INTO Caderno_publicado
(cd_publicacao, cd_caderno, usuario_email, data_publicacao, qt_acessos) VALUES

(1, 1, 'carlos@email.com', '2026-08-10', 15),
(2, 3, 'carlos@email.com', '2026-08-18', 42),

(1, 1, 'ana@email.com', '2026-08-12', 8),
(2, 2, 'ana@email.com', '2026-08-19', 11),

(1, 1, 'joao@email.com', '2026-08-11', 23),
(2, 2, 'joao@email.com', '2026-08-20', 19),

(1, 1, 'lucas@email.com', '2026-08-13', 31),
(2, 2, 'lucas@email.com', '2026-08-21', 35),

(1, 1, 'beatriz@email.com', '2026-08-14', 12),
(2, 2, 'beatriz@email.com', '2026-08-22', 9),

(1, 1, 'gabriel@email.com', '2026-08-15', 18),
(2, 2, 'gabriel@email.com', '2026-08-23', 27),

(1, 1, 'fernanda@email.com', '2026-08-16', 7),
(2, 2, 'fernanda@email.com', '2026-08-24', 16),

(1, 1, 'rafael@email.com', '2026-08-17', 25);

INSERT INTO Sessao
(cd_sessao, criador_email, cd_guia, topico, disciplina, privado, qt_pessoas_limite, codigo_entrada, texto_caderno) VALUES
(1, 'carlos@email.com', 1, 'Função de segundo grau', 'Matemática', 0, 5, NULL, 'Vamos estudar função de segundo grau.'),
(2, 'ana@email.com', NULL, 'Revolução Francesa', 'História', 0, 4, NULL, 'Estudo sobre a Revolução Francesa.'),
(3, 'joao@email.com', 3, 'Variáveis em JavaScript', 'Programação', 1, 3, 'GHI789123', 'Sessão privada sobre JavaScript.'),
(4, 'lucas@email.com', 4, 'Cinemática', 'Física', 0, 6, NULL, 'Estudo de velocidade e aceleração.'),
(5, 'beatriz@email.com', 5, 'Química orgânica', 'Química', 0, 5, NULL, 'Sessão sobre química orgânica.'),
(6, 'gabriel@email.com', 6, 'Biologia celular', 'Biologia', 1, 4, 'PQR789123', 'Sessão privada de biologia.'),
(7, 'fernanda@email.com', 7, 'Geografia do Brasil', 'Geografia', 0, 8, NULL, 'Estudo das regiões brasileiras.'),
(8, 'rafael@email.com', 8, 'Inglês básico', 'Inglês', 0, 5, NULL, 'Prática de inglês para iniciantes.'),
(9, 'carlos@email.com', 9, 'Banco de Dados', 'Banco de Dados', 0, 6, NULL, 'Estudo de SQL e banco de dados.'),
(10, 'ana@email.com', 10, 'Filosofia', 'Filosofia', 1, 3, 'BCD123456', 'Discussão sobre filosofia antiga.'),
(11, 'joao@email.com', 11, 'Sociologia', 'Sociologia', 0, 5, NULL, 'Estudo de sociologia.'),
(12, 'lucas@email.com', 12, 'Equações', 'Matemática', 0, 6, NULL, 'Resolução de exercícios de equação.'),
(13, 'beatriz@email.com', 13, 'Gramática', 'Português', 0, 5, NULL, 'Estudo de gramática.'),
(14, 'gabriel@email.com', 14, 'Leis de Newton', 'Física', 1, 4, 'NOP456789', 'Sessão privada de mecânica.'),
(15, 'fernanda@email.com', 15, 'Node.js', 'Programação', 0, 7, NULL, 'Estudo de desenvolvimento backend.');


INSERT INTO Participante_sessao
(cd_sessao, usuario_email) VALUES
(1, 'carlos@email.com'),
(1, 'ana@email.com'),
(1, 'lucas@email.com'),

(2, 'ana@email.com'),
(2, 'joao@email.com'),
(2, 'beatriz@email.com'),

(3, 'joao@email.com'),
(3, 'carlos@email.com'),

(4, 'lucas@email.com'),
(4, 'rafael@email.com'),
(4, 'carlos@email.com'),

(5, 'beatriz@email.com'),
(5, 'ana@email.com'),

(6, 'gabriel@email.com'),
(6, 'joao@email.com'),

(7, 'fernanda@email.com'),
(7, 'rafael@email.com'),
(7, 'ana@email.com'),

(8, 'rafael@email.com'),
(8, 'carlos@email.com'),
(8, 'beatriz@email.com'),

(9, 'carlos@email.com'),
(9, 'ana@email.com'),
(9, 'joao@email.com'),

(10, 'ana@email.com'),
(10, 'beatriz@email.com'),

(11, 'joao@email.com'),
(11, 'lucas@email.com'),
(11, 'gabriel@email.com'),

(12, 'lucas@email.com'),
(12, 'carlos@email.com'),
(12, 'rafael@email.com'),

(13, 'beatriz@email.com'),
(13, 'fernanda@email.com'),

(14, 'gabriel@email.com'),
(14, 'joao@email.com'),

(15, 'fernanda@email.com'),
(15, 'carlos@email.com'),
(15, 'ana@email.com');


INSERT INTO Mensagem
(cd_mensagem, participante_email, cd_sessao, data, texto, midia) VALUES

(1, 'carlos@email.com', 1, '2026-09-15 14:00:00', 'Alguém consegue explicar como encontrar as raízes?', NULL),
(2, 'ana@email.com', 1, '2026-09-15 14:02:00', 'Claro! Primeiro identificamos os valores de a, b e c.', NULL),
(3, 'lucas@email.com', 1, '2026-09-15 14:05:00', 'Depois aplicamos a fórmula de Bhaskara.', NULL),

(1, 'ana@email.com', 2, '2026-09-15 15:00:00', 'Vamos começar pelas causas da Revolução Francesa.', NULL),
(2, 'joao@email.com', 2, '2026-09-15 15:03:00', 'Podemos começar pela crise econômica?', NULL),
(3, 'beatriz@email.com', 2, '2026-09-15 15:05:00', 'Sim, a crise teve grande importância.', NULL),

(1, 'joao@email.com', 3, '2026-09-15 16:00:00', 'Qual a diferença entre let e const?', NULL),
(2, 'carlos@email.com', 3, '2026-09-15 16:02:00', 'Const não permite reatribuição.', NULL),

(1, 'lucas@email.com', 4, '2026-09-15 16:10:00', 'Como calculamos a velocidade média?', NULL),
(2, 'rafael@email.com', 4, '2026-09-15 16:12:00', 'Dividimos o deslocamento pelo tempo.', NULL),
(3, 'carlos@email.com', 4, '2026-09-15 16:15:00', 'Entendi, obrigado!', NULL),

(1, 'beatriz@email.com', 5, '2026-09-15 16:20:00', 'Vamos revisar as funções orgânicas.', NULL),
(2, 'ana@email.com', 5, '2026-09-15 16:22:00', 'Começamos pelos hidrocarbonetos.', NULL),

(1, 'gabriel@email.com', 6, '2026-09-15 16:30:00', 'Qual a função da mitocôndria?', NULL),
(2, 'joao@email.com', 6, '2026-09-15 16:32:00', 'Ela participa da produção de energia.', NULL),

(1, 'fernanda@email.com', 7, '2026-09-15 16:40:00', 'Vamos revisar as regiões do Brasil.', NULL),
(2, 'rafael@email.com', 7, '2026-09-15 16:42:00', 'A região Norte é a maior em extensão territorial.', NULL),
(3, 'ana@email.com', 7, '2026-09-15 16:44:00', 'E possui grande parte da Amazônia.', NULL),

(1, 'rafael@email.com', 8, '2026-09-15 16:50:00', 'How are you?', NULL),
(2, 'carlos@email.com', 8, '2026-09-15 16:52:00', 'I am fine, thank you!', NULL),
(3, 'beatriz@email.com', 8, '2026-09-15 16:54:00', 'I am studying English.', NULL),

(1, 'carlos@email.com', 9, '2026-09-15 17:00:00', 'Qual comando usamos para consultar dados?', NULL),
(2, 'ana@email.com', 9, '2026-09-15 17:02:00', 'Usamos SELECT.', NULL),
(3, 'joao@email.com', 9, '2026-09-15 17:04:00', 'E para inserir dados usamos INSERT.', NULL),

(1, 'ana@email.com', 10, '2026-09-15 17:10:00', 'Vamos falar sobre Platão.', NULL),
(2, 'beatriz@email.com', 10, '2026-09-15 17:12:00', 'Podemos começar pela obra A República.', NULL),

(1, 'joao@email.com', 11, '2026-09-15 17:20:00', 'O que é sociologia?', NULL),
(2, 'lucas@email.com', 11, '2026-09-15 17:22:00', 'É o estudo da sociedade e das relações sociais.', NULL),
(3, 'gabriel@email.com', 11, '2026-09-15 17:24:00', 'Agora ficou mais claro.', NULL),

(1, 'lucas@email.com', 12, '2026-09-15 17:30:00', 'Alguém pode ajudar nessa equação?', NULL),
(2, 'carlos@email.com', 12, '2026-09-15 17:32:00', 'Manda a questão.', NULL),
(3, 'rafael@email.com', 12, '2026-09-15 17:34:00', 'Eu também posso tentar resolver.', NULL),

(1, 'beatriz@email.com', 13, '2026-09-15 17:40:00', 'Vamos revisar classes gramaticais.', NULL),
(2, 'fernanda@email.com', 13, '2026-09-15 17:42:00', 'Começamos por substantivo e adjetivo.', NULL),

(1, 'gabriel@email.com', 14, '2026-09-15 17:50:00', 'Qual é a terceira lei de Newton?', NULL),
(2, 'joao@email.com', 14, '2026-09-15 17:52:00', 'Ação e reação.', NULL),

(1, 'fernanda@email.com', 15, '2026-09-15 18:00:00', 'Vamos criar uma API com Express.', NULL),
(2, 'carlos@email.com', 15, '2026-09-15 18:02:00', 'Podemos começar criando as rotas.', NULL),
(3, 'ana@email.com', 15, '2026-09-15 18:04:00', 'Depois conectamos ao controller.', NULL);