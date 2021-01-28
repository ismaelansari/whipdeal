@php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
@endphp
@extends('admin.layouts.app')
@section('content')
	<div class="main-body">
		<div class="inner-body">
			<div class="top-trip clearfix">
				<h2>Our Vision</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					@if($message = Session::get('message'))
					<div class="alert @if(Session::get('message')) alert-success @else alert-danger @endif">
						<ul>
							<li>{{ $message }}</li>
						</ul>
					</div>
				@endif
				</div>
					<!--start-->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="add-driver clear-col">
							<form method="POST" enctype="multipart/form-data" action="{{ route('landing.update') }}">
								@csrf
								{{ method_field('PUT') }}
								<input type="hidden" name="order" value="1"/>
								<input type="hidden" name="section" value="our_vision" />
								<div class="input-form ">
									<div class="form-group">
										<textarea placeholder="Conent..." class="form-control" rows="7" name="title">{{ old('title') ?? $sectionData->title }}</textarea>
										@error('title')
											<span class="invalid-feedback" role="alert">
												<strong style="color: red">{{ $message }}</strong>
											</span>
										@enderror
									</div>
								</div>
								<div class="buttons">
									<button type="submit" class="same-btn1">Update</button>
								</div>
							</form>
						</div>
					</div><!--end-->
			</div>
		</div>
	</div>
@endsection