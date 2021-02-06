
<!--script-->
<script type="text/javascript" src="<?php echo e(asset('public/frontend')); ?>/js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo e(asset('public/frontend')); ?>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo e(asset('public/frontend')); ?>/js/custom.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
<script type="text/javascript">
	var base_url = "<?php echo e(url('/')); ?>";
</script>
<?php if(!empty($data['js'])): ?>
	<?php $__currentLoopData = $data['js']; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $js): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>		
		<script type="text/javascript" src="<?php echo e(URL::asset('public/frontend/js')); ?>/<?php echo e($js); ?>"></script>
	<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php endif; ?>
</body>
</html><?php /**PATH /var/www/html/whipdeal/resources/views/landing/layouts/foot.blade.php ENDPATH**/ ?>