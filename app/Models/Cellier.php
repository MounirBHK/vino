<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cellier extends Model
{
    use HasFactory;
    protected $fillable = ['id_user', 'lib_cellier', 'capacite'];
}
