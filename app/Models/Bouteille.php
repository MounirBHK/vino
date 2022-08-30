<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bouteille extends Model
{
    use HasFactory;

    // $query = Bouteille::Select(
    //     ['vino_celliers.id AS idCellier', 'vino_bouteilles.*', 'vino_celliers.*', 'vino_types.*'])
    //  ->JOIN('vino_celliers', 'vino_bouteilles.id', '=', 'vino_celliers.id_vino_bouteilles')
    //  ->JOIN('vino_types', 'vino_bouteilles.id_vino_types', '=', 'vino_types.id')
    //  ->get();
    //  return $query;
}
