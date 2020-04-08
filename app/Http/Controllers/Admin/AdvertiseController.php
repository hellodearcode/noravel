<?php

namespace App\Http\Controllers\Admin;

use Auth;
use App\User;
use App\Advertise;

use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Http\Request;
use Session;
use Intervention\Image\Facades\Image; 
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AdvertiseController extends MainAdminController
{
	public function __construct()
    {
		 $this->middleware('auth');	
		
		 parent::__construct();
         
    }
    public function advertiselist()
    {  
    	$alladvertise = Advertise::orderBy('id')->get();
		  
        return view('admin.pages.advertise',compact('alladvertise'));
    } 
	
	 public function addeditAdvertise()    { 
        
        if(Auth::User()->usertype!="Admin"){

            \Session::flash('flash_message', 'Access denied!');

            return redirect('admin/dashboard');
            
        }
          
        return view('admin.pages.addeditadvertise');
    }
    
    public function addnew(Request $request)
    { 
    	
    	$data =  \Request::except(array('_token')) ;
	    
	    $inputs = $request->all();
	    
	    $rule=array(
                'name' => 'required',
		        'image_name' => 'mimes:jpg,jpeg,gif,png' 
		   		 );
	    
	   	 $validator = \Validator::make($data,$rule);
 
        if ($validator->fails())
        {
                return redirect()->back()->withErrors($validator->messages());
        } 
	      
		if(!empty($inputs['id'])){
           
            $advertise = Advertise::findOrFail($inputs['id']);

        }else{

            $advertise = new Advertise;

        }
		
		 
		//Slide image
		$advertise_image = $request->file('image_name');
		 
        if($advertise_image){
            
            \File::delete(public_path() .'/upload/advertises/'.$advertise->image_name.'.jpg');
		   
            
            $tmpFilePath = 'upload/advertises/';

            $hardPath =  Str::slug($inputs['name'], '-').'-'.md5(time());
			
            $img = Image::make($advertise_image);

            $img->save($tmpFilePath.$hardPath.'.jpg');
             
            $advertise->image_name = $hardPath;
             
        }
		 
		 
        $advertise->name = $inputs['name'];	
        if(isset($inputs['status'])){
            $advertise->status = '1';	
        }else{
            $advertise->status = '0';
        }	 
		  
		 
	    $advertise->save();
		
		if(!empty($inputs['id'])){

            \Session::flash('flash_message', 'Changes Saved');

            return \Redirect::back();
        }else{

            \Session::flash('flash_message', 'Added');

            return \Redirect::back();

        }		     
        
         
    }     
    
    public function editadvertise($id)    
    {     
    	  if(Auth::User()->usertype!="Admin"){

            \Session::flash('flash_message', 'Access denied!');

            return redirect('admin/dashboard');
            
        }		
    		     
          $advertise = Advertise::findOrFail($id);
           
          return view('admin.pages.addeditadvertise',compact('advertise'));
        
    }	 
    
    public function delete($id)
    {
    	
    	if(Auth::User()->usertype!="Admin"){

            \Session::flash('flash_message', 'Access denied!');

            return redirect('admin/dashboard');
            
        }
    		
        $slide = Advertise::findOrFail($id);
        
		\File::delete(public_path() .'/upload/advertises/'.$slide->image_name.'.jpg');
		 
		$slide->delete();
		
        \Session::flash('flash_message', 'Deleted');

        return redirect()->back();

    }
      
    	
}
