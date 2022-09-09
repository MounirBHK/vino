<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CellierController;
use App\Http\Controllers\CellierBoutController;
use App\Http\Controllers\CustomAuthController;
use App\Http\Controllers\BouteilleController;
use App\Http\Controllers\UserController;

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
    Route::get('custom-auth/logout', [CustomAuthController::class, 'customLogout'])->name('custom-logout');
});

Route::get('bouteilles', [BouteilleController::class, 'index'])->name('bouteilles');
Route::get('saq', [BouteilleController::class, 'create'])->name('saq');
Route::get('users', [UserController::class, 'index'])->name('users');

Route::post('custom-auth/login', [CustomAuthController::class, 'customLogin'])->name('custom-login');
Route::post('custom-auth/signup', [CustomAuthController::class, 'customSignup'])->name('custom-signup');

