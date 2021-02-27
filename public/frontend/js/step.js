$(document).ready(function() {

    if(localStorage.getItem('is_compleate') == '1'){
        window.location.href = base_url+"/new-for-you";
    }

    var current_fs, next_fs, previous_fs; //fieldsets
    var opacity;
    var current = 1;
    var steps = $("fieldset").length;
    setProgressBar(current);

    $(".next").click(function() {

        current_fs = $(this).parent();
        next_fs = $(this).parent().next();
        console.log($(this).val())
        if($(this).val() == 'Yes'){
          sendRequest($(this).attr('data_internal'),current,steps,$(this).attr('data_link'),$(this).attr('data_id'));
        }
        //Add Class Active
        $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

        //show the next fieldset
        next_fs.show();
        //hide the current fieldset with style
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now) {
                // for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                next_fs.css({
                    'opacity': opacity
                });
            },
            duration: 500
        });
        
        console.log('current == ',current);
        setProgressBar(++current);
    });

    $(".previous").click(function() {

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

        //Remove class active
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        //show the previous fieldset
        previous_fs.show();

        //hide the current fieldset with style
        current_fs.animate({
            opacity: 0
        }, {
            step: function(now) {
                // for making fielset appear animation
                opacity = 1 - now;

                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                previous_fs.css({
                    'opacity': opacity
                });
            },
            duration: 500
        });
        setProgressBar(--current);
    });

    function setProgressBar(curStep) {
        var percent = parseFloat(100 / steps) * curStep;

        percent = percent.toFixed();
        $(".progress-bar")
            .css("width", percent + "%")
    }

    $(".submit").click(function() {
        return false;
    })

});

function sendRequest(is_internal,current,steps,data_link,ads_id){
  
  if(data_link.indexOf('{name}') != -1){
        var data_link = data_link.replace('{name}', localStorage.getItem('name'));
    }

    if(data_link.indexOf('{email}') != -1){
        var data_link = data_link.replace('{email}', localStorage.getItem('email'));
    }
    if(is_internal == 0){
        saveLinkData(data_link,ads_id);
        window.open(data_link,'_blank');
    }else{
        saveLinkData(data_link,ads_id);
        sendLinkData(data_link);
        console.log(is_internal,data_link);
    }
    
    if(current == steps){
        localStorage.setItem('is_compleate','1');
    }
}

function saveLinkData(data_link,ads_id){
    $.ajax({
            "headers": {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            method: "POST",
            url: base_url + '/save_link',
            data: {
                user_id: localStorage.getItem('user_id'),
                linkdata: data_link,
                ads_id: ads_id
            }
        })
        .done(function(msg) {
            msg = JSON.parse(msg);
            console.log(msg);
        });
}

function sendLinkData(data_link){
    $.ajax({
            "headers": {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            method: "POST",
            url: base_url + '/send_linkdata',
            data: {
                user_id: localStorage.getItem('user_id'),
                linkdata: data_link
            }
        })
        .done(function(msg) {
            msg = JSON.parse(msg);
            console.log(msg);
        });
}
