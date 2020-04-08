@extends("app")
@section("content")

@include("_particles.slidersearch")

<!-- begin:content -->
    <div id="content">
      <div class="container">
        <!-- begin:latest -->
        <div class="row">
          <div class="col-md-12">
            <div class="heading-title">
              <h2>UTVALGTE BOLIGER</h2>
            </div>
          </div>
        </div>
        <div class="row">
         @foreach($propertieslist as $i => $property)
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
        <!-- end:latest -->

        
      </div>
    </div>
    <!-- end:content 
    
    @_include("_particles.testimonials")
    
    @_include("_particles.partners")
	  -->
	@include("_particles.subscribe")
	  
	
 
@endsection
