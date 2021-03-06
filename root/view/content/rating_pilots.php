<?php require_once dirname(__FILE__,3). '/view/face/header.php'; ?>
<main>
    <h1>Rating Select</h1>

    <aside>
        <!-- display a list of departments -->
        <h2>Ratings</h2>
        <nav>
        <ul>
        <?php foreach ($ratings as $rating) : ?>
            <li>
            <a href="?action=rating_pilots&rating_code=<?= $rating['RTG_CODE']; ?>" <?php if($rating['RTG_NAME'] === $rating_name){ echo 'class="selected"';} ?> >
                <?= $rating['RTG_CODE']; ?>
            </a>
            </li>
        <?php endforeach; 
        if(!isset($rating)){echo "<li>list empty</li>";}
        ?>
        </ul>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table class="fancy" >
            <tr>
                <th>Pilot</th>
                <th>Total Hours</th>
            </tr>
            <?php
            foreach ($pilot_rating as $record){
                echo '<tr>';
                if(is_array($record)){
                    echo '<td>'.$record['PILOT'].'</td>';
                    echo '<td>'.$record['HOURS'].'</td>';
                } else {
                    echo '<td>'.$pilot_rating['PILOT'].'</td>';
                    echo '<td>'.$pilot_rating['HOURS'].'</td>';
                    break;
                }
                echo '</tr>';
            }
            if(empty($pilot_rating['PILOT']) && !isset($record)){echo "<tr><td colspan='2'>list empty</td></tr>";}
            ?>
        </table>
        <h2 class="right selected"><?= $rating_name; ?></h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,3).  '/view/face/footer.php'; ?>
