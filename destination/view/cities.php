<!DOCTYPE html>
<html>
    <body>
        <?php
        require_once dirname(__FILE__, 3) . '/root/epiqworx/db/handler.php';
        require_once dirname(__FILE__, 2) . ('/model.php');

        $country_code = $_GET['country_code'];
        $city_id = intval($_GET['city_id']);
        $country_limit = $_GET['limit'];
        $page = $_GET['page'];
        $pages = Country::get_cities_page_count($country_limit,$country_code);
        $cities = City::get_by_country($country_code, $_GET['limit'], $page-1);
        ?>

        <ul><?php
            foreach ($cities as $destination) {
                echo '<li>';
                if (is_array($destination)) {
                    $charter_count = Charter::count_by_city($destination['ID']);
                    if($charter_count < 1){ $charter_count = null;}
                    ?>
                    <a href="?action=destionations&city_id=<?= $destination['ID']; ?>&country_code=<?= $country_code; ?>" <?php if ($destination['ID'] == $city_id) {echo 'class="selected"';} ?>>
                        <?= $destination['Name']; ?><span <?php if(!empty($charter_count)){ echo 'class="count"';} ?>>&nbsp;<?= $charter_count;?>&nbsp;</span>
                    </a>
                <?php } else { 
                     $charter_count = Charter::count_by_city($cities['ID']);
                    if($charter_count < 1){ $charter_count = null;}
                    ?>
                    <a href="?action=destionations&city_id=<?= $cities['ID']; ?>&country_code=<?= $country_code; ?>" <?php if ($cities['ID'] == $city_id) {echo 'class="selected"';} ?>>
                    <?= $cities['Name']; ?>
                    </a><span <?php if(!empty($charter_count)){ echo 'class="count"';} ?> >&nbsp;<?= $charter_count;?>&nbsp;</span>
        <?php
        break;
    }
    echo '</li>';
}
?>
            <div class="pager">
                    <?php
                    if($page <= 1){
                        echo "<a class='pull-left text-muted' href='javascript:;' ><i class='fa fa-angle-left' title='Previous'></i>&LessLess;</a>";
                    }else{
                        echo "<a class='pull-left' href='?action=destionations&country_code=$country_code&page=".($page-1)."&city_id=$city_id' ><i class='fa fa-angle-left' title='Previous'></i>&LessLess;</a>";
                    }
                    if($page < $pages){
                        echo "<a class='pull-right' href='?action=destionations&country_code=$country_code&page=".($page+1)."&city_id=$city_id' title='Next'>&GreaterGreater;<i class='fa fa-angle-right'></i></a>";
                    }else{
                        echo "<a class='pull-right text-muted' href='javascript:;' title='Next'>&GreaterGreater;<i class='fa fa-angle-right'></i></a>";
                    }
                    ?>
                <div class="text-center"><ul class="pagination"><li>
                            <div id="dpnPages" class="btn-group">
                            <a href="javascript:popupTogle('dpnPages')"><?= "Page $page of $pages";?></a>
                            <ul class="dropdown-menu">
                                <li>
                                <?php for($k=1;$k<=$pages;$k++){?>
                                    <a href="?action=destionations&country_code=<?= $country_code;?>&page=<?=$k;?>&city_id=<?=$city_id;?>" <?php if(isset($_GET['page']) && $_GET['page']== $k){echo 'class="selected"';}else if(!isset($_GET['page']) && $k==1){echo 'class="selected"';}?>>
                                    <?= str_pad($k,2,'0', STR_PAD_LEFT);?></a>
                                    <?php
                                    if($k % 3 == 0){
                                        echo '</li><li>';
                                    } }?>
                                </li>
                            </ul>
                            </div>
                        </li></ul></div>
                    <style>
                        <?php if($page <= 1){
                            echo '.fa-angle-left::before {content: "--";}';
                        }else{?>
                        .fa-angle-left::before {content: "<?= $page-1;?>";}
                        <?php
                        }
                        if($page < $pages){?>
                        .fa-angle-right::before {content: "<?= $page+1;?>";}
                        <?php }else{
                            echo '.fa-angle-right::before {content: "--";}';
                        }?>
                    </style>
                </div>
        </ul>
    </body>
</html>