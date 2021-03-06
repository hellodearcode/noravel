<?php

namespace App\Http\Controllers;

use App\User;
 
 

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class AgentsController extends Controller
{
	 

    public function index()
    {  
		$agents = User::where('usertype','Agents')->orderBy('id', 'desc')->paginate(9);;
		 		   
        return view('pages.agents',compact('agents'));
    }
    
    public function builder_list()
    {  
		$agents = User::where('usertype','Builder')->orderBy('id', 'desc')->paginate(9);;
		 		   
        return view('pages.builders',compact('agents'));
    }
    
      
}
