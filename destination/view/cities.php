<!DOCTYPE html>
<html>
    <body>
        <?php
        require_once dirname(__FILE__, 3) . '/root/epiqworx/db/handler.php';
        require_once dirname(__FILE__, 2) . ('/model/datasource.php');
        
        $nation = $_GET['nation'];
        $city_name = $_GET['city'];
        $country_limit = $_GET['limit'];
        $conexion = parse_ini_file(dirname(__FILE__, 3) . "/connection.ini");
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
        //--------------------------------------------------Establish Connection
//        $con = mysqli_connect($DB_HOST,$DB_USER,$DB_PASS,$DB_NAME);
        $mysqli = new mysqli($DB_HOST,$DB_USER,$DB_PASS,$DB_NAME);
        //-------------------------------------------------------Test Connection
//        if(!$con){
//            die('could not establish connection: '.mysqli_error($con));
//        }
        if($mysqli->connect_errno){
            die("Failed to connect to MySQL: (".$mysqli->connect_errno.") ".$mysqli->connect_error);
        }
        //----------------------------------------------------prepared statement
//        $call = mysqli_prepare($con,'CALL sp_getDestinations(?,?,?,@count)');
//        mysqli_stmt_bind_param($call,'iii',0,$country_limit,"'$nation'");
//        $result = mysqli_stmt_execute($call);
//        
//        $result = $mysqli->prepare('CALL sp_getDestinations(?,?,?,@count)');
//        $result->bind_param(0,$country_limit,"'$nation'");
//        $result->execute();
        //---------------------------------------------------------Execute Query
        $sql = "CALL sp_getDestinations(0,$country_limit,'$nation')";
//        $result = mysqli_query($con,$sql);
//        
        if(!$mysqli->query("SET @count = ''") || !$result = $mysqli->query($sql)){
            die("CALL Failed: (".$mysqli->errno.") ".$mysqli->error);
        }
        ?>
        
        <ul><?php
        while ($row = mysqli_fetch_array($result)){?>
            <li>
                    <a href="?action=destionations&city_id=//<?= $row['ID'];?>&country_code=<?= $row['CountryCode'];?>" <?php if($row['Name'] === $city_name){ echo 'class="selected"';} ?>>
                        <?= $row['Name'];?>
                    </a>
                </li>
        <?php }?>
                <li><?= Country::get_cities_page_count($country_limit,"$nation");?></li>
        </ul>
        <?php 
//        mysqli_close($con);
//        $mysqli->close();
        ?>
    </body>
</html>