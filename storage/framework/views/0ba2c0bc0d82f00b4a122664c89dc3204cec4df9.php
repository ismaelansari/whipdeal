<?php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
?>

<?php $__env->startSection('content'); ?>
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
                    <span><?php echo e(ucFirst(str_replace('_',' ',$section))); ?></span>                
                </h2>
                <a href="<?php echo e(route('landing.create',['section'=>$section])); ?>">
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
                                    <th>Position</th>
                                    <th>Is Internal Post</th>
                                    <th>Status</th>
                                    <th>View</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                            </thead>
                            <tbody>
                                <?php
                                    $i = 0;
                                ?>
                                <?php $__currentLoopData = $sectionData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $s): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr row_id="<?php echo e($s->id); ?>">                                        
                                        <td><img src="<?php echo e($s->image); ?>" width="50px" height="50px"></td>
                                        <td><?php echo e($s->title); ?></td>                                        
                                        <td><?php echo e($s->position); ?></td>
                                        <td width='30px'><?php echo e($s->is_internal_post?'Yes':'No'); ?></td>
                                        <td>
                                            <?php if($s->active_status == 1): ?>
                                                <label class="switch"><input type="checkbox" checked="" class="active-status-change" value="1" ads_id="<?php echo e($s->id); ?>"><span class="slider round"></span></label>
                                            <?php else: ?>
                                                <label class="switch"><input type="checkbox" class="active-status-change" value="0" ads_id="<?php echo e($s->id); ?>"><span class="slider round"></span></label>
                                            <?php endif; ?>
                                            </td>
                                            <td>
                                            <div class="btns" data_view="<?php echo e($s->id); ?>"><button class="eye"><i class="fa fa-eye"></i></button></div>
                                            </td>
                                            <td>
                                            <div class="btns"><a href="<?php echo e(url('admin/landing/page/edit/'.encrypt($s->id))); ?>"><button class="pen"><i class="fa fa-pencil"></i></button></a></div>
                                            </td>
                                            <td>
                                            <div class="btns" data_delete="<?php echo e($s->id); ?>"><button class="pen"><i class="fa fa-trash"></i></button></div>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="details" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Ads details</h4>
        </div>
        <div class="modal-body">
          <table border="1" align="center"  class="table">
            <tr>
                <td>Ads Image</td>
                <td ads_image></td>
            </tr>
            <tr>
                <td>Title</td>
                <td title></td>
            </tr>
            <tr>
                <td>Description</td>
                <td description></td>
            </tr>
            <tr>
                <td>Url</td>
                <td url></td>
            </tr>
            <tr>
                <td>Is Internal Post</td>
                <td is_internal_post></td>
            </tr>
            <tr>
                <td>position</td>
                <td position></td>
            </tr>
            <tr>
                <td>Status</td>
                <td status></td>
            </tr>
          </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
</div>

<?php $__env->stopSection(); ?>
<?php $__env->startPush('js'); ?>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

 <script>
     $('#laravel_datatable').DataTable({
        "order": [[ 2, "asc" ]]
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




$('[data_view]').click(function(){
    var ads_id =  $(this).attr('data_view');
    $.ajax({
            "headers":{
                'X-CSRF-TOKEN':$('meta[name="csrf-token"]').attr('content')
            },
            'type':'Post',
            'url' :  base_url + '/getAdsDetails',
            'data' : {  id : ads_id },
            'beforeSend': function() {

            },
            'success' : function(response){
                if(response.status == 'success'){
                    console.log(response);
                    $('[title]').text('');
                    $('[title]').text(response.data.title);
                    
                    $('[description]').text('');
                    $('[description]').text(response.data.description);

                    $('[url]').text('');
                    $('[url]').text(response.data.url);

                    $('[ads_image]').html('');
                    $('[ads_image]').html('<img src="'+response.data.image+' " width="100px" height="100px">'); 

                    $('[position]').html('');
                    $('[position]').html(response.data.position);

                    $('[status]').html('');
                    if(response.data.active_status == 1){
                        $('[status]').html("Active");
                    }else{
                        $('[status]').html("Deactivate");
                    }

                    $('[is_internal_post]').html('');
                    if(response.data.is_internal_post == 1){
                        $('[is_internal_post]').html("Yes");
                    }else{
                        $('[is_internal_post]').html("No");
                    }                

                    $('#details').modal('show');
                }
            },
            'error' :  function(errors){
                console.log(errors);
            },
            'complete': function() {

            }
        });  
});


$(document).ready(function () {

     $('#laravel_datatable tbody').addClass("DragMe");

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
<?php $__env->stopPush(); ?>
<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/landingPage/services.blade.php ENDPATH**/ ?>