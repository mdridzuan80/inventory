<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MUsers extends CI_Model
{
	public function __construct() {
		parent::__construct();
	}

  public function check_exists($username,$password)
  {
    $sql = "select * from dvs_users where username = ? and password = ?";
    $rst = $this->db->query($sql, array($username,$password));
    return $rst->num_rows();
  }

	public function user_info()
	{
		$sql = "select * from dvs_users where username = ?";
    $rst = $this->db->query($sql, array($this->session->userdata('username')));
    return $rst->row();
	}
}
?>
