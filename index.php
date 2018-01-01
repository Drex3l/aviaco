<?php

require_once('root/epiqworx/epiqrithm.php');
require_once('root/epiqworx/db/handler.php');
require_once('root/model.php');

$action = filter_input(INPUT_POST, 'action');
if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {
        $action = 'model_avg';
    }
}
switch ($action) {
    case 'model_avg':
        $title = "Consumption";
        $model_code = filter_input(INPUT_GET, 'model_code', FILTER_SANITIZE_STRING);
        if ($model_code == NULL || $model_code == FALSE) {
            $model_code = "C-90A";
        }
        $model_name = Aircraft::get_model_name($model_code);
        $models = Aircraft::get_models();
        $AVG = Aircraft::get_model_average($model_code);
        require_once dirname(__FILE__, 1) . ('/root/view/content/model_avg.php');
        break;
    case 'engine_service':
        $title = 'Service';
        $hours = filter_input(INPUT_POST, 'hours');
        if ($hours == NULL || $hours == FALSE) {
            $hours = "20";
        }
        $aircrafts = Aircraft::get_engine_service_list($hours);
        require_once dirname(__FILE__, 1) . ('/root/view/content/engine_service.php');
        break;
    case 'med_exam':
        $title = 'Exam';
        $days = filter_input(INPUT_POST, 'days');
        if ($days == NULL || $days == FALSE) {
            $days = "30";
        }
        $pilots = Employee::get_med_exam($days);
        require_once dirname(__FILE__, 1) . ('/root/view/content/med_exam.php');
        break;
    case 'rating_pilots':
        $title = 'Rating';
        $rating_code = filter_input(INPUT_GET, 'rating_code', FILTER_SANITIZE_STRING);
        if ($rating_code == NULL || $rating_code == FALSE) {
            $rating_code = "CFI";
        }
        $rating_name = Rating::get_name($rating_code);
        $ratings = Rating::get_records();
        $pilot_rating = Rating::get_pilots($rating_code);
        require_once dirname(__FILE__, 1) . ('/root/view/content/rating_pilots.php');
        break;
    case 'update_pilot_rating':
        $title = 'Pilot';
        $emp_num = filter_input(INPUT_GET, 'emp_num', FILTER_SANITIZE_STRING);
        if ($emp_num == NULL || $emp_num == FALSE) {
            $emp_num = "101";
        }
        $employee = Employee::get_records();
        $ratings = Rating::get_records();
        $pilot_data = Employee::get_pilot_data($emp_num);
        require_once dirname(__FILE__, 1) . ('/root/view/content/update_pilot_rating.php');
        break;
    case 'rate_list':
        $featureList = "";
        $empID = $_POST['pilot'];

        if (!empty($_POST['rating'])) {
            $selectedAccessory = $_POST['rating'];
            foreach ($selectedAccessory as $item) {
                $item = trim($item);
                $featureList .= "$item/";
            }
        }
        Employee::update_pilot_rating($featureList, $empID);
        header("location: ?action=update_pilot_rating&emp_num=$empID");
        break;
    case 'destionations':
        header('location: destination');
        break;
    case 'print':
        Debug::testPrint($_GET['txt']);
        echo 'OK!';
//        echo date('Y-m-d');
        break;
    case 'browser':
        print_r(WebTools::getBrowser());
//        echo WebTools::getBrowser()['name'];
        //echo $_SERVER['HTTP_USER_AGENT'];
        break;
    default :
        echo "case not handled for action '<strong>$action</strong>'";
        break;
}
