<?php
$level=2;   //------------------------------------------------------------------webiste hierachy
require_once dirname(__FILE__,2).'/root/epiqworx/epiqrithm.php';
require_once dirname(__FILE__,2).'/root/epiqworx/db/handler.php';
//require_once('root/model/aviaco_db.php');

$action = filter_input(INPUT_POST, 'action');
if ($action == NULL) {
    $action = filter_input(INPUT_GET, 'action');
    if ($action == NULL) {
        $action = 'destionations';
    }
}
switch ($action) {
    case 'destionations':
        require_once dirname(__FILE__, 1) . ('/view/list.php');
        break;
    default :
        header("location:../?action=$action");
        break;
}