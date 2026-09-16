import connection from '../database/connection.js'

async function BuscarSessoes(statusPrivacidade) {
    try {
        if (statusPrivacidade === 'publico' || statusPrivacidade === "") {
            statusPrivacidade = 0;
            const [rows] = await connection.query('CALL consultar_sessoes_abertas(?)', [statusPrivacidade]);
            return rows;
        }
        else if (statusPrivacidade === 'privado') {
            statusPrivacidade = 1;
            const [rows] = await connection.query('CALL consultar_sessoes_abertas(?)', [statusPrivacidade]);
            return rows;
        }
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
} 
async function BuscarCadernos(email) {
    try {
        const [rows] = await connection.query('CALL consultar_cadernos_usuario(?)',[email]);

        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
} 
async function BuscarGuias(email) {
    try {
        const [rows] = await connection.query('CALL consultar_guias_usuario(?)',[email])

        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
}

async function BuscarCadernosPublicos() {
    try {
        const [rows] = await connection.query('CALL consultar_cadernos_publicados()');
        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
}

async function BuscarGuiasPublicos() {
    try {
        const [rows] = await connection.query('CALL consultar_guias_publicados()');
        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
}

async function CadastrarSessao(
    email,
    cd_guia,
    topico,
    disciplina,
    privado,
    qt_pessoas_limite,
    codigo_entrada,
    texto_caderno
) {
    try {
        const [result] = await connection.query(
            'CALL cadastrar_sessao(?,?,?,?,?,?,?,?)',
            [
                email,
                cd_guia,
                topico,
                disciplina,
                privado,
                qt_pessoas_limite,
                codigo_entrada,
                texto_caderno
            ]
        )

        return result
    } catch (error) {
        console.log(error)
        return {"mensagem": error.sqlMessage};
    }
}


async function CadastrarCaderno(
    email,
    cd_guia,
    texto,
    disciplina,
    topico
) {
    try {
        const [result] = await connection.query(
            'CALL cadastrar_caderno(?,?,?,?,?)',
            [
                email,
                cd_guia,
                texto,
                disciplina,
                topico
            ]
        )

        return result
    } catch (error) {
        console.log(error)
        return {"mensagem": error.sqlMessage};
    }
}

async function EditarCaderno(
    email,
    cd_caderno,
    texto,
    disciplina,
    topico
) {
    try {
        const [result] = await connection.query(
            'CALL atualizar_caderno(?,?,?,?,?)',
            [
                email,
                cd_caderno,
                texto,
                disciplina,
                topico
            ]
        )
        return result
    } catch (error) {
        console.log(error)
        return {"mensagem": error.sqlMessage};
    }
}

async function ExcluirCaderno(
    email,
    cd_caderno
) {
    try {
        const [result] = await connection.query(
            'CALL excluir_caderno(?,?)',
            [
                email,
                cd_caderno
            ]
        )
        return result
    } catch (error) {
        console.log(error)
        return {"mensagem": error.sqlMessage};
    }
}

async function PublicarCaderno(
    email,
    cd_caderno
) {
    try {
        const [result] = await connection.query(
            'CALL publicar_caderno(?,?)',
            [
                email,
                cd_caderno
            ]
        )
        return result
    } catch (error) {
        console.log(error)
        return {"mensagem": error.sqlMessage};
    }
}

export default {
    BuscarSessoes,
    BuscarCadernosPublicos,
    BuscarGuiasPublicos,
    BuscarCadernos,
    BuscarGuias,
    CadastrarSessao,
    CadastrarCaderno,
    EditarCaderno,
    ExcluirCaderno,
    PublicarCaderno
}
