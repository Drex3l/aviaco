
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
            document.getElementById("cityList").innerHTML = this.responseText;
        }
    };
    xmlhttp.open("GET", "view/cities.php?nation=" + country+"&city="+city+"&limit="+limit, true);
    xmlhttp.send();
//    window.alert(city);
}