<?php

$level = 2;   //------------------------------------------------------------------webiste hierachy
require_once dirname(__FILE__, 2) . '/root/epiqworx/epiqrithm.php';
require_once dirname(__FILE__, 2) . '/root/epiqworx/db/handler.php';
require_once('model/datasource.php');

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
        $country_limit = 10;
        $country_code = filter_input(INPUT_GET, 'country_code', FILTER_SANITIZE_STRING);
        if ($country_code == NULL || $country_code == FALSE) {
            $country_code = "ZAF";
        }
        $pages = Country::get_cities_page_count($country_limit,$country_code);
        $country_name = Country::get_name($country_code);
        $countries = Country::get_names();
        $cities = City::get_by_country($country_code,$country_limit,0);
        
        $city_id = filter_input(INPUT_GET, 'city_id', FILTER_SANITIZE_STRING);
        if ($city_id == NULL || $city_id == FALSE) {
            $city_id = "712";
        }
        $city = City::get_name($city_id);
        require_once dirname(__FILE__, 1) . ('/view/list.php');
        break;
    default :
        header("location:../?action=$action");
        break;
}