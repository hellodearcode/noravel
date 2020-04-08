<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Socialite;
use Auth;
use App\User;
class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/admin';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function redirectToProvider($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

    public function handleProviderCallback($provider)
    {
        $user = Socialite::driver($provider)->stateless()->user();
	$authUser = $this->findOrCreateUser($user, $provider);
	Auth::login($authUser);
        return redirect($this->redirectTo);
    }

	public function findOrCreateUser($user, $provider){
		$authUser = User::where('email',$user->email)->first();
		if($authUser){
			return $authUser;
		}
		return User::create([
		'name'=>$user->name,
		'email'=> $user->email,
		'provider'=> strtoupper($provider),
		'provider_id'=>$user->id
		]);
	}
}
