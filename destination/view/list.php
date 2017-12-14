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
                <select name="countries" title="<?= $city['Name'];?>" onchange="loadCities(this.value,this.title,<?=$country_limit;?>)">
                <?php                foreach ($countries as $country){?>
                    <option value="<?= $country['Code']; ?>" <?php if($country_code === $country['Code']){echo 'selected';}?>><?= $country['Name'] ?></option>
                <?php }?>
                </select>
            </h2>
            <ul id="cityList">
                <?php                foreach ($cities as $destination){
                    echo '<li>';
                if(is_array($destination)){?>
                    <a href="?action=destionations&city_id=<?= $destination['ID'];?>&country_code=<?= $country_code;?>" <?php if($destination['Name'] === $city['Name']){ echo 'class="selected"';} ?>>
                        <?= $destination['Name'];?>
                    </a>
                <?php }else{ ?>
                <a href="?action=destionations&city_id=<?= $cities['ID'];?>&country_code=<?= $country_code;?>" <?php if($cities['Name'] === $city['Name']){ echo 'class="selected"';} ?>>
                        <?= $cities['Name'];?>
                    </a>
                <?php 
        break;
                }
 echo '</li>';
                }?>
                <li><?= $pages;?></li>
            </ul>
        </nav>
    </aside>
    <section>
        <h2 class="right selected"><?= $city['Name'].', '.$city['District']; ?></h2>
    </section>
</main>
<?php
require_once dirname(__FILE__,3).'/root/view/face/footer.php';