<?php require_once dirname(__FILE__,3). '/view/face/header.php'; ?>
<main>
    <h1>Aircraft Models</h1>

    <aside>
        <!-- display a list of departments -->
        <h2>Models</h2>
        <nav>
        <ul>
        <?php foreach ($models as $model) : ?>
            <li>
                <a href="?action=model_avg&model_code=<?= $model['MOD_CODE']; ?>" <?php if($model['MOD_NAME'] === $model_name){ echo 'class="selected"';} ?> >
                <?= $model['MOD_NAME']; ?>
            </a>
            </li>
        <?php endforeach;
        if(!isset($model)){echo "<li>list empty</li>";}
        ?>
        </ul>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table class="fancy" >
            <tr>
                <th>Average Fuel</th>
                <th>Average Oil</th>
            </tr>
            <?php if(count($AVG)>0){?>
            <tr>
                <td><?= $AVG['FUEL']; ?></td>
                <td><?= $AVG['OIL']; ?></td>
            </tr>
            <?php } else {
     echo "<tr><td colspan='2'>charter empty</td></tr>";
        }?>
        </table>
        <h2 class="right selected"><?= $model_name; ?></h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,3).  '/view/face/footer.php'; ?>
