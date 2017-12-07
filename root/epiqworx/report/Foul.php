<?php

/**
 * EpiqWorx by EpiQuadruple
 * Licensed under the Epiquadruple General And Distribution License
 * Which You Can Find On https://epiquadruple.org
 */

namespace epiqworx\report;

/**
 * Description of FoulPlay
 * Calls And Displays Error Messages
 */
abstract class Foul {
    public static function error404($error_message = '') {
        require_once dirname(__FILE__, 3) . '/view/error/error.php';
    }
    public static function error500($error_message = '') {
    	require_once dirname(__FILE__, 3) . '/view/error/error.php';
    }
    public static function customError($error_message = '') {
    	require_once dirname(__FILE__, 3) . '/view/errors/error.php';
    }
}
