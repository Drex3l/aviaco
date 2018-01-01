<?php

abstract class Aircraft {
    public static function get_engine_service_list($hours) {
        return dbHandler::DQL("CALL sp_getEngineServiceList(:hours)", array(':hours' => $hours));
    }

    public static function get_models() {
        return dbHandler::DQL("SELECT MOD_CODE, MOD_NAME FROM model");
    }

    public static function get_model_name($model_code) {
        return dbHandler::DQL('SELECT MOD_NAME FROM model WHERE MOD_CODE = :mod_id', array(':mod_id' => $model_code))['MOD_NAME'];
    }

    public static function get_model_average($model_code) {
        return dbHandler::DQL('CALL sp_getModelAvegrage(:mod_id)', array(':mod_id' => $model_code));
    }
}

abstract class Employee {

    public static function get_med_exam($days) {
        return dbHandler::DQL('CALL sp_getPilotMedExam(:days)', array(':days' => $days));
    }

    public static function get_pilot_data($id) {
        return dbHandler::DQL('SELECT * FROM pilot_list WHERE ID = :id', array(':id' => $id));
    }

    public static function get_records() {
        return dbHandler::DQL('call sp_getMembers("P")');
    }

    public static function update_pilot_rating($items, $pilot) {
        dbHandler::Execute('CALL sp_ratePilot(:items,:pilot)',array(':items'=>$items,':pilot'=>$pilot));
    }

}

abstract class Rating {

    public static function get_records() {
        return dbHandler::DQL('SELECT * FROM rating');
    }

    public static function get_name($rating_code) {
        return dbHandler::DQL('SELECT RTG_NAME FROM rating WHERE RTG_CODE = :id', array(':id'=>$rating_code))['RTG_NAME'];
    }

    public static function get_pilots($rating) {
        return dbHandler::DQL('CALL sp_getRatingPilots(:rating)', array(':rating'=>$rating));
    }

    public static function check($empID, $rating_code) {
        return dbHandler::DQL('SELECT sf_checkRating(:emp , :rating) FIELD',array(':emp'=>$empID,':rating'=>$rating_code))['FIELD'];
    }

}
