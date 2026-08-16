<?php class Banco
 {
 	private static $conexao = null;
 	private static $cSQL = null;
	private static function Conectar()
 	{
  		if (self::$conexao !== null) {
			return;
		}
 		try {
 			self::$conexao = new PDO('mysql:dbname=westudy;host=localhost; charset=utf8mb4', 'root', 'root', [PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"]);
 			self::$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		} catch (PDOException $Erro) {
			throw new Exception('Erro ao conectar ao Servidor. Tente novamente.');
		}
	}

	protected static function Consultar($nomeProcedure, $parametros = [])
	{
		try {
			self::Conectar();

			$listaNomesParametros = [];
			foreach ($parametros as $chave => $valor) {
				$listaNomesParametros[] = ':' . $chave;
			}

			$comando = 'CALL ' . $nomeProcedure;
			if (count($listaNomesParametros) > 0) {
				$comando .= '(' . implode(', ', $listaNomesParametros) . ')';
			}

			self::$cSQL = self::$conexao->prepare($comando);

			foreach ($parametros as $chave => $valor) {
				self::$cSQL->bindValue(':' . $chave, $valor);
			}

			self::$cSQL->execute();
			$dados = self::$cSQL->fetchAll(PDO::FETCH_ASSOC);
			return $dados;
		} catch (PDOException $e) {
			throw $e;
		}
	}

	protected static function Executar($nomeProcedure, $parametros = [])
	{
		try {
			self::Conectar();

			$listaNomesParametros = [];
			foreach ($parametros as $chave => $valor) {
				$listaNomesParametros[] = ':' . $chave;
			}

			$comando = 'CALL ' . $nomeProcedure;
			if (count($listaNomesParametros) > 0) {
				$comando .= '(' . implode(', ', $listaNomesParametros) . ')';
			}

			self::$cSQL = self::$conexao->prepare($comando);

			foreach ($parametros as $chave => $valor) {
				self::$cSQL->bindValue(':' . $chave, $valor);
			}

			self::$cSQL->execute();
		} catch (PDOException $e) {
			throw $e;
		}
	}
}
?>