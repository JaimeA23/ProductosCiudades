<?php


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\ProductosController;


Route::get('imagesee/{filename}',[ProductosController::class, 'imagesee']);


Route::middleware('auth:api')->get('/token/revoke', function (Request $request) {
    DB::table('oauth_access_tokens')
        ->where('user_id', $request->user()->id)
        ->update([
            'revoked' => true
        ]);
    return response()->json('DONE');
});

Route::group([
    'middleware' => 'auth:api'
  ], function() {
     Route::get('productos', [ProductosController::class, 'productos']);
     Route::get('ciudades', [ProductosController::class, 'ciudades']);
     Route::post('crear', [ProductosController::class, 'crear']);
     Route::post('editar', [ProductosController::class, 'editar']);
     Route::post('ver', [ProductosController::class, 'ver']);
     Route::post('eliminar', [ProductosController::class, 'eliminar']);
     Route::post('imageup', [ProductosController::class, 'imageup']);
     

   
     
  });

