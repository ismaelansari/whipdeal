@extends('landing.layouts.app')
@section('content')

    <!--banner-->
    <section class="banner" style="background-image: url('{{asset('public/landing')}}/images/b3.jpg');">
        <div class="overlay"></div>
        <div class="text">
            <div class="container">
                <h1>Development</h1>
                <h2>ALMOTELQ</h2>
            </div>
        </div>
    </section>
    <!--end-->

    @foreach($data as $key => $value)
        <!--start-->
        <section class="our-vision section-padding bg-color2">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 col-md-6">
                        <div class="img">
                            <img src="{{$value->image}}" alt="{{$value->title}}" class="img-fluid">
                        </div>
                    </div>
                    
                    <div class="col-lg-7 col-md-6">
                        <div class="txt">
                            <div class="heading">
                                <h2>{{$value->title}}</h2>
                                <h3>{{$value->sub_title}}</h3>
                            </div>
                            <p>{{$value->description}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--end-->
    @endforeach
@endsection
