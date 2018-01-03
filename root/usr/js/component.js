function load() {
    var main = document.getElementsByClassName('js');
    for(k=0;k<main.length;k++){
        main[k].style.display = "block";
    }
    var label = document.getElementsByClassName('err');
    for(k=0;k<label.length;k++){
        label[k].innerHTML = null;
    }
}
function checkboxStatus(primarykies, name, button) {
    var ID = primarykies.split(';'); //-----------split primary kies from string
    var checkbox = document.getElementsByName(name);//-get individual checkboxes
    
    var selection = ""; //-----------------string to collect selected checkboxes
    for (k = 0; k < checkbox.length; k++) if (checkbox[k].checked) selection += checkbox[k].value + ";";
    selection = selection.substr(0, selection.length - 1);  //----trim delimiter
    var selectionArray = selection.split(';');

    var count = 0;  //---------------------variable to count selected checkboxes
    var decider = false;  //store decision of wheather to disable button, or not


    for (k = 0; k < checkbox.length; k++) if (checkbox[k].checked) count++;
    if (count != ID.length) {
        decider = true;
    }else
    {
        for(n = 0;n < selectionArray.length; n++) if(isValidKey(selectionArray[n],ID)) decider = true;
    }
    if(decider) button.disabled = false;
    else button.disabled = true;
}