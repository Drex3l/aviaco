<?php
error_reporting(E_ALL);
ini_set("display_errors", 0);
?>
<!DOCTYPE html>
<html>

<!-- the head section -->
<head>
    <title>AviaCo :: <?= $title;?></title>
    <link rel="stylesheet" type="text/css"   href="<?= PATH;?>/root/usr/css/main.css" />
</head>

<!-- the body section -->
<body onload="load()"><?php if(empty($error_message)){?>
    <header class="skin">
    <h1>AviaCo</h1>
    <p>the Air for the People</p>
</header>
    <nav class="head skin">
        <ul id="navigation">
        <li <?php if($action === 'model_avg'){ echo 'id="active-page"'; }?> ><a <?php if($action === 'model_avg'){ echo 'href="javascript:"';}else{echo 'href="?action=model_avg"';}?>>comsumption</a><li>
    <li <?php if($action === 'engine_service'){echo 'id="active-page"'; }?>><a <?php if($action === 'engine_service'){ echo 'href="javascript:"';}else{echo 'href="?action=engine_service"';}?>>engine service</a><li>
    <li <?php if($action === 'med_exam'){echo 'id="active-page"'; }?>><a <?php if($action === 'med_exam'){ echo 'href="javascript:"';}else{echo 'href="?action=med_exam"';}?>>med exam</a><li>
     <li <?php if($action === 'rating_pilots'){echo 'id="active-page"';  }?>><a <?php if($action === 'rating_pilots'){ echo 'href="javascript:"';}else{echo 'href="?action=rating_pilots"';}?>>Pilot Rating</a><li>
     <li <?php if($action === 'update_pilot_rating'){echo 'id="active-page"'; }?>><a <?php if($action === 'update_pilot_rating'){ echo 'href="javascript:"';}else{echo 'href="?action=update_pilot_rating"';}?>>Pilot Update</a><li>
     <li <?php if($action === 'destionations'){echo 'id="active-page"';  }?>><a <?php if($action === 'destionations'){ echo 'href="javascript:"';}else{echo 'href="?action=destionations"';}?>>Destinations</a><li>
    </ul>
    <div class="clear"></div>
    </nav><?php }?>
<style>
#navigation {  float: right; margin: 0;border:0 dotted #aaa;padding: 0}
#navigation li {  display: inline; list-style: none; margin: 0;padding: 0}
#navigation a { color: black;  font-size: 11pt;  letter-spacing: -1px;  padding: 2px 15px; text-decoration: none;  text-transform: uppercase;border:none; margin: 0}
#navigation a:hover{  background: #bbb;  color: #000}
#active-page a,#active-page a:hover {  background: #fff;  color: #000;cursor: default}
.clear {clear: both;height: 0;}
</style>
