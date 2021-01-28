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
      $homeSlider = LandingPage::where('section','home_top_slider')->first();
      $specialFeature = LandingPage::where('section','special_feature')->get();
      $ourVision = LandingPage::where('section','our_vision')->first();
      $portFolio = LandingPage::where('section','portfolio')->get();
      return view('landing.index',compact('homeSlider','specialFeature','ourVision','portFolio'));
    })->name('index');

    Route::post('/send/mail',function(Request $request){
        $data = array(
          'to'      => 'shivam.codemegsoft@gmail.com',
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

    Route::get('/development',function(){
      $data = LandingPage::where('section','develop')->get();
      return view('landing.development',compact('data'));
    })->name('development');

    Route::get('/online-marketing',function(){
      $data = LandingPage::where('section','online_marketing')->get();
      return view('landing.online_marketing',compact('data'));
    })->name('online.marketing');

    Route::get('/online-service',function(){
      $data = LandingPage::where('section','online_services')->get();
      return view('landing.online_service',compact('data'));
    })->name('online.service');

    Route::get('/privacy_policy',function(){
      return view('landing.privacy_policy');
    })->name('privacy.policy');

    Route::get('/trading',function(){
      $data = LandingPage::where('section','trading')->get();
      return view('landing.trading',compact('data'));
    })->name('trading');

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
Route::get('admin/landing/page', 'Admin\LandingPageController@index')->name('landing.index');
Route::get('admin/landing/page/home/top/slider', 'Admin\LandingPageController@homeTopSlider')->name('landing.homeTopSlider');
Route::get('admin/landing/page/special/feature', 'Admin\LandingPageController@specialFeature')->name('landing.specialFeature');

Route::get('admin/landing/page/our/vision', 'Admin\LandingPageController@ourVision')->name('landing.ourVision');
Route::get('admin/landing/page/portfolio', 'Admin\LandingPageController@portfolio')->name('landing.portfolio');
Route::get('admin/landing/page/online/marketing', 'Admin\LandingPageController@onlineMarketing')->name('landing.onlineMarketing');

Route::get('admin/landing/page/add', 'Admin\LandingPageController@create')->name('landing.create');
Route::put('admin/landing/page/update', 'Admin\LandingPageController@update')->name('landing.update');
Route::get('admin/landing/page/delete', 'Admin\LandingPageController@delete')->name('landing.delete');