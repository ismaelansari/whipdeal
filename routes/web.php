<?php
use App\Models\LandingPage;
use Illuminate\Http\Request;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

    Route::get('/',function(){          
      $data['js'] = array('handler.js');
      return view('landing.index',compact('data'));
    })->name('index');

    Route::post('/send/mail',function(Request $request){
        $data = array(
          'to'      => 'ismael.codemegsoft@gmail.com',
          'email'   =>  $request->email,
          'name'    =>  $request->name,
          'msg'     =>  $request->message
        );
        \Mail::send('mail.contact', $data, function ($message) use($data) {
          $message->from( $data['email'] , 'AlmotelQ' );
          $message->to($data['to'])->subject('Contact Us');
        });
        return redirect()->route('index')->with('status',true)->with('message','Thank you to cantact us,We will contact you very soon');
    })->name('send.mail');
/**
 *  Admin Route's
 */

Auth::routes();
Route::get('/admin', 'Auth\LoginController@showLoginForm')->name('admin-login');
Route::get('password/reset', 'Auth\ForgotPasswordController@showLinkRequestForm')->name('password.request');
Route::get('password/reset/{token}', 'Auth\ResetPasswordController@showResetForm')->name('password.reset');
Route::get('/home', 'HomeController@index')->name('home');


/**
 * Landing page Route's
 */

Route::group(['middleware' => ['auth','revalidate']], function () {
  Route::get('admin/landing/page/online/marketing', 'Admin\LandingPageController@onlineMarketing')->name('landing.onlineMarketing');

  Route::get('admin/landing/page/add', 'Admin\LandingPageController@create')->name('landing.create');
  Route::post('admin/landing/page/store', 'Admin\LandingPageController@store')->name('landing.store');
  Route::get('admin/landing/page/edit/{id}', 'Admin\LandingPageController@edit')->name('landing.edit');
  Route::put('admin/landing/page/update', 'Admin\LandingPageController@update')->name('landing.update');
  Route::post('delete_ads', 'Admin\LandingPageController@delete')->name('landing.delete');
  Route::post('sort_link', 'Admin\LandingPageController@sortLink');
  Route::post('getAdsDetails', 'Admin\LandingPageController@getAdsDetails');

  Route::put('admin/ads/active_status_change/', 'Admin\LandingPageController@activeStatusChange');  
  
});