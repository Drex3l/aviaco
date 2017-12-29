
<?php
require_once dirname(__FILE__, 3) . '/root/view/face/header.php';
?>
<main>
    <h1>Pilot Information</h1>
    <h2 class="right selected"><?= $pilot['PILOT']; ?></h2>
    <form name="pilot_view" action="." method="" id="pilot_view" class="aligned">
        <label>Total number of flights:</label>
        <input type="text" name="num_flights" readonly size="4" value="<?= $pilot['FLIGHTS'];?>"/>
        <br/>
        <label>Total number of hours flown:</label>
        <input type="text" name="flight_hours" readonly size="4" value="<?= $pilot['HOURS'];?>"/>
        <br/>
        <label>All pilot ratings:</label>
        <input type="text" name="pil_ratings" readonly value="<?= $pilot['RATINGS'];?>"/>
        <br/>
    </form>
    <p class="">
        <a href="?action=destionations"><span style="color: #000">&LessLess;</span> destionations list</a>
    </p>
</main>
<?php
require_once dirname(__FILE__, 3) . '/root/view/face/footer.php';
