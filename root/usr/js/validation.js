function chaterDetails() {
    var err = 0;
    //---------------------------------------------------create controls
    var cmbAC = document.getElementById('aircraft');
    var cmbCity = document.getElementById('airport');
    var dptDepatre = document.getElementById('date');
    var txtDistance = document.getElementById('distance');
    var txtFuel = document.getElementById('fuel');
    var txtOil = document.getElementById('oil');
    var txtFlyHours = document.getElementById('fly_hours');
    var txtWaitHours = document.getElementById('wait_hours');
    var cmbPilot = document.getElementById('pilot');
    var cmbCopilot = document.getElementById('co_pilot');
    var cmbCustomer = document.getElementById('customer');

    var lblError = document.getElementsByClassName('chtErr');
    var submit = document.getElementById('submit');
    //-------------------------------------------------------------reset contros
    submit.disabled = true;
    for (k = 0; k < lblError.length; k++)
        lblError[k].innerHTML = null;
    //----------------------------------------------------------start descisions

    //------------------------------------------------------------------Aircraft
    if (document.getElementsByName("orig_aircraft")[0].value !== cmbAC.value)
    {
        submit.disabled = false;
    }
    //---------------------------------------------------------------Destination
    if (document.getElementsByName("orig_airport")[0].value !== cmbCity.value)
    {
        submit.disabled = false;
    }
    //--------------------------------------------------------------Charter Date
    if (document.getElementsByName("orig_date")[0].value !== dptDepatre.value)
    {
        var today = new Date().toISOString().substr(0,10);
        if(dptDepatre.value === "")
        {
            err++;
            document.getElementById('date_err').innerHTML = "please select date";
        }else if(Date.parse(today) > Date.parse(dptDepatre.value))
        {
            err++;
            document.getElementById('date_err').innerHTML = "timing unrealistic";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //------------------------------------------------------------------Distance
    if(document.getElementsByName('orig_distance')[0] !== txtDistance.value)
    {
        if(txtDistance.value === "")
        {
            err++;
            document.getElementById('distance_err').innerHTML = "please give flight distance";
        }else if(!isInt(txtDistance.value))
        {
            err++;
            document.getElementById('distance_err').innerHTML = "numbers only please";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //----------------------------------------------------------------------Fuel
    if(document.getElementsByName('orig_fuel')[0] !== txtFuel.value)
    {
        if(txtFuel.value === "")
        {
            err++;
            document.getElementById('fuel_err').innerHTML = "please give fuel used";
        }else if(!isInt(txtFuel.value))
        {
            err++;
            document.getElementById('fuel_err').innerHTML = "numbers only please";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //----------------------------------------------------------------------Fuel
    if(document.getElementsByName('orig_oil')[0] !== txtOil.value)
    {
        if(txtOil.value === "")
        {
            err++;
            document.getElementById('oil_err').innerHTML = "please give oil used";
        }else if(!isInt(txtOil.value))
        {
            err++;
            document.getElementById('oil_err').innerHTML = "numbers only please";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //--------------------------------------------------------------Flight Hours
    if(document.getElementsByName('orig_fly_hours')[0] !== txtFlyHours.value)
    {
        if(txtFlyHours.value === "")
        {
            err++;
            document.getElementById('fly_err').innerHTML = "please give flight hours";
        }else if(!isInt(txtFlyHours.value))
        {
            err++;
            document.getElementById('fly_err').innerHTML = "numbers only please";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //-------------------------------------------------------------Waiting Hours
    if(document.getElementsByName('orig_wait_hours')[0] !== txtWaitHours.value)
    {
        if(txtWaitHours.value === "")
        {
            err++;
            document.getElementById('wait_err').innerHTML = "please give waiting hours";
        }else if(!isInt(txtWaitHours.value))
        {
            err++;
            document.getElementById('wait_err').innerHTML = "numbers only please";
        }
        else
        {
            submit.disabled = false;
        }
    }
    //---------------------------------------------------------------------Pilot
    if (document.getElementsByName("orig_pilot")[0].value !== cmbPilot.value)
    {
        submit.disabled = false;
    }
    //------------------------------------------------------------------Co-Pilot
    if (document.getElementsByName("orig_co_pilot")[0].value !== cmbCopilot.value)
    {
        submit.disabled = false;
    }
    //------------------------------------------------------------------Customer
    if (document.getElementsByName("orig_customer")[0].value !== cmbCustomer.value)
    {
        submit.disabled = false;
    }

    if (err > 0) submit.disabled = true;
//    window.alert(err);
}