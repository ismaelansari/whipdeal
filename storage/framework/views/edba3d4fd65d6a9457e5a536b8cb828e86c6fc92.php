<div class="top-nav">
	<div class="nav-item clearfix">
		<div class="left-item">
			<button class="toggle-btn"><i class="fa fa-bars"></i></button>
		</div>
		<div class="right-item">
			
			<div class="user-profile">
				<a href="<?php echo e(route('logout')); ?>" onclick="event.preventDefault();
				document.getElementById('logout-form').submit();">
				<button><i class="fa fa-sign-out"></i></button>
				</a>
				<form id="logout-form" action="<?php echo e(route('logout')); ?>" method="POST" style="display: none;">
				<?php echo csrf_field(); ?>
				</form>
			</div>

			<div class="user-profile">
				<a href="<?php echo e(route('profile')); ?>">
					<button><i class="fa fa-user"></i></button>
				</a>
				
			</div>

		</div>
	</div>
	<div class="title-btn clearfix">
		
		
		
		
		
		

		
		<!-- <a class="back-btn" href="driver.html"><button>Back To Listing</button></a> -->
	</div>
</div><?php /**PATH /var/www/html/whipdeal/resources/views/admin/layouts/header.blade.php ENDPATH**/ ?>