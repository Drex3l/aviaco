<?php require_once dirname(__FILE__,2). '/view/header.php'; ?>
<main>
    <h1>AviaCo Aircraft Models</h1>

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
        <?php endforeach; ?>
        </ul>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <table id="models" >
            <tr>
                <th>AVERAGE FUEL</th>
                <th>AVERAGE OIL</th>
            </tr>
            <tr>
                <td><?= $AVG['FUEL']; ?></td>
                <td><?= $AVG['OIL']; ?></td>
            </tr>
        </table>
        <h2 class="right selected"><?= $model_name; ?></h2>
    </section>
</main>
<?php  require_once dirname(__FILE__,2).  '/view/footer.php'; ?>
