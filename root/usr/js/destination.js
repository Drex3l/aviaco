
function loadCities(country,city,limit,page)
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
    xmlhttp.open("GET", "view/cities.php?country_code=" + country+"&city="+city+"&limit="+limit+"&page="+1, true);
    xmlhttp.send();
//    window.alert(page);
}
function popupTogle(id)
{
    var popup = document.getElementById(id);
    popup.classList.toggle('open');
}