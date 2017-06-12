$(window).scroll(function () {
    var WinScroll = $(this).scrollTop();
    $(".ParallaxLogo").css({
        "transform":"translate(0px, "+(WinScroll-450) /8+"%)"
    });
    
    /*if (WinScroll > $(".png").offset().top) {
        $("#doctor1,#doctor2,#doctor3,#doctor4").css({ "opacity": "1", "transform": "translateX(0px)" });
        
    }

    if (WinScroll > $(".png").offset().top+350) {
        $("#waiting1,#waiting2,#waiting3,#waiting4,#waiting5").css({ "opacity": "1", "transform": "translateX(0px)" });
    }

    if (WinScroll > $(".png").offset().top + 700) {
        $("#medicineleft,#medicines,#medicineright").css({ "opacity": "1", "transform": "translateX(0px)" });
    }

    if (WinScroll > $(".png").offset().top + 1050) {
        $("#lefti,#righti").css({ "opacity": "1", "transform": "translateX(0px)" });
    }

    if (WinScroll > $(".png").offset().top + 1400) {
        $("#family1,#kid,#family2").css({ "opacity": "1", "transform": "translateX(0px)" });
    }*/
});






function OnloadPopup() {
        $("#OnloadPopup").css({ "display": "block" });
}

$(document).ready(function () {
    $("#closeIcon").click(function () {
        $("#OnloadPopup").css({ "display": "none" });
    });
});

function LoginPopupClick() {
    var LoginModal = document.getElementById("LoginPopupId");
    LoginModal.style.display = 'block';
}
    
  /*  function ShowDiv(evt, divid) {
        var divlinks, divcontent, i;
        divcontent = document.getElementsByClassName("DivContent");
        for (i = 0; i < divcontent.length; i++) {
            divcontent[i].style.display = "none";
        }
        divlinks = document.getElementsByClassName("DivLink");
        for (i = 0; i < divlinks.length; i++) {
            divlinks[i].className = divlinks[i].className.replace(" active", "");
        }
        document.getElementById(divid).style.display = "block";
        evt.currentTarget.className += " active";
    }*/

    function DocSearchResult() {

        document.write("");
    }

    var modal = document.getElementById("OnloadPopup");
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

   /* function jsModal() {
        var modal = document.getElementById('myModal');

        var btn = document.getElementById("Book");

        var span = document.getElementsByClassName("close")[0];
        btn.onclick = function () {
            modal.style.display = "block";
        }

        span.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }*/

    function jsModal() {
        $("#Book").click(function () {
            $("#myModal").css({ "display": "block" });
        });

        $("#close").click(function () {
            $("#myModal").css({ "display": "block" });
        });
    }