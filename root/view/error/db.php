<?php include_once dirname(__FILE__, 2) . '/face/header.php'; ?>
<main>
    <h1>Database Error</h1>

    <?php
    switch ($case) {
        case 'connect':
            ?>
            <p>There was an error connecting to the database.</p>
            <table style="margin: 0 auto;text-align: left">
                <tr><td style="color: #000">Code</td><td style="background-color: #ddd;font-weight: 700">&nbsp;<?php echo substr($error_message, 0, 22); ?></td></tr>
                <tr><td style="color: #000">Description</td><td style="background-color: #ddd">&nbsp;&nbsp;<?php echo substr($error_message, 23, (strlen($error_message)) - 23); ?>&nbsp;&nbsp;</td></tr>
            </table>
            <?php
            break;
        case 'DML':
            $piece = explode(';', $error_message);
            ?>
            <p>Execution Error @<?= $piece[0]; ?></p>
            <p>Error Code : <?= $piece[1]; ?></p>
            <p>Description : <?= $piece[2]; ?></p>
        <?php break;
    default:
        ?>
            <p>Generic Error</p>
            <table style="margin: 0 auto;text-align: left">
                <tr><td style="color: #000">Code</td><td style="background-color: #ddd;font-weight: 700">&nbsp;<?php echo substr($error_message, 0, 15); ?></td></tr>
                <tr><td style="color: #000">Description</td><td style="background-color: #ddd">&nbsp;&nbsp;<?php echo substr($error_message, 17, (strlen($error_message))); ?>&nbsp;&nbsp;</td></tr>
            </table>
        <?php
        break;
}
?>
</main>
<?php include_once dirname(__FILE__, 2) . '/face/footer.php'; ?>