<?php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
?>

<?php $__env->startSection('content'); ?>
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
                                <?php
                                    $i = 0;
                                ?>
                                <?php $__currentLoopData = $sectionData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $s): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e(++$i); ?></td>
                                        <td><img src="<?php echo e($s->image); ?>" width="50px" height="50px"></td>
                                        <td><?php echo e($s->title); ?></td>
                                        <td><?php echo e($s->description); ?></td>
                                        <td width='30px'><?php echo e($s->url); ?></td>
                                        <td>
                                            <?php if($s->active_status == 1): ?>
                                                <label class="switch"><input type="checkbox" checked="" class="active-status-change" value="1" ads_id="<?php echo e($s->id); ?>"><span class="slider round"></span></label>
                                            <?php else: ?>
                                                <label class="switch"><input type="checkbox" class="active-status-change" value="0" ads_id="<?php echo e($s->id); ?>"><span class="slider round"></span></label>
                                            <?php endif; ?>

                                            <div class="btns"><a href=""><button class="eye"><i class="fa fa-eye"></i></button></a></div>

                                            <div class="btns"><a href="<?php echo e(url('admin/landing/page/edit/'.encrypt($s->id))); ?>"><button class="pen"><i class="fa fa-pencil"></i></button></a></div>

                                            <div class="btns"><a href="http://dev.codemeg.com/fairride/admin/user/show/10"><button class="pen"><i class="fa fa-trash"></i></button></a></div>
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

<?php $__env->stopSection(); ?>
<?php $__env->startPush('js'); ?>
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
<?php $__env->stopPush(); ?>
<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/landingPage/services.blade.php ENDPATH**/ ?>