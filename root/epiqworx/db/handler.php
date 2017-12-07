<?php
require_once dirname(__FILE__,2).'/report/Log.php';

// Class providing generic data access functionality for PDO methods
abstract class dbHandler {

    // hold an instance of the PDO class
    private static $conn;

    private static function GetConnection() {
        // retrieve connection string information
        $conexion = parse_ini_file(dirname(__FILE__, 4) . "/connection.ini");
        if ($_SERVER['HTTP_HOST'] == 'sict-iis.nmmu.ac.za') {
            $DB_HOST = 'sict-mysql';
        } else {
            $DB_HOST = $_SERVER['HTTP_HOST'];
        }

        if (!empty($conexion['host'])) {
            $DB_HOST = $conexion['host'];
        }

        $DB_USER = $conexion['user'];
        $DB_PASS = $conexion['password'];
        $DB_NAME = $conexion['dbname'];

        // create database connection only if one does not already exists
        if (!isset(self::$conn)) {
            try {
                self::$conn = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME", $DB_USER, $DB_PASS);
            } catch (PDOException $ex) {
                self::db_error($ex->getMessage());
            }
        }
        return self::$conn;
    }

    // method to cose database conection
    public static function Close() {
        self::$conn = null;
    }

    /*  Execute()
     *  Metod to when perfoming DML
     *  This method is a wrapper for the PDOStatement::execute() method
     */

    public static function Execute($sql, $params = null) {
        try {
            $pdo_conn = self::GetConnection();  //------------------------------ get connection
            $statement = $pdo_conn->prepare($sql);  //-------------------------- prepare query for execution
            $statement->execute($params);   //---------------------------------- execute query
        } catch (PDOException $ex) {
            self::db_error($ex->getMessage());
        }
    }

    /* The DQL() method is a wrapper for for the PDOStatement::fetchall() + PDOStatement::fetch()
     * This method will be used querying the database
     */

    public static function DQL($sql, $params = null, $fetchStyle = PDO::FETCH_ASSOC) {
        try {
            $pdo_conn = self::GetConnection();  //------------------------------ get connection
            $statement = $pdo_conn->prepare($sql);  //-------------------------- prepare query for execution
            $statement->execute($params);   //---------------------------------- execute query
            if ($statement->rowCount() === 1) {
                $query = $statement->fetch($fetchStyle);
            } else {
                $query = $statement->fetchAll($fetchStyle);
            }
        } catch (PDOException $ex) {
            self::db_error($ex->getMessage());
        }
        return $query;
    }

    private static function db_error($msg) {
        self::Close();
        $contents = ob_get_contents();
        ob_clean();
        $error_message = $msg;
        $error = Debug::ExceptionLog($msg);
        require_once dirname(__FILE__, 3) . '/view/error/db.php';
        echo '<script> document.title = "Connection Error"; </script>';
        exit();
    }

}
