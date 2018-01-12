<?php
require_once dirname(__FILE__, 3) . '/root/view/face/header.php';
require_once dirname(__FILE__,3).'/root/view/face/noscript.php';
?>
<main class="js">
    <h1>Charter Details</h1>
    <h2 class="right selected"><?= $country_name; ?></h2>
    <form name="charter_record" action="." method="post" id="charter_record" class="aligned">
        <input type="hidden" name="instruction" value="<?= $command;?>">
        <?php if(isset($id)){?><input type="hidden" name="id" value=<?= $id;?> /><?php }?>
        <input type="hidden" name="orig_aircraft" value="<?= $charter['AC_NUMBER']; ?>" />
        <input type="hidden" name="orig_airport" value="<?= $charter['AIRPORT_CODE']; ?>" />
        <input type="hidden" name="orig_date" value="<?= $charter['CHAR_DATE']; ?>" />
        <input type="hidden" name="orig_distance" value="<?= $charter['CHAR_DISTANCE']; ?>" />
        <input type="hidden" name="orig_fuel" value="<?= $charter['CHAR_FUEL_GALLONS']; ?>" />
        <input type="hidden" name="orig_oil" value="<?= $charter['CHAR_OIL_QTS']; ?>" />
        <input type="hidden" name="orig_fly_hours" value="<?= $charter['CHAR_HOURS_FLOWN']; ?>" />
        <input type="hidden" name="orig_wait_hours" value="<?= $charter['CHAR_HOURS_WAIT']; ?>" />
        <input type="hidden" name="orig_pilot" value="<?= $charter['PILOT']; ?>" />
        <input type="hidden" name="orig_co_pilot" value="<?= $charter['COPILOT']; ?>" />
        <input type="hidden" name="orig_customer" value="<?= $charter['CUS_CODE']; ?>" />

        <input type="hidden" name="action" value="charter_record"/>
        <input type="hidden" name="country_code" value="<?= $country_code; ?>"/>
        <input type="hidden" name="page" value="<?= $page; ?>"/>

        <label>Select  Aircraft:</label>
        <select name="aircraft" id="aircraft" onchange="chaterDetails()">
            <?php
            foreach ($aircraft as $ac) {
                if (is_array($ac)) {
                    ?>
                    <option value="<?= htmlspecialchars($ac['AC_NUMBER']); ?>"
                            <?php
                    if (isset($charter) && $charter['AC_NUMBER'] == $ac['AC_NUMBER']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($ac['AC_NUMBER']); ?></option>
                <?php } else { ?>
                    <option value="<?= htmlspecialchars($aircraft['AC_NUMBER']); ?>"><?= $aircraft['AC_NUMBER']; ?></option>
                <?php
                }
            }
            ?>
        </select>
        <br/>
        <label>Select Destination:</label>
        <select name="airport" id="airport" onchange="chaterDetails()">
            <?php
            foreach ($cities as $city) {
                if (is_array($city)) {
                    ?>
                    <option value=<?= htmlspecialchars($city['ID']); ?> <?php
                    if ($city_id == $city['ID']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($city['Name']); ?></option>
                        <?php } else { ?>
                    <option value=<?= htmlspecialchars($cities['ID']); ?> <?php
                    if ($city_id == $cities['ID']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($cities['Name']); ?></option>
    <?php
    }
}
?>
        </select>
        <br/>
        <label>Charter Date:</label><input type="date" id="date" name="date" onchange="chaterDetails()" required min="<?= date('Y-m-d'); ?>" value="<?= htmlspecialchars($charter['CHAR_DATE']); ?>"/><label class="err chtErr" id="date_err">error</label><br/>
        <label>Charter Distance:</label><input type="number" id="distance" name="distance" onchange="chaterDetails()" required min="1" value="<?php if(isset($charter)){ echo htmlspecialchars($charter['CHAR_DISTANCE']);} ?>" /><label class="err chtErr" id="distance_err">error</label><br/>
        <label>Fuel Amount Used:</label><input type="number" id="fuel" step="0.01" name="fuel" onchange="chaterDetails()" required min=".5" value="<?= htmlspecialchars($charter['CHAR_FUEL_GALLONS']); ?>" /><label class="err chtErr" id="fuel_err">error</label><br/>
        <label>Oil Amount used:</label><input type="number" id="oil" name="oil" onchange="chaterDetails()" required step=".01" min=".5" value="<?= htmlspecialchars($charter['CHAR_OIL_QTS']); ?>"/><label class="err chtErr" id="oil_err">error</label><br/>
        <label>Flying Hours:</label><input type="number" id="fly_hours" name="fly_hours" onchange="chaterDetails()" required min=".25" step=".05" value="<?= htmlspecialchars($charter['CHAR_HOURS_FLOWN']); ?>"/><label class="err chtErr" id="fly_err">error</label><br/>
        <label>Waiting hours:</label><input type="number" id="wait_hours" name="wait_hours" onchange="chaterDetails()" required min="0" step=".05" value="<?= htmlspecialchars($charter['CHAR_HOURS_WAIT']); ?>"/><label class="err chtErr" id="wait_err">error</label><br/>
        <label>Select  Pilot:</label>
        <select name="pilot" id="pilot" onchange="chaterDetails()">
            <?php
            foreach ($pilots as $pilot) {
                if (is_array($pilot)) {
                    ?>
                    <option value="<?= htmlspecialchars($pilot['ID']); ?>"<?php
                    if (isset($charter) && $charter['PILOT'] == $pilot['ID']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($pilot['PILOT']); ?></option>
                <?php } else { ?>
                    <option value="<?= htmlspecialchars($pilots['ID']); ?>"><?= htmlspecialchars($pilots['PILOT']); ?></option>
                <?php
                }
            }
            ?>
        </select>
        <br/>
        <label>Select  Copilot:</label>
        <select name="co_pilot" id="co_pilot" onchange="chaterDetails()">
<?php
foreach ($pilots as $pilot) {
    if (is_array($pilot)) {
        ?>
                    <option value="<?= htmlspecialchars($pilot['ID']); ?>"<?php
                    if (isset($charter) && $charter['COPILOT'] == $pilot['ID']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($pilot['PILOT']); ?></option>
                <?php } else { ?>
                    <option value="<?= htmlspecialchars($pilots['ID']); ?>"><?= htmlspecialchars($pilots['PILOT']); ?></option>
                <?php
                }
            }
            ?>
        </select>
        <label class="err chtErr" id="copilot_err">error</label><br/>
        <label>Select  Customer:</label>
        <select name="customer" id="customer" onchange="chaterDetails()">
<?php
foreach ($customers as $customer) {
    if (is_array($customer)) {
        ?>
                    <option value="<?= htmlspecialchars($customer['CUS_CODE']); ?>"<?php
                    if (isset($charter) && $charter['CUS_CODE'] == $customer['CUS_CODE']) {
                        echo 'selected';
                    }
                    ?>><?= htmlspecialchars($customer['NAME']); ?></option>
    <?php } else { ?>
                    <option value="<?= htmlspecialchars($customers['CUS_CODE']); ?>"><?= htmlspecialchars($customers['NAME']); ?></option>
    <?php
    }
}
?>
        </select>
        <br/>
        <br/><label>&nbsp;</label><input type="submit" id="submit" value="<?= $command;?> Charter" disabled/><br/>
    </form>

    <p>
        <a href="?action=destionations&country_code=<?= $country_code; ?>&city_id=<?= $city_id; ?>&page=<?= $page; ?>"><span style="color: #000">&LessLess;</span> destionations list</a>
    </p>
</main>
<?php
require_once dirname(__FILE__, 3) . '/root/view/face/footer.php';

