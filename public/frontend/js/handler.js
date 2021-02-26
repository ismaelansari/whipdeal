$('.btn1').click(function() {
    localStorage.setItem('name', $('#full_name').val());
    localStorage.setItem('email', $('#email').val());
});

if(localStorage.getItem("name") && localStorage.getItem("email")){
        window.location.href= base_url+"/ads";
      }
      console.log(localStorage.getItem("is_compleate"));    
      if(localStorage.getItem("is_compleate") == '1'){
            window.location.href= base_url+"/new-for-you";
      }

$('form[name="registration"]').validate({
    rules: {     

      email: {
        required: true,
        email: true,
      },
      full_name: {
        required: true
      }
    },
    messages: {      
      email: 'Enter a valide email',
      full_name: 'Please enter full_name',
    },
    submitHandler: function(form) { 

    	$.ajax({
            "headers": {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            method: "POST",
            url: base_url + '/register_user_data',
            data: {
                name: $('#full_name').val(),
                email: $('#email').val()
            }
        })
        .done(function(msg) {
        	msg = JSON.parse(msg);
        	console.log(msg);
        	localStorage.setItem('user_id', msg.id);
            window.location.href = base_url + "/ads";
        });
      return false;    
    }    
  });
