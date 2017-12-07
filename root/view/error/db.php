<?php include_once dirname(__FILE__,2).  '/header.php'; ?>
<main>
    <h1>Database Error</h1>
    <p>There was an error connecting to the database.</p>
    <p>The database must be installed as described in appendix A.</p>
    <p>The database must be running as described in chapter 1.</p>
    <p>Error message: <?php echo htmlspecialchars($error_message); ?></p>
</main>
<?php include_once dirname(__FILE__,2). '/footer.php'; ?>