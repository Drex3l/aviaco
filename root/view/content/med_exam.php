<?php require_once dirname(__FILE__,3). '/view/face/header.php'; ?>
<main>
    <h1>Pilot Medical Examinations</h1>

    <aside>
        <!-- display a list of departments -->
        <h2>Days</h2>
        <nav>
        <form action="." method="post">
                    <input type="hidden" name="action"  value="med_exam">
                    <input type="number" name="days" value="<?= $days;?>" min="1"><br/>
                    <input type="submit" value="Preview">
                </form><br/>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table class="fancy">
            <tr>
                <th>Pilot</th>
            </tr>
            <?php
            foreach ($pilots as $pilot){
                echo '<tr><td>';
                if(is_array($pilot)){
                    echo $pilot['PILOT'];
                } else {
                    echo $pilots['PILOT'];
                    break;
                }
                echo '</td></tr>';
            }
            if(empty($pilots['AC_NUMBER']) && !isset($pilot)){echo "<tr><td>list empty</td></tr>";}
            ?>
        </table>
        <h2 class="right selected">Examinations within <?= $days; ?> days or less</h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,3).  '/view/face/footer.php'; ?>
