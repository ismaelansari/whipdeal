@php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
@endphp
@extends('admin.layouts.app')
@section('content')
	<div class="main-body">
        <div class="inner-body">
            <div class="driver-data-table">
                <div class="top-trip clearfix">
                    <h2>
                    <span>{{ ucFirst(str_replace('_',' ',$section))}}</span>                
                </h2>
                <a href="{{route('landing.create',['section'=>$section])}}">
                        <button type="button" class="same-btn1"> Add More</button>
                    </a>
                </div>
                <div class="data-table">
                    <div class="table-fbutton clearfix">
                    </div>
                    <div class="table-responsive">
                        <table id="laravel_datatable" class="table" >
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Profile Image</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Url.</th>                                    
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $i = 0;
                                @endphp
                                @foreach($sectionData as $s)
                                    <tr>
                                        <td>{{++$i}}</td>
                                        <td><img src="{{$s->image}}" width="50px" height="50px"></td>
                                        <td>{{$s->title}}</td>
                                        <td>{{$s->description}}</td>
                                        <td width='30px'>{{$s->url}}</td>
                                        <td>
                                            @if($s->active_status == 1)
                                                <label class="switch"><input type="checkbox" checked="" class="active-status-change" value="1" ads_id="{{$s->id}}"><span class="slider round"></span></label>
                                            @else
                                                <label class="switch"><input type="checkbox" class="active-status-change" value="0" ads_id="{{$s->id}}"><span class="slider round"></span></label>
                                            @endif

                                            <div class="btns"><a href=""><button class="eye"><i class="fa fa-eye"></i></button></a></div>

                                            <div class="btns"><a href="{{url('admin/landing/page/edit/'.encrypt($s->id))}}"><button class="pen"><i class="fa fa-pencil"></i></button></a></div>

                                            <div class="btns"><a href="http://dev.codemeg.com/fairride/admin/user/show/10"><button class="pen"><i class="fa fa-trash"></i></button></a></div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('js')
 <script>
     $('#laravel_datatable').DataTable({});
        $('body').on('click','.active-status-change', function() {
        var ads_id = $(this).attr("ads_id");
        //status=$('.active-status-change').val();
        status=$(this).closest('tr').find('.active-status-change').val();

        if(status==0){
            var success_status='Activate';
        }else{
            var success_status='Deactivate';
        }
        path='admin/ads/active_status_change/';

        $.ajax({
            "headers":{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            },
            'type':'PUT',
            'url' :  base_url + '/' +path,
            'data' : {  id : ads_id, status:status },
            'beforeSend': function() {

            },
            'success' : function(response){
            if(response.status == 'success'){
                swal(success_status ,response.message, 'success')
                $('.active-status-change').val(response.data.active_status);
                    if(status==1){
                        $(this).closest('tr').find('.active-status-change').prop('checked', false);
                    }else{
                        $(this).closest('tr').find('.active-status-change').prop('checked', true);
                    }
                }
            },
            'error' :  function(errors){
                console.log(errors);
            },
            'complete': function() {

            }
        });
    });
 </script>
@endpush