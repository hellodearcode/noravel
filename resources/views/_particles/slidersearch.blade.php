<style type="text/css">
  /*custom header style */
  div#header{
    background: url('./upload/slides/top-bg.jpg');
    background-position: bottom !important;
    background-repeat: no-repeat !important;
    background-size: contain !important;
  }
  
  .search_hdc input[type=search]{
    font-size: 18px;
    display:inline;
    width:85%;
    padding: 25px;
  }
  .search_hdc button{
    margin-top: -5px;
    padding: 11px;
  }

  .search_hdc{
    margin-top: 10vh;
  }

</style>
<!-- begin:header -->
    <div id="header" class="header-slide">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="quick-search">
              <!-- Custom Search -->
              <div class="row">
                <div class="col-sm-9 col-sm-push-2">
                  {!! Form::open(array('method'=> 'get','url' => array('search/'),'name'=>'search_form','autocomplete'=>'off','id'=>'search_form','role'=>'form')) !!}   
                  <div class="form-group search_hdc">
                    <input type="search" name="keyword" class="form-control" placeholder="eiendom for salg">
                    <button type="submit" class="btn btn-primary">
                      <i class="fa fa-search fa-2x"></i>
                    </button>
                  </div>
                  {!! Form::close() !!} 
                </div>
              </div>
              <!-- Custom search  -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end:header -->
    <div class="container">
      <div class="row">
      @foreach($advertises as $i => $advertise)
        <div class="col-md-12 text-center" style="margin-top: 15px;margin-bottom:15px">
          <img src="{{ URL::asset('upload/advertises/'.$advertise->image_name.'.jpg') }}"/>
        </div>
      @endforeach
      </div>
    </div>
