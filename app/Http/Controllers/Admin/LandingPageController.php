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
        $sectionData    = LandingPage::where('section','online_ads')->orderBy('position','desc')->get();
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
                    'image'   => $fileName
                ]);
            }
        }
        $input['is_internal_post'] =  $request->is_internal_post?'1':'0';
       DB::table('landing_pages')->where('id',$input['id'])->update($input);
       return redirect()->back()->with('status',true)->with('message','Updated Successfully');
    }

    public function store(Request $request){
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
                    'image'   => $fileName
                ]);
            }
        }
        $input['is_internal_post'] =  $request->is_internal_post?'1':'0';
       DB::table('landing_pages')->insert($input);
       return redirect()->back()->with('status',true)->with('message','Added Successfully');
    }

    public function create(Request $request){
        $section        = 'online_Ads';
        return view('admin.landingPage.add',compact('section'));
     }


    public function delete(Request $request){
        $input = $request->all();
        
        $where = [
            'id' => $input['id']
        ];
        DB::table('landing_pages')->where($where)->delete();
        return ['status' => 'success' , 'message' => 'Ads deleted successfully']; 
     }

     public function activeStatusChange(Request $request){
        $inputs                     = $request->all();
        $status=$inputs['status'];
        if($status=='0'){
            $change_status='1';
        }else{
            $change_status='0';
        }
        
        $User                       = LandingPage::find($inputs['id']);
        $User->active_status        = $change_status;
        if($User->update()){
            if($status==0){
                return ['status' => 'success' , 'message' => 'Ads activated successfully', 'data'=>$User];
            }else{
                return ['status' => 'success' , 'message' => 'Ads deactivated successfully', 'data'=>$User]; 
            }
        }else{
           return ['status' => 'failed' , 'message' => 'Status updated failed'];   
        }
    }

    public function edit(Request $request){
        $id                     = decrypt($request->id);
        $landing = LandingPage::where('id',$id)->first();
        $section        = 'online_edit_Ads';
        return view('admin.landingPage.edit',compact('landing', 'section'));
    }

    public function sortLink(Request $request){
        $sort_arr = $request->data;
        foreach ($sort_arr as $key => $s) {
            LandingPage::where('id', $s)->update(['position' => ($key)]);
        }
        $res = array('status'=> true , 'message' => 'Ads sorted successufully!','data'=>array());
        echo json_encode($res);
        exit;
    }

    public function getAdsDetails(Request $request){
      $id = ($request->id);
      $landing = LandingPage::where('id',$id)->first();
      return ['status' => 'success' , 'message' => 'Ads details found successfully', 'data'=>$landing];
    }

}
