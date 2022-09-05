<?php

namespace App\Http\Controllers;

use Session;
use App\Models\Utilisateur;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\jsonResponse 
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
        Session::flush();
        Auth::logout();

        return true;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function show(Utilisateur $utilisateur)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function edit(Utilisateur $utilisateur)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Utilisateur $utilisateur)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Utilisateur  $utilisateur
     * @return \Illuminate\Http\Response
     */
    public function destroy(Utilisateur $utilisateur)
    {
        //
    }
}
