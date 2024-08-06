
window.addEventListener("message", function(event) {
    if (event.data.action == "show") {
        var timeleft = event.data.time
        timer = 0;
        $("span#time").html(timeleft);
        $(".screen").animate({left: "0px"});

        timer = setInterval(function() {
            timeleft--;
            $("span#time").html(timeleft);

            if (timeleft > 10) {
                $("#test").css("background-color", "#1f282f");

            }
            if (timeleft <= 10) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }
            if (timeleft <= 9.5) {
                $("#test").css("background-color", "#1f282f");
            }
            if (timeleft <= 8.5) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }
            if (timeleft <= 7.5) {
                $("#test").css("background-color", "#1f282f");
            }
            if (timeleft <= 6.5) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }
            if (timeleft <= 5.5) {
                $("#test").css("background-color", "#1f282f");
            }
            if (timeleft <= 4.5) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }
            if (timeleft <= 3.5) {
                $("#test").css("background-color", "#1f282f");
            }
            if (timeleft <= 2.5) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }
            if (timeleft <= 1.5) {
                $("#test").css("background-color", "#1f282f");
            }
            if (timeleft <= 0.5) {
                $("#test").css("background-color", "rgba(138, 0, 0, 0.85)");
            }

            if (timeleft < 1) {
                $("span#time").html("Done!");
                $("#test").css("background-color", "#2b363f");

                
                clearInterval(timer);

                setTimeout(() => {
                    $(".screen").animate({left: "-15%"});
                }, 1000);

                setTimeout(() => {
                    timeleft = 60;
                }, 1500);
            }
        }, 1000)
    } else if (event.data.action == 'close')
    {
        if (timer > 0)
        {
            $("span#time").html("canceled");
            clearInterval(timer);

            setTimeout(() => {
                $(".screen").animate({left: "-15%"});
            }, 1000);

            setTimeout(() => {
                timeleft = event.data.time;
            }, 1500);
        }
    }
})