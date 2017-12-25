<?php
require_once dirname(__FILE__,3).'/root/view/face/header.php';
?>
<noscript>
<div class="no_script">
    <h1 >Your browser is not JavaScript enabled!</h1>
    <p>You're seeing this message because this page contains JavaScript content, and can only be displayed once enabled.<br/><br/>
        This feature can be enabled from the browser settings, as almost all modern now support JavaScript</p>
</div>
</noscript>
<main class="js">
    <h1>Flight Destinations</h1>
    <aside>
        <nav>
            <h2>
                Cities
                <select name="countries" title="<?= $city_id;?>" onchange="loadCities(this.value,this.title,<?=$country_limit;?>)">
                <?php                foreach ($countries as $country){?>
                    <option value="<?= $country['Code']; ?>" <?php if($country_code === $country['Code']){echo 'selected';}?>><?= $country['Name'] ?></option>
                <?php }?>
                </select>
            </h2>
            <ul id="cityList">
                <?php                foreach ($cities as $destination){
                    echo '<li>';
                if(is_array($destination)){?>
                    <a href="?action=destionations&city_id=<?= $destination['ID'];?>&country_code=<?= $country_code;?>&page=<?=$page;?>" <?php if($destination['ID'] == $city_id){ echo 'class="selected"';} ?>>
                        <?= $destination['Name'];?>
                    </a>
                <?php }else{ ?>
                <a href="?action=destionations&city_id=<?= $cities['ID'];?>&country_code=<?= $country_code;?>&page=<?=$page;?>" <?php if($cities['ID'] == $city_id){ echo 'class="selected"';} ?>>
                        <?= $cities['Name'];?>
                    </a>
                <?php 
        break;
                }
 echo '</li>';
                }?>
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
        </nav>
    </aside>
    
    <section style="max-height: 320px;overflow-y: auto">
        <h2 class="right selected"><?= $city['Name'].', '.$city['District']; ?></h2>
        <table id="models" style="width: 100%">
            <tr style="/*position: fixed;width: 100%*/">
                <th>Charter Date</th>
                <th>Aircraft</th>
                <th>Customer</th>
                <th>Pilot</th>
            </tr>
            <?php
            foreach ($destinations as $record){
                echo '<tr>';
                if(is_array($record)){
                    echo '<td>'.$record['DATE'].'</td>';
                    echo '<td>'.$record['AIRCRAFT'].'</td>';
                    echo '<td>'.$record['CUSTOMER'].'</td>';
                    echo '<td>'.$record['PILOT'].'</td>';
                } else {
                    echo '<td>'.$destinations['DATE'].'</td>';
                    echo '<td>'.$destinations['AIRCRAFT'].'</td>';
                    echo '<td>'.$destinations['CUSTOMER'].'</td>';
                    echo '<td>'.$destinations['PILOT'].'</td>';
                    break;
                }
                echo '</tr>';
            }
            ?>
        </table>
        <p class="last_paragraph">
            <a href="?action=add_forms">Add New Charter</a>
        </p>
    </section>
    <BR/>
</main>
<?php
require_once dirname(__FILE__,3).'/root/view/face/footer.php';