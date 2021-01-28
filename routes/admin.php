<?php
Auth::routes();
Route::group(['middleware' => ['auth']], function () {

	Route::get('/admin/dashboard', 'Admin\HomeController@index')->name('dashboard');
	Route::get('/admin/profile' , 'Admin\ProfileController@show')->name('profile');
	Route::put('/admin/update' , 'Admin\ProfileController@update')->name('admin_profile_update');
	Route::put('/admin/update' , 'Admin\ProfileController@update')->name('admin_profile_update');
	Route::put('/admin/update_password' , 'Admin\ProfileController@updatePassword')->name('admin_update_password');
	Route::put('/admin/update_profile_image' , 'Admin\ProfileController@updateProfileImage')->name('update_profile_image');

});
?>