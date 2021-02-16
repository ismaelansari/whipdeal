<div class="left-wrapper">
	<div class="left-block">
		<button class="close-menu">
			<i class="fa fa-times"></i>
		</button>
		<div class="left-block-body">
			<nav>
				<div class="nav-logo">
					<a href="<?php echo e(route('dashboard')); ?>">
						<img src="<?php echo e(asset("public/landing")); ?>/images/logo.png" class="logo" title="Whipdeal" width="70px">
						<img src="<?php echo e(asset("public/landing")); ?>/images/m-logo.png" title="Whipdeal" class="logo-icon">
					</a>
				</div>
				<div class="navlink">
					<ul>
						<li class="parent">
							<a class="<?php if((substr(strrchr(url()->current(),"/"),0)=='page')): ?><?php echo e('active'); ?><?php endif; ?>" href="javascript-void:(0)"><i class="fa fa-cubes"></i> <span>Advertisment portal</span> </a>
							<ul class="submenu">
								<li>
									<a class="<?php if((substr(strrchr(url()->current(),"/"),0)=='page')): ?><?php echo e('active'); ?><?php endif; ?>" href="<?php echo e(route('landing.onlineMarketing')); ?>"> 
										<i class="fa fa-bullhorn"></i>
										<span>Ads listing</span>
									</a>
								</li>								
							</ul>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
</div><?php /**PATH /var/www/html/whipdeal/resources/views/admin/layouts/sidebar.blade.php ENDPATH**/ ?>