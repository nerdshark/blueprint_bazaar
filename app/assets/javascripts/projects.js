/**
 * Created with JetBrains RubyMine.
 * User: nerdshark
 * Date: 12/3/12
 * Time: 6:39 PM
 * To change this template use File | Settings | File Templates.
 */
// This is which step of the new project form the user is on
var currentStep = 1;

function nextStep () {
    if (currentStep < 3) {
        currentStep++;
        refreshNewProjectForm();
    }
}

function previousStep () {
    if (currentStep > 1) {
        currentStep--;
        refreshNewProjectForm();
    }
}

function refreshNewProjectForm () {
    if (currentStep == 1) {
        $("#step2").hide();
        $("#step3").hide();
        $("#submitProject").hide();

        $("#step1").show();
        $("#next").show();

    }
    else if (currentStep == 2) {
        $("#step1").hide();
        $("#step3").hide();
        $("#submitProject").hide();

        $("#step2").show();
        $("#next").show();
    }
    else if (currentStep == 3) {
        $("#step1").hide();
        $("#step2").hide();
        $("#next").hide();
        $("#step3").show();
        $("#submitProject").show();
    }
}

$("#new_project").submit(function (){
    return false;
});