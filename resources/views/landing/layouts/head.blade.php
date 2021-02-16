
<!DOCTYPE html>
<html>
<head>
    <title>Wheapdeal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--css-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/style.css">
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/responsive.css">
    <!--font awesome 4-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/fonts/fontawesome/css/all.min.css">
    <link rel="shortcut icon" href="{{asset('public/frontend')}}/images/favicon.ico" type="image/x-icon">
    <script type="text/javascript">    
      if(localStorage.getItem("credential_name") && localStorage.getItem("credential_email")){
        //window.location.href= "{{url('steps')}}";
      }
    </script>
</head>