
<script type="text/javascript" src="<?php echo e(asset('public/admin_assets')); ?>/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="<?php echo e(asset('public/admin_assets')); ?>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
<!--data table-->



<script type="text/javascript">
	window.setTimeout(function() {
		$(".alert").fadeTo(500, 0).slideUp(500, function(){
			$(this).remove(); 
		});
    }, 3000);
</script>

<script type="text/javascript">
	var base_url = "<?php echo e(url('/')); ?>";
</script>
<?php if(!empty($data['js'])): ?>
	<?php $__currentLoopData = $data['js']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $js): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>		
		<script type="text/javascript" src="<?php echo e(URL::asset('public/admin_assets/pages')); ?>/<?php echo e($js); ?>"></script>
	<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/layouts/foot.blade.php ENDPATH**/ ?>