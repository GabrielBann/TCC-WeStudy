
import Logotipo from "../../assets/Logotipo WeStudy.png";
import './index.module.css';

document.title = 'WeStudy'

export default function Tela() {
    
    return (
        <>
            <header>
                <img src={Logotipo} alt="Logotipo da marca WeStudy" />
            </header>
        </>
    );
}
