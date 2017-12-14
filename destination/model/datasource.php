<?php
abstract class Country{
    public static function get_names(){
        return dbHandler::DQL('select Code, Name from world.country ORDER BY Name');
    }
    public static function get_name($code){
        $sql = 'SELECT Name FROM world.country WHERE Code = :country_code';
        $params = array(':country_code' => $code);
        return dbHandler::DQL($sql, $params)['Name'];
    }
    public static function get_cities_page_count($block,$country){
        $sql = 'SELECT sf_cities_page_count(:block,:nation) count';
        $params = array(':block'=>$block,':nation'=>$country);
        return dbHandler::DQL($sql,$params)['count'];
    }
}
abstract class City{
    public static function get_by_country($country,$limit,$offset){
        $sql = 'CALL sp_getDestinations(:offset,:limit,:country_code)';
        $params = array(':offset'=>$offset,':limit'=>$limit,':country_code' => $country);
        return dbHandler::DQL($sql, $params);
    }
    public static function get_name($id){
        $sql = 'SELECT Name, District FROM world.city WHERE ID = :city_id';
        $params = array(':city_id' => $id);
        return dbHandler::DQL($sql, $params);
    }
}