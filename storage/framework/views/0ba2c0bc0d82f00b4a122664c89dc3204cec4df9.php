<?php
namespace App\Helpers;
$product_place_holder_image=ImageHelper::getProductPlaceholderImage();
use Illuminate\Support\Facades\Session;
?>

<?php $__env->startSection('content'); ?>
	<div class="main-body">
		<div class="inner-body portfolio">
			<div class="heading">
                <h2>
                    <span><?php echo e(ucFirst(str_replace('_',' ',$section))); ?></span>
                    <a href="<?php echo e(route('landing.create',['section'=>$section])); ?>">
                        <button type="button" class="same-btn1"> Add More</button>
                    </a>
                </h2>
            </div>
			<div class="row">
				<div class="col-md-12">
					<?php if($message = Session::get('message')): ?>
					<div class="alert <?php if(Session::get('message')): ?> alert-success <?php else: ?> alert-danger <?php endif; ?>">
						<ul>
							<li><?php echo e($message); ?></li>
						</ul>
					</div>
				<?php endif; ?>
				</div>
				<?php $__currentLoopData = $sectionData; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
					<!--start-->
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="add-driver clear-col portfolio-bg">
							<form method="POST" enctype="multipart/form-data" action="<?php echo e(route('landing.update')); ?>">
								<?php echo csrf_field(); ?>
								<?php echo e(method_field('PUT')); ?>

								<input type="hidden" name="order" value="<?php echo e($value->order); ?>"/>
                                <input type="hidden" name="section" value="<?php echo e($value->section); ?>" />

                                <div class="row">
                                    <div class="col-md-6 col-sm-12 col-xs-12">
                                        <div class="input-form ">
                                            <div class="form-group">
                                                <label>Title</label>
                                                <input type="text" placeholder="Title" class="form-control" name="title" value="<?php echo e(old('title') ?? $value->title); ?>">
                                                <?php if ($errors->has('title')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('title'); ?>
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red"><?php echo e($message); ?></strong>
                                                    </span>
                                                <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
                                            </div>                                            
                                            <div class="form-group">
                                                <label>Description</label>
                                                <textarea name="description" id="" rows="4" placeholder="Write here..." class="form-control" name="description"><?php echo e(old('description') ?? $value->description); ?></textarea>
                                                <?php if ($errors->has('description')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('description'); ?>
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red"><?php echo e($message); ?></strong>
                                                    </span>
                                                <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
                                            </div>
                                            <div class="form-group">
                                                <label>Url</label>
                                                <input type="text" placeholder="URL" class="form-control" name="url" value="<?php echo e(old('url') ?? $value->url); ?>">
                                                <?php if ($errors->has('url')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('url'); ?>
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong style="color: red"><?php echo e($message); ?></strong>
                                                    </span>
                                                <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
                                            </div>
                                            <div class="form-group">
                                                <label>Change Image</label>
                                                <input type="file" class="form-control" name="image">
                                                <?php if ($errors->has('image')) :
if (isset($message)) { $messageCache = $message; }
$message = $errors->first('image'); ?>
                                                    <span class="invalid-feedback" role="alert">
                                                    <strong style="color: red"><?php echo e($message); ?></strong>
                                                    </span>
                                                <?php unset($message);
if (isset($messageCache)) { $message = $messageCache; }
endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 col-xs-12 image-wrapper">
                                            <div class="image-preview"><img src="<?php echo e($value->image); ?>" width="400"/></div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="mt-3">
                                            <button type="submit" class="same-btn1">Update</button> &nbsp;
                                          <a href="<?php echo e(route('landing.delete',['section'=>$value->section,'order'=>$value->order])); ?>"><button type="button" class="delete-btn"><i class="fa fa-trash"></i></button></a>
                                        </div>
                                    </div>
                                </div>

							</form>
                        </div>
                    </div><!--end-->
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
			</div>
		</div>
	</div>
<?php $__env->stopSection(); ?>
<?php $__env->startPush('js'); ?>
 <script>
        $('input[name="image"]').change(function (event) {
                tmppath = URL.createObjectURL(event.target.files[0]);
                var imagePreview = '';
                    imagePreview = '<img src="'+tmppath+'" width="400"/>';
                    $(this).parents('.image-wrapper').find('.image-preview').html(imagePreview);
        });
 </script>
<?php $__env->stopPush(); ?>
<?php echo $__env->make('admin.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /var/www/html/whipdeal/resources/views/admin/landingPage/services.blade.php ENDPATH**/ ?>