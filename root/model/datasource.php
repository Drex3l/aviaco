<?php

abstract class Aircraft {
    public static function get_engine_service_list($hours) {
        $sql = "CALL sp_getEngineServiceList(:hours)";
        $params = array(':hours' => $hours);
        return dbHandler::DQL($sql, $params);
    }

    public static function get_models() {
        return dbHandler::DQL("SELECT MOD_CODE, MOD_NAME FROM model");
    }

    public static function get_model_name($model_code) {
        $sql = 'SELECT MOD_NAME FROM model WHERE MOD_CODE = :mod_id';
        $params = array(':mod_id' => $model_code);
        return dbHandler::DQL($sql, $params)['MOD_NAME'];
    }

    public static function get_model_average($model_code) {
        $sql = 'CALL sp_getModelAvegrage(:mod_id)';
        $params = array(':mod_id' => $model_code);
        return dbHandler::DQL($sql, $params);
    }
}

abstract class Employee {

    public static function get_med_exam($days) {
        $sql = 'CALL sp_getPilotMedExam(:days)';
        $params = array(':days' => $days);
        return dbHandler::DQL($sql, $params);
    }

    public static function get_pilot_data($id) {
        $sql = 'SELECT * FROM pilot_list WHERE ID = :id';
        $params = array(':id' => $id);
        return dbHandler::DQL($sql, $params);
    }

    public static function get_records() {
        return dbHandler::DQL('SELECT * FROM pilot_meddate_list');
    }

    public static function update_pilot_rating($items, $pilot) {
        $sql = 'CALL sp_ratePilot(:items,:pilot)';
        $params = array(':items'=>$items,':pilot'=>$pilot);
        dbHandler::Execute($sql,$params);
    }

}

abstract class Rating {

    public static function get_records() {
        return dbHandler::DQL('SELECT * FROM rating');
    }

    public static function get_name($rating_code) {
        $sql = 'SELECT RTG_NAME FROM rating WHERE RTG_CODE = :id';
        $params = array(':id'=>$rating_code);
        return dbHandler::DQL($sql, $params)['RTG_NAME'];
    }

    public static function get_pilots($rating) {
        $sql = 'CALL sp_getRatingPilots(:rating)';
        $params = array(':rating'=>$rating);
        return dbHandler::DQL($sql, $params);
    }

    public static function check($empID, $rating_code) {
        $sql = 'SELECT sf_checkRating(:emp , :rating) FIELD';
        $params = array(':emp'=>$empID,':rating'=>$rating_code);
        return dbHandler::DQL($sql,$params)['FIELD'];
    }

}
