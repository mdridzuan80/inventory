<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MTrans extends CI_Model
{
	public function __construct() {
		parent::__construct();
	}

  public function get_all()
  {
    $sql = "select * from dvs_dict_transaction";
    $rst = $this->db->query($sql);
    return $rst;
  }
}
?>
