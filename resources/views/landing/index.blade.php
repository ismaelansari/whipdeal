@extends('landing.layouts.app')
@section('content')
    <section class="login-signup">
        <div class="container-fluid">
            <div class="row">
                <!--img-->
                <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
                    <div class="bg-txt">
                        <div class="txt">
                            <h1>Register..!! <span>Wheapdeal</span></h1>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been took a galley of type and scrambled it to make a type specimen ,</p>
                        </div>
                    </div>
                </div> <!--end-->
                
                <!--form-->
                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                    <div class="form-wrapper">
                        <div class="ls-form-wrapper">
                            <form action="javascript:void(0)" method="post" name="registration">
                                <div class="ls-form">
                                    <div class="logo">
                                        <a href="javascript:void(0);">
                                            <img src="{{asset('public/frontend')}}/images/logo.png" alt="logo">
                                        </a>
                                    </div>
            
                                    <div class="heading">
                                        <h2>Discover Resources</h2>
                                    </div>
                                    <div class="input-fields">
                                        <div class="form-group">
                                            <input type="text" placeholder="Full Name" name="full_name" id="full_name">
                                        </div>
                                        <div class="form-group">
                                            <input type="email" placeholder="Email" name="email" id="email">
                                        </div>
                                    </div>
        
                                    <div class="button">
                                        <button type="submit" class="cbtn1 btn1">Start Now</button>
                                    </div>
        
                                </div>
                            </form>
                        </div>

                    </div>
                </div><!--end-->
            </div>
        </div>
    </section>
    @endsection