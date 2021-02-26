
<!DOCTYPE html>
<html>
<head>
    <title>Wheapdeal</title>
    <meta charset="UTF-8">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--css-->
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('public/frontend')); ?>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('public/frontend')); ?>/css/style.css">
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('public/frontend')); ?>/css/responsive.css">
    <!--font awesome 4-->
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('public/frontend')); ?>/fonts/fontawesome/css/all.min.css">
    <link rel="shortcut icon" href="<?php echo e(asset('public/frontend')); ?>/images/favicon.ico" type="image/x-icon">

    <?php if(Request::segment(1) == "/"): ?>
    <script type="text/javascript">    
      if(localStorage.getItem("name") && localStorage.getItem("email")){
        window.location.href= "<?php echo e(url('ads')); ?>";
      }
      console.log(localStorage.getItem("is_compleate"));    
      if(localStorage.getItem("is_compleate") == '1'){
            window.location.href= "<?php echo e(url('new-for-you')); ?>";
      }      
    </script>
    <?php elseif(Request::segment(1) == "ads"): ?>
    <script type="text/javascript">    
      if(!localStorage.getItem("name") && !localStorage.getItem("email")){
        window.location.href= "<?php echo e(url('/')); ?>";
      }
    </script>
    <?php endif; ?>
</head><?php /**PATH /var/www/html/whipdeal/resources/views/landing/layouts/head.blade.php ENDPATH**/ ?>