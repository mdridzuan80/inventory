<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MJournal extends CI_Model
{
	public function __construct() {
		parent::__construct();
	}

  public function insert($data)
  {
    return $this->db->insert('dvs_journal', $data);
  }

	public function get_stocks()
	{
		$sql = "SELECT dvs_items.id, dvs_items.nama, Sum(view_stock.total) as total
						FROM view_stock INNER JOIN dvs_items ON dvs_items.id = view_stock.item_id
						WHERE 1=1
						AND view_stock.dept_id = ?
						GROUP BY dvs_items.id, dvs_items.nama";
		$rst = $this->db->query($sql,array($this->session->userdata('dept_id')));
		return $rst;
	}

	public function get_trans($item_id)
	{
		$sql = "SELECT * FROM view_transaksi
						WHERE 1=1
						AND item_id = ?
						AND dept_id = ?
						ORDER BY tarikh DESC";
		$rst = $this->db->query($sql,array($item_id,$this->session->userdata('dept_id')));
		return $rst;
	}
}
?>
