import connection from '../database/connection.js'

async function BuscarSessoes(statusPrivacidade) {
    try {
        if (statusPrivacidade === 'publico') {
            statusPrivacidade = 0;
            const [rows] = await connection.query('CALL consultar_sessoes_abertas(?)', [statusPrivacidade]);
        }
        else if (statusPrivacidade === 'privado') {
            statusPrivacidade = 1;
            const [rows] = await connection.query('CALL consultar_sessoes_abertas(?)', [statusPrivacidade]);
        }
        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
} 
async function BuscarCadernos() {
    try {
        const [rows] = await connection.query('CALL consultar_cadernos_usuario(?)',[email]);

        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
} 
async function BuscarGuias() {
    try {
        const [rows] = await connection.query('CALL consultar_guias_usuario(?)',[email])

        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
}

export default {
    BuscarSessoes,
    BuscarCadernos,
    BuscarGuias
}