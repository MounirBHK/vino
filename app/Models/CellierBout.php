<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CellierBout extends Model
{
    use HasFactory;
    protected $fillable = ['id_cellier','id_bouteille','quantite','derniere_trans'];
}
