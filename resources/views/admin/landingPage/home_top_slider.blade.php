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
				<h2>Update Home Top slider</h2>
			</div>
			<div class="add-driver clear-col">
				@if($message = Session::get('message'))
					<div class="alert @if(Session::get('message')) alert-success @else alert-danger @endif">
						<ul>
							<li>{{ $message }}</li>
						</ul>
					</div>
				@endif
				<form method="POST" enctype="multipart/form-data" action="{{ route('landing.update') }}">
					@csrf
					{{ method_field('PUT') }}
					<input type="hidden" name="section" value="home_top_slider" />
					<input hidden="hidden" name="order" value="1"/>
					<div class="input-form ">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="form-group">
									<label>Title</label>
                                    <input type="text" placeholder="Title" class="form-control" name="title" value="{{old('title') ?? $sectionData->title }}">
									@error('category_name')
										<span class="invalid-feedback" role="alert">
											<strong style="color: red">{{ $message }}</strong>
										</span>
									@enderror
                                </div>
                                <div class="form-group">
									<label>Sub Title</label>
									<input type="text" placeholder="Sub Title" class="form-control" name="sub_title" value="{{old('sub_title') ?? $sectionData->sub_title}}">
									@error('sub_title')
										<span class="invalid-feedback" role="alert">
											<strong style="color: red">{{ $message }}</strong>
										</span>
									@enderror
                                </div>
                                <div class="form-group">
									<label>Description</label>
									<input type="text" placeholder="Description" class="form-control" name="description" value="{{old('description') ?? $sectionData->description}}">
									@error('description')
										<span class="invalid-feedback" role="alert">
											<strong style="color: red">{{ $message }}</strong>
										</span>
									@enderror
								</div>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<div class="form-group">
									<label>Slider Images:</label>
											<input type="file" class="form-control" name="images" multiple>
									@error('image')
										<span class="invalid-feedback" role="alert">
										<strong style="color: red">{{ $message }}</strong>
										</span>
									@enderror
								</div>
							</div>
						</div>
					</div>
					<div class="buttons">
						<button type="submit" class="same-btn1">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection