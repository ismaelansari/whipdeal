<?php $__env->startSection('content'); ?>
	<h2>Forgot Password</h2>
		<?php if(session('status')): ?>
			<div class="alert alert-success" role="alert">
			<?php echo e(session('status')); ?>

			</div>
		<?php endif; ?>
	<form method="POST" action="<?php echo e(route('password.email')); ?>">
		 <?php echo csrf_field(); ?>
		<div class="form-group">
			<input type="email" class="form-control" placeholder="Email" name="email" value="<?php echo e(old('email')); ?>">
			<?php if ($errors->has('email')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('email'); ?>
	            <span class="invalid-feedback" role="alert">
	                <strong style="color: red"><?php echo e($message); ?></strong>
	            </span>
	        <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
		</div>
		<div class="login-btn">
			<button type="submit" class="same-btn1">Submit</button>
		</div>
	</form>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.auth_app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/auth/email.blade.php ENDPATH**/ ?>