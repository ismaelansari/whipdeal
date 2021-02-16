<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\LandingPage;
use DB;

class HomeController extends Controller{
    public function index(){
        $sectionData    = LandingPage::where('section','online_ads')->orderBy('position','desc')->get();
        $section        = 'online_Ads';        
        return view('admin.landingPage.services',compact('sectionData','section'));
    }
}
