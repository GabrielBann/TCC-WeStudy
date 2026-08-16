<?php 
class Usuario {
	public $Email;
	public $Nome;
	public $Ranking;
	public $Desconto;

	
	public function __construct($email = null, $nome = null, $ranking = null, $desconto = null) {
		$this->Email = $email;
		$this->Nome = $nome;
		$this->Ranking = $ranking;
		$this->Desconto = $desconto;
	}
}
?>