
function loadCities(country,city,limit)
{
    if (window.XMLHttpRequest)
    {
        xmlhttp = new XMLHttpRequest();
    } else
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function ()
    {
        if (this.readyState == 4 && this.status == 200)
        {
            document.getElementById("cityList").innerHTML = this.responseText;  // override content
            document.getElementById("charter-add").href = "?action=charter_insert&country_code="+country; // update hyperlink query string (GET)0
        }
    };
    xmlhttp.open("GET", "view/cities.php?country_code=" + country+"&city_id="+city+"&limit="+limit+"&page="+1, true);
    xmlhttp.send();
}
