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
				<h2>Special Features</h2>
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
				@foreach($sectionData as $key => $value)
					<!--start-->
					<div class="col-md-4 col-sm-6 col-xs-12">
						<div class="add-driver clear-col">
							<form method="POST" enctype="multipart/form-data" action="{{ route('landing.update') }}">
								@csrf
								{{ method_field('PUT') }}
								<input type="hidden" name="order" value="{{$value->order}}"/>
								<input type="hidden" name="section" value="special_feature" />
								<div class="input-form ">
									<div class="form-group">
										<label>Title</label>
										<input type="text" placeholder="Title" class="form-control" name="title" value="{{old('title') ?? $value->title }}">
										@error('category_name')
											<span class="invalid-feedback" role="alert">
												<strong style="color: red">{{ $message }}</strong>
											</span>
										@enderror
									</div>
									<div class="form-group">
										<label>Sub Title</label>
										<textarea placeholder="Sub Title" class="form-control" rows="4" name="sub_title">{{ old('sub_title') ?? $value->sub_title }}</textarea>
										@error('sub_title')
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
                @endforeach
			</div>
		</div>
	</div>
@endsection