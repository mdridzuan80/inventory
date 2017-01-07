<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * @file
 *
 * Configuration for ACL permissions
 *
 */
/**
 * Each controller or action can have its own permission array
 *
 * I've created some simple sample permissions based on the Drupal scheme
 *
 * Each controller or action can have add, edit own, edit all,
 * delete own and delete all - then add roles against the permissions
 */
$config['permission'] = array(
	'stock' => array(
		'add' => array('admin','user'),
		'edit own' => array('admin','user'),
		'edit all' => array('admin','user'),
		'delete own' => array('admin','user'),
		'delete all' => array('admin', 'user'),
	)
);
/**
 * You can have as many roles as you like, each user or object can have multiple roles.
 */
$config['roles'] = array('admin', 'user');
/* End of applications/config/acl.php */
