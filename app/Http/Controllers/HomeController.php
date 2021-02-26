<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LandingPage;
use App\Models\UserRegister;
use App\Models\SaveLinkData;
use App\Helpers\ImageHelper;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request)
    {
       //  $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {        
        return view('landing.index',compact('data'));
    }

    public function ads(Request $request)
    {        
        $ads = LandingPage::where('active_status',1)->orderBy('position','asc')->get();        
        $data['js'] = array('step.js');
        $data['ads'] = $ads;
        return view('landing.ads',compact('data'));
    }

    public function registerUserData(Request $request){
        $inputs = $request->all();
        $UserRegister = new UserRegister;
        $UserRegister->register_user_data = json_encode($inputs);
        if($UserRegister->save()){            
            return json_encode(array('message'=>'data saved successfully','id'=>$UserRegister->id));
        }
    }

    public function saveLink(Request $request){
        $inputs = $request->all();
        $SaveLinkData = new SaveLinkData;
        $SaveLinkData->user_id = $inputs['user_id'];
        $SaveLinkData->link = $inputs['linkdata'];
        if($SaveLinkData->save()){            
            return json_encode(array('message'=>'data saved successfully','id'=>$SaveLinkData->id));
        }
        
    }

    public function sendLinkData(Request $request){
        $inputs = $request->all();
        $linkdata = $inputs['linkdata'];
        $cURLConnection = curl_init();

        curl_setopt($cURLConnection, CURLOPT_URL, $linkdata);
        curl_setopt($cURLConnection, CURLOPT_RETURNTRANSFER, true);

        $list = curl_exec($cURLConnection);
        curl_close($cURLConnection);
        error_log($list);
        $jsonArrayResponse = json_decode($list);

    }

    public function newForYou(Request $request){
        return view('landing.newforyou');
    }
   
}
