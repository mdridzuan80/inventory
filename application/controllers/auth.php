<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth extends CI_Controller
{
  public function __construct()
  {
    parent::__construct();
  }

  public function index()
	{
    if($this->input->post('btn-login'))
    {
      $this->load->model('musers');
      if($this->musers->check_exists($this->input->post('username'),$this->input->post('password')))
      {
        $this->session->set_userdata('logged', TRUE);
        $this->session->set_userdata('username', $this->input->post('username'));
        $user_info = $this->musers->user_info();
        $this->session->set_userdata('dept_id', $user_info->dept_id);
        
        redirect('');
      }
      else
      {
        $data['error'] = "Kombinasi id pengguna dan katalaluan tidak tepat";
        $this->load->view('auth/v_login', $data);
      }
    }
    else
    {
      $this->load->view('auth/v_login');
    }
	}

  public function logout()
  {
    $this->session->sess_destroy();
    redirect('');
  }
}
