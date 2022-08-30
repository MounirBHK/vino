<?php

namespace App\Http\Controllers;

use App\Models\CellierBout;
use Illuminate\Http\Request;

class CellierBoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idCellier)
    {
        $bouteilles = CellierBout::select()->where('id_cellier', '=', $idCellier)
        ->JOIN('bouteilles', 'bouteilles.id_bouteille', '=', 'cellier_bouts.id_bouteille')
        ->JOIN('types', 'bouteilles.id_type', '=', 'types.id_type')
        ->get();
        return $bouteilles;
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
     * @param  \App\Models\CellierBout  $cellierBout
     * @return \Illuminate\Http\Response
     */
    public function show(CellierBout $cellierBout)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CellierBout  $cellierBout
     * @return \Illuminate\Http\Response
     */
    public function edit(CellierBout $cellierBout)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CellierBout  $cellierBout
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CellierBout $cellierBout)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CellierBout  $cellierBout
     * @return \Illuminate\Http\Response
     */
    public function destroy(CellierBout $cellierBout)
    {
        //
    }
}
