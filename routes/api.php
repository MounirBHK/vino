<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CellierController;
use App\Http\Controllers\CellierBoutController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Route::get('bouteilles', [BouteilleController::class, 'index'])->name('bouteilles');
Route::get('celliers/user/{userId}', [CellierController::class, 'index'])->name('celliers');
Route::get('cellier/{idCellier}', [CellierBoutController::class, 'index'])->name('cellier-bouteilles');
