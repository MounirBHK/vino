<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CellierController;
use App\Http\Controllers\CellierBoutController;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\BouteilleController;
use App\Http\Controllers\SAQController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TypeController;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => 'auth:sanctum'], function(){
    Route::get('celliers/user/{userId}', [CellierController::class, 'index'])->name('celliers');
    Route::get('cellier/{idCellier}', [CellierBoutController::class, 'index'])->name('cellier-bouteilles');
    Route::put('changeQuantiteBouteille', [CellierBoutController::class, 'change'])->name('change-quantite-bouteille');
    Route::post('ajouterBouteilleCellier', [CellierBoutController::class, 'store'])->name('add-bouteilleCellier');
    Route::post('ajouterCellier', [CellierController::class, 'create'])->name('cellier-create');
    Route::get('bouteilles', [BouteilleController::class, 'index'])->name('bouteilles');
    Route::delete('bouteilles/{bouteille}', [BouteilleController::class, 'destroy'])->name('bouteille-delete');
    Route::get('users', [UserController::class, 'index'])->name('users');
    Route::get('saq', [SAQController::class, 'index'])->name('import-saq');
    Route::get('custom-auth/logout', [CustomAuthController::class, 'customLogout'])->name('custom-logout');
    Route::put('custom-auth/update', [CustomAuthController::class, 'customUpdate'])->name('custom-update');
    Route::get('custom-auth/envoiEmail', [CustomAuthController::class, 'envoiEmail'])->name('custom-envoiEmail');
    Route::put('custom-auth/resetPassword', [CustomAuthController::class, 'resetPassword'])->name('custom-resetPassword');
});

// route pour suppression cellier ett bouteilles de cellier
Route::delete('deleteBoutCellier/{id_cellier}/{id_bouteille}', [CellierBoutController::class, 'destroy'])->name('destroy-cellier-bouteilles');
Route::delete('deleteCellier/{id_cellier}', [CellierBoutController::class, 'destroyAll'])->name('destroy-cellier');
// -----------------

Route::post('custom-auth/login', [CustomAuthController::class, 'customLogin'])->name('custom-login');
Route::post('custom-auth/signup', [CustomAuthController::class, 'customSignup'])->name('custom-signup');

