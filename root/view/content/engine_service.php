<?php require_once dirname(__FILE__,3). '/view/face/header.php'; ?>
<main>
    <h1>Aircraft Engine Service</h1>

    <aside>
        <!-- display a list of departments -->
        <h2>Hours</h2>
        <nav>
        <form action="." method="post">
                    <input type="hidden" name="action"  value="engine_service">
                    <input type="number" name="hours" value="<?= $hours;?>" ><br/>
                    <input type="submit" value="Preview">
                </form><br/>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table class="fancy" >
            <tr>
                <th>Aircraft Number</th>
            </tr>
            <?php
            foreach ($aircrafts as $aircraft){
                echo '<tr><td>';
                if(is_array($aircraft)){
                    echo $aircraft['AC_NUMBER'];
                } else {
                    echo $aircrafts['AC_NUMBER'];
                    break;
                }
                echo '</td></tr>';
            }
            ?>
        </table>
        <h2 class="right selected">Service within <?= $hours; ?> hours or less</h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,3).  '/view/face/footer.php'; ?>
