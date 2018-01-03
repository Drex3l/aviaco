<?php require_once dirname(__FILE__,2). '/face/header.php'; ?>
<main>
    <h1>Error</h1>
    <?php if(isset($error_message)){?><p><?= $error_message; ?></p><?php }?>
    <?php
    if(isset($error)){
        foreach ($error as $msg){?>
    <p><?= $msg;?></p>  
     <?php   }
    }
    ?>
    <a href="javascript:history.back()">&LessLess; Back</a>
</main>
<?php require_once dirname(__FILE__,2).  '/face/footer.php'; ?>
