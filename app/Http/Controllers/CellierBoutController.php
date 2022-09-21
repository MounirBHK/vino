<?php

namespace App\Http\Controllers;

use App\Models\Cellier;
use App\Models\CellierBout;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CellierBoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($idCellier)

    {
        $bouteilles = CellierBout::select('bouteilles.*', 'cellier_bouts.*', 'types.id as id_type', 'types.type')->where('id_cellier', '=', $idCellier)
        ->JOIN('bouteilles', 'bouteilles.id', '=', 'cellier_bouts.id_bouteille')
        ->JOIN('types', 'bouteilles.id_type', '=', 'types.id')
        ->get();
        return $bouteilles;
    }
    /**
     * Display a listing of the resource.
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function change(Request $request)
    {
        $resultat = $request->quantite += $request->operation;
        if($resultat >= 0){
            DB::table('cellier_bouts')->where('id_cellier', $request->idCellier)->where('id_bouteille', $request->idBouteille)->update(['quantite' => $request->quantite]);
        }
        $bouteille = DB::table('cellier_bouts')->where('id_cellier', $request->idCellier)->where('id_bouteille', $request->idBouteille)->get();
        return $bouteille;
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

        $bouteille = CellierBout::select('*')
        ->where('id_cellier', '=', $request->id_cellier)
        ->where('id_bouteille', '=', $request->id_bouteille)
        ->get();

        if (count($bouteille)>0){
            $bouteille[0]->quantite += $request->quantite;
            DB::table('cellier_bouts')->where('id_cellier', $request->id_cellier)->where('id_bouteille', $request->id_bouteille)->update(['quantite' => $bouteille[0]->quantite]);
            $bouteille = DB::table('cellier_bouts')->where('id_cellier', $request->id_cellier)->where('id_bouteille', $request->id_bouteille)->get();
            return $bouteille;
        }
        else
        {
            $newBoutCell = new CellierBout;
            $newBoutCell->fill($request->all());
            $newBoutCell->save();
            return $request->all();
        }
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
     * destroy
     *
     * @param  mixed $id_cellier
     * @param  mixed $id_bouteille
     * @return void
     */
    public function destroy($id_cellier, $id_bouteille )
    {
        return CellierBout::where('id_cellier' , $id_cellier)->where('id_bouteille' , $id_bouteille)->delete();
    }

       
    /**
     * destroyAll
     *
     * @param  mixed $id_cellier
     * @return void
     */
    public function destroyAll( $id_cellier )
    {
        CellierBout::where('id_cellier' , $id_cellier)->delete();
        Cellier::where('id' , $id_cellier)->delete();
        $celliers = Cellier::All(); 

        return $celliers;
        
    }
}
