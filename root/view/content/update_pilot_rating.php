<?php require_once dirname(__FILE__,3). '/view/face/header.php'; 
 require_once dirname(__FILE__,3).'/view/face/noscript.php';
?>
<main class="js">
    <h1>Pilot Select</h1>
    <aside>
        <!-- display a list of departments -->
        <h2>Pilots</h2>
        <nav>
        <form action="." method="post">
        <!--<input type="hidden" name="action" value="update_pilot_rating"/>-->
        <ul>
        <?php foreach ($employee as $record) : ?>
            <li><a href="?action=update_pilot_rating&emp_num=<?= $record['ID']; ?>" <?php if($record['ID'] === $pilot_data['ID']){ echo 'class="selected"';} ?> > <?= $record['PILOT']; ?></a>
            </li>
        <?php endforeach; ?>
        </ul>
        </form>
        </nav>
    </aside>
    <aside>
        <!-- display a list of departments -->
        <h2>Ratings</h2>
        <nav>
        <form action="." method="post">
        <input type="hidden" name="action" value="rate_list"/>
        <ul>
        <?php foreach ($ratings as $rating) : ?>
            <li><label><input onchange="checkboxStatus('<?= Rating::get_rating_string($emp_num);?>','rating[]',submit)" type="checkbox" name="rating[]" value="<?= $rating['RTG_CODE']; ?>" <?php if(Rating::check($pilot_data['ID'],$rating['RTG_CODE'])){?>checked<?php }?> /><?= $rating['RTG_CODE']; ?></label>
            </li>
        <?php endforeach; ?>
        </ul>
        <input type="hidden" name="pilot" value="<?= $pilot_data['ID']; ?>"/>
        <input type="submit" value="save changes" id="submit" disabled /><br/><br/>
        </form>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table class="fancy">
            <tr>
                <th>Field</th>
                <th>Data</th>
            </tr>
            <tr><td>FIRST NAME</td> <td><?= $pilot_data['EMP_FNAME']; ?></td> </tr>
             <tr><td>LAST NAME</td> <td><?= $pilot_data['EMP_LNAME']; ?></td> </tr>
               <tr><td>HIRE DATE</td> <td><?= $pilot_data['EMP_HIRE_DATE']; ?></td> </tr>
                <tr><td>MED EXAM</td> <td><?= $pilot_data['PIL_MED_DATE']; ?></td> </tr>
                <tr><td>RATINGS</td> <td><?= $pilot_data['PIL_RATINGS']; ?></td> </tr>
                <tr><td>RATING DATE</td> <td><?= $pilot_data['EARNRTG_DATE']; ?></td> </tr>
        </table>
    </section>
</main>
<?php  require_once dirname(__FILE__,3).  '/view/face/footer.php'; ?>
