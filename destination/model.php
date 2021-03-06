<?php

abstract class Charter {

    public static function get_records($airport) {
        return dbHandler::DQL('CALL sp_getCharters(:airport)', array(':airport'=>$airport));
    }
    public static function add_record($plane,$city,$date,$distance,$fuel,$oil,$flyhours,$waitHours,$pilot,$copilot,$customer){
        $param = array(':plane'=>$plane,':city'=>$city,':date'=>$date,':distance'=>$distance,':fuel'=>$fuel,':oil'=>$oil,':flyHours'=>$flyhours,':waitHours'=>$waitHours,':pilot'=>$pilot,':copilot'=>$copilot,':customer'=>$customer);
        dbHandler::Execute('call sp_addCharter(:plane,:city,:date,:distance,:fuel,:oil,:flyHours,:waitHours,:pilot,:copilot,:customer)',$param);
    }
    public static function delete_record($id){
        dbHandler::Execute('DELETE FROM charter WHERE CHAR_TRIP = :id', array(':id'=>$id));
    }
    public static function update_record($plane,$city,$date,$distance,$fuel,$oil,$flyhours,$waitHours,$pilot,$copilot,$customer,$id){
        $param = array(':plane'=>$plane,':city'=>$city,':date'=>$date,':distance'=>$distance,':fuel'=>$fuel,':oil'=>$oil,':flyHours'=>$flyhours,':waitHours'=>$waitHours,':pilot'=>$pilot,':copilot'=>$copilot,':customer'=>$customer,':id'=>$id);
        dbHandler::Execute('call sp_updateCharter(:plane,:city,:date,:distance,:fuel,:oil,:flyHours,:waitHours,:pilot,:copilot,:customer,:id)',$param);
    }

    public static function get_charter($id){
        return dbHandler::DQL('SELECT c.*,l.PILOT, l.COPILOT FROM charter c, charter_list l WHERE ID = CHAR_TRIP && CHAR_TRIP = :id', array(':id'=>$id));
    }
    public static function count_by_city($id){
        return dbHandler::DQL(' SELECT COUNT(CHAR_TRIP) RECORDS FROM charter WHERE AIRPORT_CODE = :id', array(':id'=>$id))['RECORDS'];
    }
}

abstract class Country{
    public static function get_names(){
        return dbHandler::DQL('select Code, Name from world.country ORDER BY Name');
    }
    public static function get_name($code){
        return dbHandler::DQL('SELECT Name FROM world.country WHERE Code = :country_code', array(':country_code' => $code))['Name'];
    }
    public static function get_cities_page_count($block,$country){
        return dbHandler::DQL('SELECT sf_cities_page_count(:block,:nation) count',array(':block'=>$block,':nation'=>$country))['count'];
    }
}
abstract class City{
    public static function get_by_country($country, $limit = NULL, $offset = NULL){
        if(!isset($limit)){
            return dbHandler::DQL('SELECT ID, Name FROM world.city WHERE CountryCode = :nation ORDER BY Name', array(':nation' => $country));
        }
        return dbHandler::DQL('CALL sp_getDestinations(:offset,:limit,:country_code)', array(':offset'=>$offset,':limit'=>$limit,':country_code' => $country));
    }
    public static function get_name($id){
        return dbHandler::DQL('SELECT Name, District FROM world.city WHERE ID = :city_id', array(':city_id' => $id));
    }
}
abstract class Aircraft {
    public static function check_aircraft($ac_no){
        return dbHandler::DQL('CALL sp_checkAircraft(:ac)', array(':ac'=>$ac_no));
    }
    public static function get_aircraft_no(){
        return  dbHandler::DQL('SELECT AC_NUMBER FROM aircraft');
    }
}
abstract class Pilot {
    public static function get_pilot_info($id){
        return dbHandler::DQL('CALL sp_getPilotInfo(:emp)', array(':emp' => $id));
    }
    public static function get_pilot_name($id){
        return dbHandler::DQL("SELECT CONCAT(EMP_FNAME,' ',EMP_LNAME) PILOT FROM employee WHERE EMP_NUM = :id", array(':id'=>$id))['PILOT'];
    }

    public static function get_pilots(){
        return dbHandler::DQL('call sp_getMembers("P")');
    }
}
abstract class Customer{
    public static function get_customers(){
        return dbHandler::DQL('call sp_getMembers("C")');
    }
}