<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
?>
<!DOCTYPE html>
<html>

<!-- the head section -->
<head>
    <title>PRT2110 TEST ASSIGNMENT</title>
    <link rel="stylesheet" type="text/css"   href="<?= PATH;?>/root/usr/css/main.css" />
</head>

<!-- the body section -->
<body><?php if(empty($error_message)){?>
    <header>
    <h1>AviaCo</h1>
    <p>the Air for the People</p><br/>
    <ul id="navigation">
        <li <?php if($action === 'model_avg'){ echo 'id="active-page"'; }?> ><a href="?action=model_avg">comsumption</a><li>
    <li <?php if($action === 'engine_service'){echo 'id="active-page"'; }?>><a href="?action=engine_service">engine service</a><li>
    <li <?php if($action === 'med_exam'){echo 'id="active-page"'; }?>><a href="?action=med_exam">med exam</a><li>
     <li <?php if($action === 'rating_pilots'){echo 'id="active-page"';  }?>><a href="?action=rating_pilots">Pilot Rating</a><li>
     <li <?php if($action === 'update_pil_rating'){echo 'id="active-page"'; }?>><a href="?action=update_pil_rating">Pilot Update</a><li>
     <li <?php if($action === 'destionations'){echo 'id="active-page"';  }?>><a href="?action=destionations">Destinations</a><li>
    </ul>
    <div class="clear"></div>
</header><?php }?>
<style>
#navigation {  float: right; margin: 0;border:0 dotted #aaa;padding: 0}
#navigation li {  display: inline; list-style: none; margin: 0;padding: 0}
#navigation a { color: black;  font-size: 11pt;  letter-spacing: -1px;  padding: 2px 15px; text-decoration: none;  text-transform: uppercase;border:none; margin: 0}
#navigation a:hover{  background: #ddd;  color: #000}
#active-page a,#active-page a:hover {  background: #000;  color: #fff;cursor: default}
.clear {clear: both;height: 0;}
</style>
