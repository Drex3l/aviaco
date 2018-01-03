<?php
require_once dirname(__FILE__, 3) . '/root/view/face/header.php';
?>
<main>
    <h1>New Charter</h1>
    <h2 class="right selected"><?= $country_name; ?></h2>
    <form name="add_charter" action="." method="post" id="add_charter" class="aligned">
        <input type="hidden" name="action" value="add_charter"/>
        <input type="hidden" name="country_code" value="<?= $country_code;?>"/>
        
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
            <option value=<?= $city['ID'];?> <?php if($city_id == $city['ID']){echo 'selected';} ?>><?= $city['Name'];?></option>
                <?php } else {?>
            <option value=<?= $cities['ID'];?> <?php if($city_id == $cities['ID']){echo 'selected';} ?>><?= $cities['Name'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Charter Date:</label><input type="date" name="date" required min="<?= date('Y-m-d');?>"/><label class="err" id="date">error</label><br/>
        <label>Charter Distance:</label><input type="number" name="distance" required min="1" /><label class="err" id="distance">error</label><br/>
        <label>Fuel Amount Used:</label><input type="number" step="0.01" name="fuel" required min=".5"/><label class="err" id="fuel">error</label><br/>
        <label>Oil Amount used:</label><input type="number" name="oil" required step=".01" min=".5"/><label class="err" id="oil">error</label><br/>
        <label>Flying Hours:</label><input type="number" name="fly_hours" required min=".25" step=".05"/><label class="err" id="fly_hours">error</label><br/>
        <label>Waiting hours:</label><input type="number" name="wait_hours" required min="0" step=".05"/><label class="err" id="wait_hours">error</label><br/>
        <label>Select  Pilot:</label>
        <select name="pilot">
            <?php foreach ($pilots as $pilot){
                if(is_array($pilot)){?>
            <option value="<?= $pilot['ID'];?>"><?= $pilot['PILOT'];?></option>
                <?php } else {?>
                    <option value="<?= $pilots['ID'];?>"><?= $pilots['PILOT'];?></option>
                <?php }
            }?>
        </select>
        <br/>
        <label>Select  Copilot:</label>
        <select name="co_pilot">
            <?php foreach ($pilots as $pilot){
                if(is_array($pilot)){?>
            <option value="<?= $pilot['ID'];?>"><?= $pilot['PILOT'];?></option>
                <?php } else {?>
                    <option value="<?= $pilots['ID'];?>"><?= $pilots['PILOT'];?></option>
                <?php }
            }?>
        </select>
        <label class="err" id="copilot">error</label><br/>
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

