<?php
require_once dirname(__FILE__,3).'/root/view/face/header.php';
?>
<main>
    <h1>Flight Destinations</h1>
    <aside>
        <nav>
            <h2>
                Cities
                <select name="countries" onchange="">
                <?php                foreach ($countries as $country){?>
                    <option value="<?= $country['Code']; ?>" <?php if($country_code === $country['Code']){echo 'selected';}?>><?= $country['Name'] ?></option>
                <?php }?>
                </select>
            </h2>
            <ul>
                <?php                foreach ($cities as $destination){?>
                <li>
                    <a href="?action=destionations&city_id=<?= $destination['ID'];?>" <?php if($destination['Name'] === $city['Name']){ echo 'class="selected"';} ?>>
                        <?= $destination['Name'];?>
                    </a>
                </li>
                <?php }?>
            </ul>
        </nav>
    </aside>
    <section>
        <h2 class="right selected"><?= $city['Name'].', '.$city['District']; ?></h2>
    </section>
</main>
<?php
require_once dirname(__FILE__,3).'/root/view/face/footer.php';