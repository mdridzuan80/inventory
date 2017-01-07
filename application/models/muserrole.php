<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class MUserRole extends MY_Model {
    public function __construct() {
        parent::__construct();
        $this->_table = "dvs_user_roles";
    }

    public function user() {
        $this->belongs_to = array("user" => array('model' => 'musers', 'primary_key' => 'user_id'));
        return $this->with("user");
    }
}
