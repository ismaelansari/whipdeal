<!DOCTYPE html>
<html>
 <?php echo $__env->make('admin.layouts.auth_head', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<body>
	<section class="login-page clearfix">
		<div class="left-bg">
			<div class="overlay"></div>
		</div>
		<div class="right-bg">
		</div>
		<div class="input-box">
			<div class="logo">
				<a>
					<img src="<?php echo e(asset("public/landing")); ?>/images/logo.png">
				</a>
			</div>
			<div class="dev">
				<?php $__env->startSection('content'); ?><?php echo $__env->yieldSection(); ?>
			</div>
		</div>
	</section>
<?php echo $__env->make('admin.layouts.auth_foot', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</body>
</html><?php /**PATH /var/www/html/whipdeal/resources/views/admin/layouts/auth_app.blade.php ENDPATH**/ ?>