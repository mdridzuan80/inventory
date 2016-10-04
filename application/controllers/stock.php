<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class stock extends MY_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
 	{
		$this->load->model('mjournal');
		$content['stocks'] = $this->mjournal->get_stocks();
 		$data['content'] = $this->load->view('stock/v_stock',$content,TRUE);
 		$this->load->view('tpl/v_master',$data);
 	}

	public function daftar()
	{
		if($this->input->post('btn-daftar'))
		{
			if($this->input->post('transaksi_id') != 3)
			{
				$field['item_id'] = $this->input->post('item_id');
				$field['dept_id'] = $this->input->post('dept_id');
				$field['batch'] = $this->input->post('batch');
				$field['transaction_id'] = $this->input->post('transaksi_id');
				$field['total'] = $this->input->post('total');
				$field['tarikh'] = date('Y-m-d H:m:s');
				$field['catatan'] = $this->input->post('catatan');
				$this->load->model('mjournal');
				$this->mjournal->insert($field);
			}
			else
			{
				$date_transfer = date('Y-m-d H:m:s');
				$from = $this->session->userdata('dept_id');
				$to = $this->input->post('dept_id');
				$this->load->model('mjournal');
				$src['item_id'] = $this->input->post('item_id');
				$src['dept_id'] = $this->session->userdata('dept_id');
				$src['batch'] = $this->input->post('batch');
				$src['transaction_id'] = 2;
				$src['total'] = $this->input->post('total');
				$src['tarikh'] = $date_transfer;
				$src['catatan'] = $this->input->post('catatan');
				$src['fromto'] = $to;
				$this->mjournal->insert($src);

				$dst['item_id'] = $this->input->post('item_id');
				$dst['dept_id'] = $this->input->post('dept_id');
				$dst['batch'] = $this->input->post('batch');
				$dst['transaction_id'] = 1;
				$dst['total'] = $this->input->post('total');
				$dst['tarikh'] = $date_transfer;
				$dst['catatan'] = $this->input->post('catatan');
				$dst['fromto'] = $from;
				$this->mjournal->insert($dst);
			}
			redirect('stock');
		}
		else
		{
			$this->load->model('mitems');
			$this->load->model('mtrans');
			$this->load->model('mdepts');
			$content['items'] = $this->mitems->get_all();
			$content['trans'] = $this->mtrans->get_all();
			$content['depts'] = $this->mdepts->get_all();
			$data['content'] = $this->load->view('stock/v_daftar',$content,TRUE);
	 		$this->load->view('tpl/v_master',$data);
		}
	}

	public function transaksi($item_id)
	{
		$this->load->model('mjournal');
		$this->load->model('mitems');
		$content['trans'] = $this->mjournal->get_trans($item_id);
		$content['item'] = $this->mitems->get_info($item_id);
 		$data['content'] = $this->load->view('stock/v_transaksi',$content,TRUE);
 		$this->load->view('tpl/v_master',$data);
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
