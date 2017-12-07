<?php require_once dirname(__FILE__,2). '/header.php'; ?>
<main>
    <h1>Error</h1>
    <p><?= $error_message; ?></p>
    <p><?= $_GET['msg'];?></p>
</main>
<?php require_once dirname(__FILE__,2).  '/footer.php'; ?>
