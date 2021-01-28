@extends('admin.layouts.app')
@section('content')
    <div class="main-body">
        <div class="inner-body">
            <div class="add-driver">
                    @if($message = Session::get('message'))
                        <div class="alert @if(Session::get('status')) alert-success @else alert-danger @endif">
                            <ul>
                                <li>{{ Session::get('message') }}</li>
                            </ul>
                        </div>
                    @endif
                    <div class="site-design-list">
                        <div class="row">
                            <!--heading-->
                            <div class="col-nd-12">
                                <div class="heading">
                                    <h2>Home Page</h2>
                                </div>
                            </div><!--end-->

                            <!--single-box-->
                            <div class="col-nd-12">
                                <div class="single-box">
                                    <h2>Home Top Slider</h2>
                                    <a href="{{route('landing.homeTopSlider')}}"><button class="edit-btn"> <i class="fa fa-pencil"></i> Edit</button></a>
                                </div>
                            </div><!--end-->
                            <!--single-box-->
                            <div class="col-nd-12">
                                <div class="single-box">
                                    <h2>Special Feature</h2>
                                    <a  href="{{route('landing.specialFeature')}}"><button class="edit-btn"> <i class="fa fa-pencil"></i> Edit</button></a>
                                </div>
                            </div><!--end-->
                            <!--single-box-->
                            <div class="col-nd-12">
                                <div class="single-box">
                                    <h2>Our Vision</h2>
                                    <a  href="{{route('landing.ourVision')}}"><button class="edit-btn"> <i class="fa fa-pencil"></i> Edit</button></a>
                                </div>
                            </div><!--end-->
                            <!--single-box-->
                            <div class="col-nd-12">
                                <div class="single-box">
                                    <h2>Portfolio</h2>
                                   <a href="{{route('landing.portfolio')}}"><button class="edit-btn"> <i class="fa fa-pencil"></i> Edit</button></a>
                                </div>
                            </div><!--end-->
                        </div>
                    </div>

            </div>
        </div>
    </div>
@endsection