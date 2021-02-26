
<!DOCTYPE html>
<html>
<head>
    <title>Wheapdeal</title>
    <meta charset="UTF-8">
        <meta name="csrf-token" content="{{csrf_token()}}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--css-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/style.css">
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/css/responsive.css">
    <!--font awesome 4-->
    <link rel="stylesheet" type="text/css" href="{{asset('public/frontend')}}/fonts/fontawesome/css/all.min.css">
    <link rel="shortcut icon" href="{{asset('public/frontend')}}/images/favicon.ico" type="image/x-icon">

    @if(Request::segment(1) == "/")
    <script type="text/javascript">    
      if(localStorage.getItem("name") && localStorage.getItem("email")){
        window.location.href= "{{url('ads')}}";
      }
      console.log(localStorage.getItem("is_compleate"));    
      if(localStorage.getItem("is_compleate") == '1'){
            window.location.href= "{{url('new-for-you')}}";
      }      
    </script>
    @elseif(Request::segment(1) == "ads")
    <script type="text/javascript">    
      if(!localStorage.getItem("name") && !localStorage.getItem("email")){
        window.location.href= "{{url('/')}}";
      }
    </script>
    @endif
</head>