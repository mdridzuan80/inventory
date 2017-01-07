<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! function_exists('dd'))
{
	function dd($var)
	{
        die(var_dump($var));
	}
}
