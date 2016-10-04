<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Item extends MY_Controller {

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
		$this->load->model('mitems');
		$content['items'] = $this->mitems->get_all();
 		$data['content'] = $this->load->view('item/v_senarai',$content,TRUE);
 		$this->load->view('tpl/v_master',$data);
 	}

	public function daftar()
 	{
		if($this->input->post('btn-daftar'))
		{
			$this->load->model('mitems');
			$field['nama'] = $this->input->post('nama');
			$field['keterangan'] = $this->input->post('catatan');
			$this->mitems->insert($field);
			redirect('item');
		}
		else
		{
	 		$data['content'] = $this->load->view('item/v_daftar','',TRUE);
 			$this->load->view('tpl/v_master',$data);
		}
 	}

	public function edit($item_id)
	{
		if($this->input->post('btn-daftar'))
		{
			$this->load->model('mitems');
			$field['nama'] = $this->input->post('nama');
			$field['keterangan'] = $this->input->post('catatan');
			$this->mitems->edit($field,$item_id);
			redirect('item');
		}
		else
		{
			$this->load->model('mitems');
			$content['item'] = $this->mitems->get_info($item_id);
	 		$data['content'] = $this->load->view('item/v_edit',$content,TRUE);
 			$this->load->view('tpl/v_master',$data);
		}
	}

	public function hapus($item_id)
	{
		$this->load->model('mitems');
		$this->mitems->delete($item_id);
		redirect('item');
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
