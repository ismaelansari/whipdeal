<!DOCTYPE html>
<html>
  <?php echo $__env->make('landing.layouts.head', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<head>
 
</head>

<body>
    <!--header-->
    <header>
        <?php echo $__env->make('landing.layouts.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </header>
    <!--end-->
     
    <?php $__env->startSection('content'); ?><?php echo $__env->yieldSection(); ?>

    <!--footer-->
    <footer>
        <?php echo $__env->make('landing.layouts.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </footer>
    <!--end-->

    <!--script-->
    <?php echo $__env->make('landing.layouts.foot', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</body>

</html><?php /**PATH /var/www/html/whipdeal/resources/views/landing/layouts/app.blade.php ENDPATH**/ ?>