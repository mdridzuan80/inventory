<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class App_Auth {
    private $CI;

    public function __construct() {
        $this->CI =& get_instance();
    }

    public function authenticating() {
        $this->CI->load->model("musers", "muser");
    }

    public function check_exist_user($username) {
        $this->CI->load->model("musers", "muser");
        return $this->CI->muser->count_by("username",$username);
    }

    public function check_valid_login($username, $password) {
        $this->CI->load->model("musers", "muser");
        if($this->CI->muser->where("username",$username)->where("password",$password)->count()) {
            $this->CI->session->set_userdata('isLogged', TRUE);
            $this->CI->session->set_userdata('username', $username);
            return TRUE;
        }
        return FALSE;
    }

    public function isLogged() {
        return $this->CI->session->userdata("isLogged");
    }

    public function getName() {
        return $this->CI->session->userdata("username");
    }

    public function getRole() {
        $this->CI->load->model("muserrole", "muserrole");
        return array($this->CI->muserrole->user()->where('user_id',$this->getName())->get()->role);
    }
}
