import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

// export default function Inicio(){
//     const navigate = useNavigate();

//     function Login(){
//         navigate('/login')
//     }
//     function Cadastrar(){
//         navigate('/cadastrar')
//     }
//     return(
//         <section>
//             <button onClick={Login}>Login</button>
//             <button onClick={Cadastrar}>Cadastrar</button>
//         </section>
//     )
// }

import "./Inicio.css";

export default function LandingPage() {
    return (
        <div className="landing-page">

            <header className="navbar">
                <a href="/" className="logo">
                    <img src="/assets/logo.png" alt="WeStudy" />
                </a>

                <nav className="nav-links">
                    <a href="#guias">Guias</a>
                    <a href="#sessoes">Sessões de Estudo</a>
                    <a href="/cadastro" className="btn-cadastro">Cadastro</a>
                    <a href="/login" className="btn-login">↪ Login</a>
                </nav>

                <button className="menu-button">☰</button>
            </header>

            <section className="hero">
                <div className="hero-content">

                    <div className="hero-text">
                        <h5>WeStudy é uma plataforma que conecta estudantes e educadores. <br/><br/>
Aqui você forma grupos de estudos baseados em tópicos específicos e interagem em uma sala bate-papo com funcionalidades que te ajudam a manter o foco.</h5>


                        <h4>Junte-se a nós!</h4>

                        <div className="hero-buttons">
                            <a href="/cadastro" className="btn-secondary">
                                <p>Criar a sua conta</p>
                            </a>

                            <a href="/login" className="btn-secondary">
                                <p>Entrar na sua conta</p>
                            </a>
                        </div>
                    </div>

                    <div className="hero-image-container">
                        <img
                            src="https://images.unsplash.com/photo-1531482615713-2afd69097998?auto=format&fit=crop&w=800&q=80"
                            alt="Estudantes estudando"
                        />
                    </div>

                </div>
            </section>

            <section className="features-title">
                <h2>Conheça nossas funcionalidades!</h2>
            </section>

            <section className="feature notebook-section">

                <div className="feature-description">
                    <h1>Caderno</h1>

                    <h5>
                        Estudantes usam cadernos de anotações para
                        guardar seus pensamentos e os ensinamentos
                        de Guias.
                    </h5>
                </div>

                <div className="notebook">

                    <div className="notebook-toolbar">
                        <p>▣ Salvar Caderno</p>

                        <div className="toolbar-buttons">
                            <button>√x</button>
                            <button>N</button>
                            <button>I</button>
                            <button>◆</button>
                            <button>●</button>
                        </div>
                    </div>

                    <div className="notebook-content">
                        <p>
                            <strong>Matemática</strong> é uma área do
                            conhecimento que inclui os tópicos dos números,
                            fórmulas e estruturas relacionadas, formas e os
                            espaços em que estão contidos, e quantidades e
                            suas mudanças.
                        </p>
                    </div>

                </div>

            </section>

            <section className="guides-section" id="guias">

                <div className="section-header">
                    <h1>Guias</h1>

                    <h5>
                        Guias são o conjunto de anotações, imagens, vídeos,
                        arquivos e até questionários feitos por educadores
                    </h5>

                    <p>
                        Guias podem ser pagos ou gratuitos
                    </p>
                </div>

                <div className="guides-grid">
                    <GuideCard />
                    <GuideCard />
                    <GuideCard />
                    <GuideCard />
                    <GuideCard />
                    <GuideCard />
                </div>

                <p className="educator-info">
                    Um Educador é um usuário que tem a capacidade de criar e
                    publicar Guias na plataforma. Para mostrar a outros a
                    capacidade do educador, existem provas de suas
                    qualificações, como certificados e diplomas, no perfil
                    público do mesmo.
                </p>

            </section>

            <section className="session-section" id="sessoes">

                <div className="session-header">
                    <h1>Sessão</h1>

                    <h5>
                        Estudantes e Educadores podem começar Sessões
                        de Estudo juntos
                    </h5>
                </div>

                <div className="session-content">

                    <div className="session-column">

                        <p className="column-description">
                            Os membros da sessão interagem usando um
                            bate-papo de texto integrado
                        </p>

                        <div className="chat-box">

                            <div className="chat-messages">

                                <div className="message">
                                    <p>Magnum se conectou!</p>
                                </div>

                                <div className="message own">
                                    <p>Você se conectou!</p>
                                </div>

                                <div className="message-bubble">
                                    <p>Opa tudo bem galera?</p>
                                </div>

                                <p className="message-time">
                                    12:39
                                </p>

                                <div className="message-bubble own-bubble">
                                    <p>Suave, bora estudar</p>
                                </div>

                                <p className="message-time own-time">
                                    12:39
                                </p>

                            </div>

                            <div className="chat-input">
                                <input
                                    type="text"
                                    placeholder="Digite..."
                                />

                                <button>➤</button>
                            </div>

                        </div>

                    </div>

                    <div className="session-column">

                        <p className="column-description">
                            Juntamente com um Caderno compartilhado e um Guia
                            importado por qualquer um da sessão.
                        </p>

                        <div className="import-box">

                            <h5>Importe um Guia salvo</h5>

                            <div className="search-box">
                                <input
                                    type="text"
                                    placeholder="Busque por tópicos ou autores."
                                />

                                <button>⌕</button>
                            </div>

                            <MiniGuideCard />
                            <MiniGuideCard />
                            <MiniGuideCard />

                        </div>

                    </div>

                    <div className="session-column">

                        <p className="column-description">
                            As funções do Guia podem ser usados por todos
                            da sessão, como por exemplo: responder um quiz.
                        </p>

                        <div className="quiz-box">

                            <h5>Respondendo Quiz</h5>

                            <div className="question">
                                <p>
                                    <strong>
                                        1. Qual é a fórmula de Bhaskara?
                                    </strong>
                                </p>

                                <div className="answer-area"></div>
                            </div>

                            <div className="question">
                                <p>
                                    <strong>
                                        2. Quantos valores o x pode assumir
                                        em uma função do 2º grau?
                                    </strong>
                                </p>

                                <div className="answer-area"></div>
                            </div>

                            <div className="question">

                                <p>
                                    <strong>
                                        3. Qual é a fórmula de delta?
                                    </strong>
                                </p>

                                <label>
                                    <input type="radio" name="delta" />
                                    A) b² - a.c
                                </label>

                                <label>
                                    <input type="radio" name="delta" />
                                    B) b + a + c
                                </label>

                                <label>
                                    <input type="radio" name="delta" />
                                    C) b² - a.c
                                </label>

                                <label>
                                    <input type="radio" name="delta" />
                                    D) -b + a.c.4
                                </label>

                            </div>

                            <button className="finish-quiz">
                                <p>Finalizar Quiz</p>
                            </button>

                        </div>

                    </div>

                </div>

            </section>

             <section className="final-cta">
                <p>
                    Estudar é difícil, e muitos não se adaptam às Instituições
                    regradas. Então, relembre as partes boas: as amizades, os
                    bons professores, e estude junto daqueles que te ajudam.
                    Sem distrações, sempre que precisar.
                </p>
 
                <h3>WeStudy</h3>
 
                <div className="hero-buttons">
                    <a href="/cadastro" className="btn-primary">
                        <p>Criar a sua conta</p>
                    </a>
 
                    <a href="/login" className="btn-secondary">
                        <p>Entrar na sua conta</p>
                    </a>
                </div>
            </section>
 
            <footer className="footer">
                <a href="/" className="footer-logo">
                    <img src="/assets/logo.png" alt="WeStudy" />
                </a>
 
                <div className="footer-links">
                    <div className="footer-column">
                        <a href="#">Instagram</a>
                        <a href="#">Facebook</a>
                        <a href="#">Youtube</a>
                    </div>
 
                    <div className="footer-column">
                        <a href="#">Política de privacidade</a>
                        <a href="#">LGPD</a>
                    </div>
 
                    <div className="footer-column">
                        <a href="#">Landing Page</a>
                    </div>
 
                    <div className="footer-column">
                        <a href="#">Whatsapp</a>
                    </div>
                </div>
            </footer>

        </div>
    );
}

function GuideCard() {
    return (
        <div className="guide-card">

            <div className="guide-top">
                <p>Aline</p>
                <p>Criado em 27/07/2026</p>
            </div>

            <p className="guide-price">
                R$5,00
            </p>

            <h4>
                Fórmulas Aritméticas
            </h4>

            <div className="guide-rating">
                <p>
                    3,5 ★★★★☆
                </p>

                <p className="rating-count">
                    10+ Avaliações
                </p>
            </div>

            <button>
                <p>Ver mais</p>
            </button>

        </div>
    );
}

function MiniGuideCard() {
    return (
        <div className="mini-guide">

            <div className="mini-guide-top">
                <p>Aline</p>
                <p>Criado em 27/07/2026</p>
            </div>

            <h4>
                Fórmulas Aritméticas
            </h4>

            <button>
                <p>Importar</p>
            </button>

        </div>
    );
}