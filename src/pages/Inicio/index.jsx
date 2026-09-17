
import Logotipo from "../../assets/Logotipo WeStudy.png";
import css from './index.module.css';

import Botao from '../../components/Botao'

document.title = 'WeStudy';

export default function Tela() {
    
    return (
        <>
            <header className={css.header}>
                <img src={Logotipo} alt="Logotipo da marca WeStudy" />
                <Botao className='outlined'>Botão</Botao>
            </header>
        </>
    );
}
