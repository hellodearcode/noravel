@extends("app")

@section('head_title', 'Utvalgte eiendommer | '.getcong('site_name') )
@section('head_url', Request::url())

@section("content")

 <!-- begin:header -->
    <div id="header" class="heading" style="background-image: url({{ URL::asset('assets/img/img01.jpg') }});">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1 col-sm-12">
            <div class="page-title">
              <h2>{{$type}} Properties</h2>
            </div>
            <ol class="breadcrumb">
              <li><a href="{{ URL::to('/') }}">Forside</a></li> 
              <li class="active">{{$type}} Eiendommer</li>
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
          <!-- begin:article -->
          <div class="col-md-9 col-md-push-3">
           
            <!-- begin:product -->
            <div class="row container-realestate">
           	  @foreach($properties as $i => $property) 	
                <div class="col-md-3 col-sm-6 col-xs-12">
            <a href="{{URL::to('properties/'.$property->property_slug)}}">
              <div class="property-container">
                <div class="property-image">
                    <div class="property-features">
                      <span><i class="fa fa-home"></i> {{$property->area}}</span>
                      <span><i class="fa fa-hdd-o"></i> {{$property->bedrooms}}</span>
                      <span><i class="fa fa-male"></i> {{$property->bathrooms}}</span>
                    </div>
                  <img src="{{ URL::asset('upload/properties/'.$property->featured_image.'-s.jpg') }}" alt="{{ $property->property_name }}">
                  <div class="property-status">
                    <span>For {{$property->property_purpose}}</span>
                  </div>
                </div>
                
                <div class="property-content">
                    <strong>{{ Str::limit($property->property_name,35) }}</strong><br>
                    <small>{{ Str::limit($property->address,40) }}</small>
                </div>
                <div class="property-price">
                    <p class="pull-left">{{ getPropertyTypeName($property->property_type)->types }}</p>
                    <p class="pull-right">{{getcong('currency_sign')}}@if($property->sale_price) {{$property->sale_price}} @else {{$property->rent_price}} @endif</p>
                    <div class="clearfix"></div>
                  </div>
              </div>
            </a>
          </div>
          <!-- break -->
           	  @endforeach
           	  
              
            </div>
            <!-- end:product -->

            <!-- begin:pagination -->
            @include('_particles.pagination', ['paginator' => $properties])             
            <!-- end:pagination -->
          </div>
          <!-- end:article -->

          <!-- begin:sidebar -->
          @include('_particles.sidebar')
          <!-- end:sidebar -->
          
        </div>
      </div>
    </div>
    <!-- end:content -->
 
@endsection
