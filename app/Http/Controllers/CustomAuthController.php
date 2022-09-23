<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Validation\Rule;
use Auth;
use Hash;
use Session;
use Validator;
use Mail;

class CustomAuthController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * 
     *
     * @return \Illuminate\Http\jsonResponse 
     * 
     */
    public function customLogin(Request $request)
    {
        $fields = $request->validate([
            'courriel' => 'required|email',
            'motDePasse' => 'required'
        ]);

        $credentials = ['email' => $fields['courriel'], 'password' => $fields['motDePasse']];
        if(!Auth::validate($credentials)): 
            return response('Erreur de connexion: mauvais identifiants', 401);
        endif;

        $user = Auth::getProvider()->retrieveByCredentials($credentials);
        $token = $user->createToken('auth_token')->plainTextToken;
        Auth::login($user, true);
        return response()->json([
            'user' => $user,
            'access_token' => $token
        ]);
    }

    public function customLogout(){
        $user = Auth::user();
        $user->tokens()->delete();
        Session::flush();
        Auth::guard('web')->logout();

        return true;
    }

    public function customSignup(Request $request){

        $emailValidation = Validator::make(['email' => $request->email], [
            'email'                 => 'required|email|unique:users']);

        if($emailValidation->fails()) return response('Cet email est déjà utilisé', 405);

        $request->validate([
            'nom_utilisateur'       => 'required|string|min:5|max:30',
            'prenom'                => 'required|alpha|min:2|max:30',
            'nom'                   => 'required|alpha|min:2|max:30',
            'motDePasse'            => 'required',
            'motDePasse_confirme'   => 'required|same:motDePasse'
        ]);

        $user = new User;
        $user->fill([
            'name'      => $request->nom_utilisateur,
            'email'     => $request->email,
            'password'  => Hash::make($request->motDePasse),
            'prenom'    => $request->prenom,
            'nom'       => $request->nom
        ]);
        $user->save();
        return $user;
    }

    public function customUpdate(Request $request){
        $user = Auth::user();
        
        $emailValidation = Validator::make(['email' => $request->email], [
            'email'                 => [
                'required',
                Rule::unique('users')->ignore($user->id)]
            ]);

        if($emailValidation->fails()) return response('Cet email est déjà utilisé', 405);

        $request->validate([
            'nom_utilisateur'       => 'required|string|min:5|max:30',
            'prenom'                => 'required|alpha|min:2|max:30',
            'nom'                   => 'required|alpha|min:2|max:30',
        ]);

        $user->update([
            'name'      => $request->nom_utilisateur,
            'email'     => $request->email,
            'prenom'    => $request->prenom,
            'nom'       => $request->nom
        ]);
        return $user;
    }

  /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function envoiEmail()
    {
        $user = Auth::user();
        $to_name = 'Romain';
        $to_email = 'romaindepret91@gmail.com';
        $tempPassword = str::random(50);
        $user->update(['temp_password' => $tempPassword]);
        $body="<a href='http://127.0.0.1:8000/dashboard/passwordReset/" . $tempPassword . "'>Cliquez ici pour réinitialiser votre mot de passe</a>";
        Mail::send('resetPasswordEmail', $data =['name'=>$to_name,
        'body' => $body
        ],
        function($message) use ($to_name, $to_email)
        {
            $message->to($to_email, $to_name)->subject('Réinitialisation de votre mot de passe');
        });
        return $user;
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function resetPassword(Request $request)
    {
        $user = Auth::user();
        $request->validate([
            'motDePasse'                => 'required',
            'motDePasse_confirme'       => 'required|same:motDePasse',
            'tempPassword'              => 'required',
        ]);
        if($request->tempPassword !== $user->temp_password) return response('Opération non autorisée', 405);
        $user->update([
            'password'      => Hash::make($request->motDePasse),
        ]);
        return $user;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\User;  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
    }
}
