<?php
require_once dirname(__FILE__,3).'/root/view/face/header.php';
require_once dirname(__FILE__,3).'/root/view/face/noscript.php';
?>
<main class="js">
    <h1>Flight Destinations</h1>
    <aside>
        <nav>
            <h2>
                Cities
                <select name="countries" title="<?= $city_id;?>" onchange="loadCities(this.value,this.title,<?= $country_limit; ?>)">
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
        <table class="fancy" style="width: 100%">
            <tr>
                <th>Date</th>
                <th>Aircraft</th>
                <th>Customer</th>
                <th>Pilot</th>
                <th class="control"></th>
            </tr>
            <?php
            foreach ($destinations as $record){
                echo '<tr>';
                if(is_array($record)){
                    echo '<td>'.$record['DATE'].'</td>';
                    echo '<td><a href="?action=view_aircraft&ac_no='.$record['AIRCRAFT'].'">'.$record['AIRCRAFT'].'</a></td>';
                    echo '<td>'.$record['CUSTOMER'].'</td>';
                    echo '<td><a href="?action=view_pilot&emp_no='.$record['EMP_NUM'].'">'.$record['PILOT'].'</a></td>';
                    echo '<td class="button control"><form action="." method="post">
                    <input type="hidden" name="action" value="dml_charter">
                    <input type="hidden" name="instruction" value="update">
                    <input type="hidden" name="id" value="'.$record['ID'].'">
                    <input type="hidden" name="country_code" value="'.$country_code.'">
                    <input type="hidden" name="page" value='.$page.'>
                    <input type="hidden" name="city_id" value='.$city_id.'>
                    <input type="submit" value="update" name="update">
                    <input type="submit" value="delete" name="delete">
                </form></td>';
                } else {
                    echo '<td>'.$destinations['DATE'].'</td>';
                    echo '<td><a href="?action=view_aircraft&ac_no='.$destinations['AIRCRAFT'].'">'.$destinations['AIRCRAFT'].'</a></td>';
                    echo '<td>'.$destinations['CUSTOMER'].'</td>';
                    echo '<td><a href="?action=view_pilot&emp_no='.$destinations['EMP_NUM'].'">'.$destinations['PILOT'].'</a></td>';
                    echo '<td class="button control"><form action="." method="post">
                    <input type="hidden" name="action" value="dml_charter">
                    <input type="hidden" name="country_code" value="update">
                    <input type="hidden" name="id" value="'.$destinations['ID'].'">
                    <input type="hidden" name="country_code" value="'.$country_code.'">
                    <input type="hidden" name="page" value='.$page.'>
                    <input type="hidden" name="city_id" value='.$city_id.'>
                    <input type="submit" value="update" name="update">
                    <input type="submit" value="delete" name="delete">
                </form></td>';
                    break;
                }
                echo '</tr>';
            }
            ?>
        </table>
        <p class="last_paragraph">
            <a id="charter-add" href="?action=charter_insert&country_code=<?= $country_code;?>&city_id=<?= $city_id;?>&page=<?=$page;?>">Add New Charter</a>
        </p>
    </section>
    <br/>
</main>
<?php
require_once dirname(__FILE__,3).'/root/view/face/footer.php';