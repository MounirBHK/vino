<?php

namespace App\Http\Controllers;

use App\Models\Bouteille;
use App\Http\SAQ\SAQ;
use Illuminate\Http\Request;
use App\Models\CellierBout;

class BouteilleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return  \Illuminate\Http\jsonResponse 
     */
    public function index()
    {
        $bouteilles = Bouteille::select()->where('listed', '=', 'Y')->get();
        return response($bouteilles
        )->header('Content-range', 'bouteilles : 0-9/10');
 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return 'hello world';
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
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function show(Bouteille $bouteille)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function edit(Bouteille $bouteille)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Bouteille $bouteille)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Bouteille  $bouteille
     * @return \Illuminate\Http\Response
     */
    public function destroy(Bouteille $bouteille)
    {
        $bouteilleDansCellier = CellierBout::select()->where('id_bouteille', '=', $bouteille->id)->get();
        if(count($bouteilleDansCellier) < 1) {
            $bouteille->delete();
            return response($bouteille);
        }
        return response()->json('Impossible de supprimer la ressource: celle-ci est déjà utilisée par les utilisateurs', 405);
        
       
    }
}
