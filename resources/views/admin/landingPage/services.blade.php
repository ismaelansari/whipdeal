@php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
@endphp
@extends('admin.layouts.app')
@section('content')
<style type="text/css">
.DragMe:Hover {
    cursor: move;
}
</style>
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
                                    <th>Profile Image</th>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Url.</th>
                                    <th>Position</th>
                                    <th>Is Internal Post</th>
                                    <th>Action</th>
                            </thead>
                            <tbody>
                                @php
                                    $i = 0;
                                @endphp
                                @foreach($sectionData as $s)
                                    <tr row_id="{{$s->id}}">                                        
                                        <td><img src="{{$s->image}}" width="50px" height="50px"></td>
                                        <td>{{$s->title}}</td>
                                        <td>{{$s->description}}</td>
                                        <td width='30px'>{{$s->url}}</td>
                                        <td>{{$s->position}}</td>
                                        <td width='30px'>{{$s->is_internal_post?'Yes':'No'}}</td>
                                        <td>
                                            @if($s->active_status == 1)
                                                <label class="switch"><input type="checkbox" checked="" class="active-status-change" value="1" ads_id="{{$s->id}}"><span class="slider round"></span></label>
                                            @else
                                                <label class="switch"><input type="checkbox" class="active-status-change" value="0" ads_id="{{$s->id}}"><span class="slider round"></span></label>
                                            @endif

                                            <div class="btns"><a href=""><button class="eye"><i class="fa fa-eye"></i></button></a></div>

                                            <div class="btns"><a href="{{url('admin/landing/page/edit/'.encrypt($s->id))}}"><button class="pen"><i class="fa fa-pencil"></i></button></a></div>

                                            <div class="btns" data_delete="{{$s->id}}"><button class="pen"><i class="fa fa-trash"></i></button></div>
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
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

 <script>
     $('#laravel_datatable').DataTable({
        "order": [[ 4, "asc" ]]
     });


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

$('[data_delete]').click(function(){
    var ads_id = $(this).attr('data_delete');
    swal({
    title: "Are you sure?",
    text: "You will not be able to recover this imaginary file!",
    type: "warning",
    showCancelButton: true,
    confirmButtonColor: '#DD6B55',
    confirmButtonText: 'Yes, I am sure!',
    cancelButtonText: "No, cancel it!",
    closeOnConfirm: false,
    closeOnCancel: false
 },
 function(isConfirm){

   if (isConfirm){
        
       $.ajax({
            "headers":{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            },
            'type':'Post',
            'url' :  base_url + '/delete_ads',
            'data' : {  id : ads_id },
            'beforeSend': function() {

            },
            'success' : function(response){
                if(response.status == 'success'){
                    swal(response.status ,response.message, 'success')
                    setTimeout(function(){
                        window.location.reload();
                    },1000);
                }
            },
            'error' :  function(errors){
                console.log(errors);
            },
            'complete': function() {

            }
        });  

    } else {
      swal("Cancelled", "Your record is safe :)", "error");
    }
 });

});







$(document).ready(function () {

     $('tbody').addClass("DragMe");

     $('.DragMe').sortable({
         disabled: false,
         axis: 'y',
        // items: "> tr:not(:first)",
         forceHelperSize: true,
         update: function (event, ui) {
             var Newpos = ui.item.index();
             var RefID = $('tr').find('td:first').html();


             //alert("Position " + Newpos + "..... RefID: " + RefID);
             var sortorder = [];
             $("#laravel_datatable tr").each(function () {
                 var RefID = $(this).attr('row_id');//$(this).find("td:eq(0)").html();
                 var NewPosition = $("tr").index(this);                 
                 sortorder.push(RefID)
                     console.log(RefID + " " + NewPosition);

             });

             doSortLink(sortorder);

         }
     }).disableSelection();
 });




function doSortLink(sortorder){
  console.log('sortorder == ',sortorder);
  $.ajax({
        "headers":{
        'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
           },
        'type' : 'POST',
        'url'   : base_url+'/sort_link', 
        'data' : {data : sortorder },   
        'beforeSend': function() {
         // location.reload();
        },
        'success' : function(data){  
          data = JSON.parse(data);
          if(data.status == true){                                
            notify('success',data.message); 
          }else{
            notify('error',data.message);
          }      
          console.log('data == ',data);
        },
        'error' :  function(errors){
          console.log(errors);
        },
        'complete': function(response) {           
        }
       });
}




 </script>
@endpush