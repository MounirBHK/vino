<?php

namespace App\Http\Controllers;

use App\Models\Cellier;
use App\Models\Type;
use Illuminate\Http\Request;

class CellierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($userId)
    {
        $celliers = Cellier::select()->where('id_user', '=', $userId)->get();
        return $celliers;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $request->validate([
            "id_user" => 'required',
            "lib_cellier"=> 'required',
            "nbr_colonne"=> 'between:1,20',
            "nbr_ligne"=> 'between:1,20',
            "capacite"=> 'between:2,400',
        ]);

        $newCellier = new Cellier;
        // $newCellier->fill($request->all());
        $newCellier->fill([
            "id_user" => $request->id_user,
            "lib_cellier"=> $request->lib_cellier,
            "nbr_colonne"=> $request->nbr_colonne,
            "nbr_ligne"=> $request->nbr_ligne,
            "capacite"=> $request->capacite,
        ]);

        $newCellier->save();

        return $newCellier;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function show(Cellier $cellier)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function edit(Cellier $cellier)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Cellier $cellier)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Cellier  $cellier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Cellier $cellier)
    {
        //
    }
}
