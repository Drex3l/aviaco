<?php
require_once dirname(__FILE__, 3) . '/root/view/face/header.php';
?>
<main>
    <h1>New Charter</h1>
    <h2 class="right selected"><?= $country_name; ?></h2>
    <form name="add_charter" action="." method="post" id="add_charter" class="aligned">
        <input type="hidden" name="action" value="add_charter"/>
        <label>Select  Aircraft:</label>
        <select name="aircraft">
            <?php foreach ($aircraft as $ac){
                if(is_array($ac)){?>
            <option value="<?= $ac['AC_NUMBER'];?>"><?= $ac['AC_NUMBER'];?></option>
                <?php } else {?>
                    <option value="<?= $aircraft['AC_NUMBER'];?>"><?= $aircraft['AC_NUMBER'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Select Destination:</label>
        <select name="airport">
            <?php            foreach ($cities as $city){
                if(is_array($city)){?>
            <option value=<?= $city['ID'];?>><?= $city['Name'];?></option>
                <?php } else {?>
                    <option value=<?= $cities['ID'];?>><?= $cities['Name'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Charter Date:</label><input type="date" name="date" required /><br/>
        <label>Charter Distance:</label><input type="number" name="distance" required /><br/>
        <label>Fuel Amount Used:</label><input type="number" name="fuel" required /><br/>
        <label>Oil Amount used:</label><input type="number" name="oil" required /><br/>
        <label>Flying Hours:</label><input type="number" name="fly_hours" required /><br/>
        <label>Waiting hours:</label><input type="number" name="wait_hours" required /><br/>
        <label>Select  Pilot:</label>
        <select name="pilot">
            <?php foreach ($pilots as $pilot){
                if(is_array($pilot)){?>
            <option value="<?= $pilot['EMP_NUM'];?>"><?= $pilot['NAME'];?></option>
                <?php } else {?>
                    <option value="<?= $pilots['EMP_NUM'];?>"><?= $pilots['NAME'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Select  Copilot:</label>
        <select name="co_pilot">
            <?php foreach ($pilots as $pilot){
                if(is_array($pilot)){?>
            <option value="<?= $pilot['EMP_NUM'];?>"><?= $pilot['NAME'];?></option>
                <?php } else {?>
                    <option value="<?= $pilots['EMP_NUM'];?>"><?= $pilots['NAME'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Select  Customer:</label>
        <select name="customer">
            <?php foreach ($customers as $customer){
                if(is_array($customer)){?>
            <option value="<?= $customer['CUS_CODE'];?>"><?= $customer['NAME'];?></option>
                <?php } else {?>
                    <option value="<?= $customers['CUS_CODE'];?>"><?= $customers['NAME'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <br/><label>&nbsp;</label><input type="submit" value="Add Charter Info"/><br/>
    </form>
       
    <p>
        <a href="?action=destionations&country_code=<?= $country_code;?>&city_id=<?= $city_id;?>&page=<?=$page;?>"><span style="color: #000">&LessLess;</span> destionations list</a>
    </p>
</main>
<?php
require_once dirname(__FILE__, 3) . '/root/view/face/footer.php';

