<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MItems extends CI_Model
{
	public function __construct() {
		parent::__construct();
	}

  public function get_all()
  {
    $sql = "select * from dvs_items";
    $rst = $this->db->query($sql);
    return $rst;
  }

	public function get_info($item_id)
	{
		$sql = "SELECT * FROM dvs_items
					WHERE 1=1
					AND id = ?";
    $rst = $this->db->query($sql,array($item_id));
    return $rst->row();
	}

	public function insert($data)
	{
		return $this->db->insert('dvs_items', $data);
	}

	public function edit($data,$item_id)
	{
		return $this->db->update('dvs_items', $data, "id = " . $item_id);
	}

	public function delete($item_id)
	{
		return $this->db->delete('dvs_items', array('id' => $item_id));
	}
}
?>
