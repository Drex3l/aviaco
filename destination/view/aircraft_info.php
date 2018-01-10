<?php
require_once dirname(__FILE__, 3) . '/root/view/face/header.php';
?>
<main>
    <h1>Aircraft Service Schedule</h1>
    <h2 class="right selected"><?= $ac_no; ?></h2>
    <form name="arcraft_view" action="." method="" id="aircraft_view" class="aligned">
        <label>Hours to next service <strong>(Left Engine)</strong>:</label>
        <input type="text" name="left_engine" readonly size="4" value="<?= htmlspecialchars($aircraft['EL']);?>"/>
        <br/>
        <label>Hours to next service <strong>(Right Engine)</strong>:</label>
        <input type="text" name="right_engine" readonly size="4" value="<?= htmlspecialchars($aircraft['ER']);?>"/>
        <br/>
        <label>Hours to next major inspection <strong>(Air Frame)</strong>:</label>
        <input type="text" name="air_frame" readonly size="4" value="<?= htmlspecialchars($aircraft['AF']);?>"/>
        <br/>
        <label>Average Fuel Consumption per Charter:</label>
        <input type="text" name="avg_fuel" readonly size="4" value="<?= htmlspecialchars($aircraft['FUEL']);?>"/>
        <br/>
        <label>Average Oil Consumption per Charter:</label>
        <input type="text" name="avg_oil" readonly size="4" value="<?= htmlspecialchars($aircraft['OIL']);?>"/>
        <br/>
    </form>
    <p class="">
        <a href="?action=destionations"><span style="color: #000">&LessLess;</span> destionations list</a>
    </p>
</main>
<style>
    form.aligned label {width: 39%;}
</style>
<?php
require_once dirname(__FILE__, 3) . '/root/view/face/footer.php';
