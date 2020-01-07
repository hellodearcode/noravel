@extends("app")

@section('head_title', 'Opprett ny konto | '.getcong('site_name') )
@section('head_url', Request::url())

@section("content")
<!-- begin:header -->
    <div id="header" class="heading" style="background-image: url({{ URL::asset('assets/img/img01.jpg') }});">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1 col-sm-12">
            <div class="page-title">
              <h2>Sign up</p>
            </div>
            <ol class="breadcrumb">
              <li><a href="{{ URL::to('/') }}">Forside</a></li>
              <li class="active">Lag konto</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!-- end:header -->
<!-- begin:content -->
    <div id="content">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-md-offset-1">
            <div class="blog-container">
              <div class="blog-content" style="padding-top:0px;">
                  <div class="blog-title">
                  <h3>Opprett en gratis konto</h3>
                   
                </div>

                <div class="blog-text contact" style="margin-top: -40px;">
                  <div class="row">
                  
                  	@if(Session::has('flash_message'))
				    <div class="alert alert-success">
				    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
<span aria-hidden="true">&times;</span></button>
				        {{ Session::get('flash_message') }}
				    </div>
				@endif
                    	<div class="message">
												<!--{!! Html::ul($errors->all(), array('class'=>'alert alert-danger errors')) !!}-->
							                    	@if (count($errors) > 0)
											    <div class="alert alert-danger">
											    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span></button>
											        <ul>
											            @foreach ($errors->all() as $error)
											                <li>{{ $error }}</li>
											            @endforeach
											        </ul>
											    </div>
											@endif
							                    	
							                    </div>
                    <div class="col-md-8 col-sm-7">
                      {!! Form::open(array('url' => 'register','class'=>'','id'=>'registerform','role'=>'form')) !!}
                         <div class="form-group">
                            <label for="email">Navn</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder="Enter name">
                        </div>
                        <div class="form-group">
                            <label for="email">Epost</label>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="password">Passord</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
                        </div>
                        
                        <div class="form-group">
                            <label for="password_confirmation">Bekreft passord</label>
                            <input type="password" class="form-control" name="password_confirmation" id="password_confirmation" placeholder="Confirm Password">
                        </div>
                         <div class="form-group">
                            <label for="email">Telefonnummer</label>
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="Enter Mobile No">
                        </div>
                        <div class="form-group">
		                     
		                    <label for="usertype">Sted</label>
		                     
		                        <select name="city" id="basic" class="selectpicker show-tick form-control" data-live-search="true">
										@foreach($city_list as $city)  
										<option value="{{$city->city_name}}">{{$city->city_name}}</option>
										
										@endforeach
										  
								</select>
		                     
                		</div>
                        <div class="form-group">
		                     
		                    <label for="usertype">Profile Type</label>
		                     
		                        <select name="usertype" id="basic" class="selectpicker show-tick form-control" data-live-search="true">
										  
										<option value="Owner">Boligeier</option>
										<option value="Agents">Megler</option>
										<option value="Builder">Entreprenør</option>
										 	 
										 
										 
								</select>
		                     
                		</div> 
                         
                        <div class="form-group checkbox">                            
                              <p>Har du allerede bruker? <a href="{{ URL::to('login') }}">Logg inn her.</a></p>
                                
                             
                        </div>
                    
                     
                        <div class="form-group">
                          <button type="submit" name="submit" class="btn btn-warning"><i class="fa fa-lock"></i> Lag brukerkonto</button>
                        </div>
                      {!! Form::close() !!} <br>
                    </div>
                   
                  </div>
                </div>


               		 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end:content -->
 
@endsection
