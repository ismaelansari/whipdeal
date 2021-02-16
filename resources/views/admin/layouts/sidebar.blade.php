<div class="left-wrapper">
	<div class="left-block">
		<button class="close-menu">
			<i class="fa fa-times"></i>
		</button>
		<div class="left-block-body">
			<nav>
				<div class="nav-logo">
					<a href="{{route('dashboard')}}">
						<img src="{{asset("public/landing")}}/images/logo.png" class="logo" title="Whipdeal" width="70px">
						<img src="{{asset("public/landing")}}/images/m-logo.png" title="Whipdeal" class="logo-icon">
					</a>
				</div>
				<div class="navlink">
					<ul>
						<li class="parent">
							<a class="@if((substr(strrchr(url()->current(),"/"),0)=='page')){{'active'}}@endif" href="javascript-void:(0)"><i class="fa fa-cubes"></i> <span>Advertisment portal</span> </a>
							<ul class="submenu">
								<li>
									<a class="@if((substr(strrchr(url()->current(),"/"),0)=='page')){{'active'}}@endif" href="{{route('landing.onlineMarketing')}}"> 
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
</div>