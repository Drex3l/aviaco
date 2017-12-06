<?php require_once dirname(__FILE__,2). '/view/header.php'; ?>
<main>
    <h1>AviaCo Aircraft Models</h1>

    <aside>
        <!-- display a list of departments -->
        <h2><u>Models</u></h2>
        <nav>
        <ul>
        <?php foreach ($models as $model) : ?>
            <li>
            <a href="?model_code=<?= $model['MOD_CODE']; ?>">
                <?= $model['MOD_NAME']; ?>
            </a>
            </li>
        <?php endforeach; ?>
        </ul>
        </nav>
    </aside>

    <section>
        <!-- display a table of products -->
        <h2><?= $model_name; ?></h2>
        <table id="models" >
            <tr>
                <th>Course Code</th>
                <th>Description</th>
				<th></th>
            </tr>
            <?php foreach ($aircrafts as $aircraft) : ?>
            <tr>
                <td><?= $aircraft['CHAR_FUEL_GALLONS']; ?></td>
                <td><?= $aircraft['CHAR_OIL_QTS']; ?></td>
                <td><form action="." method="post">
                    <input type="hidden" name="action"  value="delete_aircraft">
                    <input type="hidden" name="id"  value="<?= $aircraft['ID']; ?>">
                    <input type="submit" value="Delete">
                    <input type="hidden" name="model_code" value="<?= $_GET['model_code'];?>"/>
                </form></td>
            </tr>
            <?php endforeach; ?>
        </table>
        <p class="last_paragraph">
            <a href="?action=show_add_form">Add New Aircraft</a>
        </p>
    </section>
</main>
<?php  require_once dirname(__FILE__,2).  '/view/footer.php'; ?>
