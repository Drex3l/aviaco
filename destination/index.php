<?php

$level = 2;   //----------------------------------------------------------------physical hierachy
require_once dirname(__FILE__, $level) . '/root/epiqworx/epiqrithm.php';
require_once dirname(__FILE__, $level) . '/root/epiqworx/db/handler.php';
require_once('model.php');

$action = filter_input(INPUT_POST, 'action');
if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {
        $action = 'destionations';
    }
}
switch ($action) {
    case 'destionations':
        $title = 'Destinations';
        //---------------------------------------------------country information
        $country_limit = 10;
        $country_code = filter_input(INPUT_GET, 'country_code', FILTER_SANITIZE_STRING);
        if ($country_code == NULL || $country_code == FALSE) {
            $country_code = "ZAF";
        }
        $page = intval(filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING));
        if ($page == NULL || $page == FALSE) {
            $page = 1;
        }
        $pages = Country::get_cities_page_count($country_limit,$country_code);
        $country_name = Country::get_name($country_code);
        $countries = Country::get_names();
        $cities = City::get_by_country($country_code,$country_limit,$page-1);
        //------------------------------------------------------city information
        $city_id = intval(filter_input(INPUT_GET, 'city_id', FILTER_SANITIZE_STRING));
        if ($city_id == NULL || $city_id == FALSE) {
            $city_id = "712";
        }
        $city = City::get_name($city_id);
        $destinations = Charter::get_records($city_id);
        require_once dirname(__FILE__, 1) . ('/view/list.php');
        break;
    case 'new_charter':
        $title = 'New Charter';
         $page = intval(filter_input(INPUT_GET, 'page', FILTER_SANITIZE_STRING));
        if ($page == NULL || $page == FALSE) {
            $page = 1;
        }
        $aircraft = Aircraft::get_aircraft_no();
        //---------------------------------------------------country information
        $country_code = filter_input(INPUT_GET, 'country_code', FILTER_SANITIZE_STRING);
        if ($country_code == NULL || $country_code == FALSE) {
            $country_code = "ZAF";
        }
        $country_name = Country::get_name($country_code);
        //------------------------------------------------------city information
        $city_id = intval(filter_input(INPUT_GET, 'city_id', FILTER_SANITIZE_STRING));
        if ($city_id == NULL || $city_id == FALSE) {
            $city_id = "712";
        }
        $cities = City::get_by_country($country_code);
        //---------------------------------------------------------------Members
        $pilots = Pilot::get_pilots();
        $customers = Customer::get_customers();
        require_once dirname(__FILE__, 1) . ('/view/charter_add.php');
        break;
    case 'add_charter':
        echo 'added';
        break;
    case 'view_aircraft':
        $title = 'Service Schedule';
        $ac_no = filter_input(INPUT_GET, 'ac_no', FILTER_SANITIZE_STRING);
        $aircraft = Aircraft::check_aircraft($ac_no);
        require_once dirname(__FILE__, 1) . ('/view/aircraft_info.php');
        break;
    case 'view_pilot':
        $title = 'Pilot Info';
        $emp_no = filter_input(INPUT_GET, 'emp_no', FILTER_SANITIZE_STRING);
        $pilot = Pilot::get_pilot_info($emp_no);
        require_once dirname(__FILE__, 1) . ('/view/pilot_info.php');
        break;
    default :
        header("location:../?action=$action");
        break;
}