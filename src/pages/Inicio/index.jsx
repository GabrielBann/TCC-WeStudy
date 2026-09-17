
import Logotipo from "../../assets/Logotipo WeStudy.svg";
import ImageHero from "../../assets/hero_image.png";
import css from './index.module.css';

import Botao from '../../components/Botao'

document.title = 'WeStudy';

export default function Tela() {
    
    return (
        <>
            <header className={css.header}>
                <img src={Logotipo} alt="Logotipo da marca WeStudy" />
                <nav>
                    <a href="#">Caderno</a>
                    <a href="#">Guias</a>
                    <a href="#">Sessões</a>
                    <Botao className={'outlined'}>
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M16 12H4M12 8L16 12L12 16M15 4H17C17.7956 4 18.5587 4.31607 19.1213 4.87868C19.6839 5.44129 20 6.20435 20 7V17C20 17.7956 19.6839 18.5587 19.1213 19.1213C18.5587 19.6839 17.7956 20 17 20H15" stroke="#040316" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/></svg>
                        Login
                    </Botao>
                    <Botao>
                        Cadastro
                    </Botao>
                </nav>
            </header>

            <article className={css.hero_article}>
                <section>
                    <h5>
                        WeStudy é uma plataforma que conecta estudantes e educadores.
                    </h5>
                    <h5>
                        Aqui você forma grupos de estudos baseados em tópicos específicos e interagem em uma sala bate-papo com funcionalidades que te ajudam a manter o foco.
                    </h5>
                    <div className={css.wrapper_cta}>
                        <h4>Junte-se a nós!</h4>
                        <div>
                            <Botao>Criar sua conta</Botao>
                            <Botao>Entrar na sua conta</Botao>
                        </div>
                    </div>
                </section>
                <img src={ImageHero} alt="Uma mulher e um homem segurando laptops" />
            </article>
        </>
    );
}
