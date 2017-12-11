<?php
abstract class Country{
    public static function get_names(){
        return dbHandler::DQL('select Code, Name from world.country');
    }
    public static function get_country_name($code){
        $sql = 'SELECT Name FROM world.country WHERE Code = :country_code';
        $params = array(':country_code' => $code);
        return dbHandler::DQL($sql, $params)['Name'];
    }
}
abstract class City{
    public static function get_country_cities($country,$limit,$offset){
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