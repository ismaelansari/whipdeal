@php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
@endphp
@extends('admin.layouts.app')
@section('content')
	<div class="main-body">
		<div class="inner-body portfolio">
			<div class="heading">
                <h2>
                    <span>{{ ucFirst(str_replace('_',' ',$section))}}</span>                  
                </h2>
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
                        <div class="add-driver clear-col portfolio-bg">
                            <form method="POST" enctype="multipart/form-data" action="{{ route('landing.update') }}">
                                @csrf
                                {{ method_field('PUT') }}
                                <input type="hidden" name="id" value="{{$landing->id}}"/>
                                <input type="hidden" name="section" value="{{$landing->section}}" />

                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <div class="input-form ">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input type="text" placeholder="Title" class="form-control" name="title" value="{{old('title') ?? $landing->title }}">
                                                @error('title')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red">{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>                                            
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" id="" rows="4" placeholder="Write here..." class="form-control" name="description">{{old('description') ?? $landing->description }}</textarea>
                                                @error('description')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red">{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Url</label>
                                                <input type="text" placeholder="URL" class="form-control" name="url" value="{{old('url') ?? $landing->url }}">
                                                @error('url')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red">{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                            <div class="form-group">
                                                <label>Change Image</label>
                                                <input type="file" class="form-control" name="image">
                                                @error('image')
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong style="color: red">{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12 image-wrapper">
                                            <div class="image-preview"><img src="{{$landing->image}}" width="400"/></div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="mt-3">
                                            <button type="submit" class="same-btn1">Update</button> &nbsp;
                                          <a href="{{route('landing.delete',['section'=>$landing->section,'order'=>$landing->order])}}"><button type="button" class="delete-btn"><i class="fa fa-trash"></i></button></a>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div><!--end-->
			</div>
		</div>
	</div>
@endsection
@push('js')
 <script>
        $('input[name="image"]').change(function (event) {
                tmppath = URL.createObjectURL(event.target.files[0]);
                var imagePreview = '';
                    imagePreview = '<img src="'+tmppath+'" width="400"/>';
                    $(this).parents('.image-wrapper').find('.image-preview').html(imagePreview);
        });
 </script>
@endpush