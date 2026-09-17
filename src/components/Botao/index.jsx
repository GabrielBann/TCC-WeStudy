import css from './index.module.css';

export default function Botao(props) {

    return (
        <>
        <button className={`${props.className} ${css.button}`}>{props.children}</button>
        </>
    )
}