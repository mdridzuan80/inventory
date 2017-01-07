<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Auth extends CI_Controller
{
    public function __construct() {
        parent::__construct();
    }

    public function index() {
        if($this->input->post('btn-login')) {
          if( $this->app_auth->check_valid_login($this->input->post('username'),$this->input->post('password')) ) {
            redirect('');
          } else {
            $data['error'] = "Kombinasi id pengguna dan katalaluan tidak tepat";
            $this->load->view('auth/v_login', $data);
          }
        } else {
          $this->load->view('auth/v_login');
        }
    }

  public function logout() {
    $this->session->sess_destroy();
    redirect('');
  }
}
