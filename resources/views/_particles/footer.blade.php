<!-- begin:footer -->
<div class="container-fluid" style="padding: 0px;margin: 15px auto;">
  <center><img src="{{ URL::asset('upload/slides/bottom-bg.png') }}" alt="" width="100%"></center>
</div>

<div id="footer">
  <div class="container">
   <div class="row">
    <div class="col-md-4 col-sm-4">
      <img src="{{ URL::asset('upload/'.getcong('site_logo')) }}" alt="logo" width="160px">
      <br><br>
      <a href="mailto:post@eiendomforsalg.no" class="hide-on-mobile">post@eiendomforsalg.no</a>
    </div>
    <div class="col-md-4 col-sm-4 text-center hide-on-mobile">
      <img src="{{ URL::asset('upload/slides/footer-round-icon-143px.png') }}" alt="" width="96px">
    </div>
    <div class="col-md-4 col-sm-4">
      <ul>
        <li class="{{classActivePathPublic('properties')}}"><a href="{{ URL::to('properties/') }}">Alle eiendommer</a></li>
        <li class="{{classActivePathPublic('featured')}}"><a href="{{ URL::to('featured/') }}">Utvalgte  eiendommer</a></li>
        <li class="{{classActivePathPublic('kundeservice')}}"><a href="{{ URL::to('kundeservice/') }}">Kundeservice</a></li>
      @if(Auth::check())
        <li><a href="{{ URL::to('admin/dashboard/') }}">Dashbord</a></li>
        <li><a href="{{ URL::to('admin/profile/') }}">Profil</a></li>
        <li><a href="{{ URL::to('logout') }}">Logg ut</a></li>
      @else
        <li><a href="{{ URL::to('login') }}">Logg inn</a></li>
      @endif
      </ul>
    </div>
   </div>
   <div class="row credits">
    <div class="col-md-12 text-center">
      <p>
        <?php echo date("Y"); ?> &copy; <a href="{{ URL::to('/') }}">Eiendomforsalg.no</a> AS - Med enerett.
      </p>
    </div>
   </div>
  </div>
</div>
<!-- end:footer -->
