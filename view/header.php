<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
?>
<!DOCTYPE html>
<html>

<!-- the head section -->
<head>
    <title>PRT2110 TEST ASSIGNMENT</title>
    <link rel="stylesheet" type="text/css"   href="usr/css/main.css" />
</head>

<!-- the body section -->
<body><?php if(empty($error_message)){?>
    <header>
    <h1>AviaCo</h1>
    <p>the Air for the People</p>
    <ul id="navigation">
    <li <?php if($action === 'model_avg'){?> id="active-page" <?php }?> ><a href="?action=model_avg">comsumption</a><li>
    <li <?php if($action === 'engine_service'){?> id="active-page" <?php }?>><a href="?action=engine_service">engine service</a><li>
    <li <?php if($action === 'med_exam'){?> id="active-page" <?php }?>><a href="?action=med_exam">med exam</a><li>
     <li <?php if($action === 'rating_pilots'){?> id="active-page" <?php }?>><a href="?action=rating_pilots">Pilot Rating</a><li>
     <li <?php if($action === 'update_pil_rating'){?> id="active-page" <?php }?>><a href="?action=update_pil_rating">Pilot Update</a><li>
    </ul>
    <div class="clear"></div>
</header><?php }?>
<style>
#navigation {  float: right; margin: 0;border:0 dotted #aaa}
#navigation li {  display: inline; list-style: none; margin: 0}
#navigation a { color: black;  font-size: 11pt;  letter-spacing: -1px;  padding: 2px 15px; text-decoration: none;  text-transform: uppercase;border:none; margin: 0}
#navigation a:hover{  background: #008c8c;  color: white;}
#active-page a {  background: #000;  color: #fff;}
.clear {clear: both;height: 0;}
</style>
