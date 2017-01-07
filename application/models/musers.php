<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MUsers extends MY_Model {
	public function __construct() {
		parent::__construct();
		$this->_table = "dvs_users";
		$this->primary_key = "username";
	}
}
?>
