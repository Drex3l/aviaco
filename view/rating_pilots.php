<?php require_once dirname(__FILE__,2). '/view/header.php'; ?>
<main>
    <h1>Pilot Rating</h1>

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
        <?php endforeach; ?>
        </ul>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table id="models" >
            <tr>
                <th>PILOT</th>
                <th>TOTAL HOURS</th>
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
            ?>
        </table>
        <h2 class="right selected"><?= $rating_name; ?></h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,2).  '/view/footer.php'; ?>
