<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\LandingPage;
use DB;

class LandingPageController extends Controller{

    public function index(){        
        return view('admin.landingPage.index');
    }

    public function onlineMarketing(){
        $sectionData    = LandingPage::where('section','online_ads')->orderBy('id','desc')->get();
        $section        = 'online_Ads';
        return view('admin.landingPage.services',compact('sectionData','section'));
    }

    public function update(Request $request){
       $input = $request->all();
       $rules = [
            'title'       => 'required',
            'description'        => 'required',
            'url'               => 'required',
            //'image'           => 'required',
        ];
        $this->validate($request,$rules);

       unset($input['_method']);
       unset($input['_token']);
       unset($input['image']);
       unset($input['images']);

       /* Single Image */
       $fileName = null;
       if ($request->hasFile('image')) {
          $fileName = str_random('10').'.'.time().'.'.request()->image->getClientOriginalExtension();
          request()->image->move(public_path('landing/images/'), $fileName);
        }
        if($fileName){
            $input['image']  = $fileName;
        }
        if($request->hasFile('images')){
            $files = $request->file('images');
            foreach ($files as $file) {
                $fileName = str_random('10').'.'.time().'.'.$file->getClientOriginalExtension();
                $file->move(public_path('landing/images/'), $fileName);
                DB::table('landing_page_images')->insert([
                    'section' => $input['section'],
                    'order'   => $input['order'],
                    'image'   => $fileName
                ]);
            }
        }
       DB::table('landing_pages')->where('section',$input['section'])->where('order',$input['order'])->update($input);
       return redirect()->back()->with('status',true)->with('message','Updated Successfully');
    }

    public function create(Request $request){
        $input = $request->all();
        $insertData = [
            'section' => $input['section']
        ];
        $sectionData    = DB::table('landing_pages')->where('section',$input['section'])->orderBy('id','desc')->first();
        if($sectionData){
            $insertData['order'] = $sectionData->order + 1;
        }        
        DB::table('landing_pages')->insert($insertData);
        return redirect()->back();
        return redirect()->back()->with('status',true)->with('message','Inserted Successfully');
     }


    public function delete(Request $request){
        $input = $request->all();
        $where = [
            'section' => $input['section'],
            'order'   => $input['order']
        ];
        DB::table('landing_pages')->where($where)->delete();
        return redirect()->back()->with('status',true)->with('message','Deleted Successfully');
     }



}
