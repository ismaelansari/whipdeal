<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\LandingPage;
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
        if(!empty($ads)){
            foreach ($ads as $key => $ad) {                
                $ad->image = ImageHelper::getServiceImage($ad->image);
            }
        }
        $data['js'] = array('step.js');
        $data['ads'] = $ads;
        return view('landing.ads',compact('data'));
    }
   
}
