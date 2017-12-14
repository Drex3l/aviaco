<!DOCTYPE html>
<html>
    <body>
        <?php
        require_once dirname(__FILE__, 3) . '/root/epiqworx/db/handler.php';
        require_once dirname(__FILE__, 2) . ('/model/datasource.php');

        $nation = $_GET['nation'];
        $city_name = $_GET['city'];
        $country_limit = $_GET['limit'];
        $cities = City::get_by_country($nation, $country_limit, 0);
        ?>

        <ul><?php
            foreach ($cities as $destination) {
                echo '<li>';
                if (is_array($destination)) {
                    ?>
                    <a href="?action=destionations&city_id=<?= $destination['ID']; ?>&country_code=<?= $country_code; ?>" <?php if ($destination['Name'] === $city_name) {
                        echo 'class="selected"';
                    } ?>>
                        <?= $destination['Name']; ?>
                    </a>
                <?php } else { ?>
                    <a href="?action=destionations&city_id=<?= $cities['ID']; ?>&country_code=<?= $country_code; ?>" <?php if ($cities['Name'] === $city['Name']) {
                echo 'class="selected"';
            } ?>>
                    <?= $cities['Name']; ?>
                    </a>
        <?php
        break;
    }
    echo '</li>';
}
?>
            <li><?= Country::get_cities_page_count($country_limit, "$nation"); ?></li>
        </ul>
    </body>
</html>