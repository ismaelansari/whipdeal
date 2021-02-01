<?php $__env->startSection('content'); ?>
	<h2>Sign In</h2>
	<form method="POST" action="<?php echo e(route('login')); ?>">
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
		<div class="form-group">
			<input type="password" class="form-control" placeholder="Password" name="password">
			<?php if ($errors->has('password')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('password'); ?>
				<span class="invalid-feedback" role="alert">
					<strong style="color: red"><?php echo e($message); ?></strong>
				</span>
			<?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
		</div>
		<p class="frgt-pass">
			<a href="<?php echo e(route('password.request')); ?>"><i class="fa fa-lock"></i> Forgot Password</a>
		</p>

		<div class="login-btn">
			<button type="submit" class="same-btn1">Log in</button>
		</div>
	</form>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.auth_app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/auth/login.blade.php ENDPATH**/ ?>