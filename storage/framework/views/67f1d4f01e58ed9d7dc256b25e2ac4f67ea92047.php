<!DOCTYPE html>
<html>
 <?php echo $__env->make('admin.layouts.head', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
 <?php echo $__env->yieldPushContent('css'); ?>
<body>
	<main class="clearfix">
		 <?php echo $__env->make('admin.layouts.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		<div class="right-block">
			<div class="Navoverlay"></div>
			<div class="right-block-body">
				<?php echo $__env->make('admin.layouts.header', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
				<!------right block body-->
				<div class="dev">
					<?php $__env->startSection('content'); ?><?php echo $__env->yieldSection(); ?>
				</div>
			</div>
			<!---footer--->
			<?php echo $__env->make('admin.layouts.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
		</div>
	</main>
<!--script-->
<?php echo $__env->make('admin.layouts.foot', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
<?php echo $__env->yieldPushContent('js'); ?>
</body>
</html><?php /**PATH /var/www/html/whipdeal/resources/views/admin/layouts/app.blade.php ENDPATH**/ ?>