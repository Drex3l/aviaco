function isValidKey(name, list) {
    for (k = 0; k < list.length; k++) {
        if (name.toUpperCase() === list[k].toUpperCase())
            return false;
    }
    return true;
}