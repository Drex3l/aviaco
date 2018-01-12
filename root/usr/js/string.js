function isValidKey(name, list) {
    for (k = 0; k < list.length; k++) {
        if (name.toUpperCase() === list[k].toUpperCase())
            return false;
    }
    return true;
}
function isInt(value) {
    var text = antiWhiteSpace(value);
    var point = 0;
    for (k = 0; k < text.length; k++)
    {
        if (text.charCodeAt(k) < 46 || text.charCodeAt(k) > 57) return false;
        if(text.charCodeAt(k) === 47) return false;
        if(text.charCodeAt(k) === 46) point++;
        if(point > 1) return false;
    }
    return true;
}
function antiWhiteSpace(text) {
    var txt = "";
    for (k = 0; k < text.length; k++)
    {
        if (text.charCodeAt(k) > 32)
            txt += text.charAt(k);
    }
    return txt;
}