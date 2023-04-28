<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\PedidoController;
use App\Http\Controllers\ProductoController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Auth Api Rest
Route::prefix("/v1/auth")->group(function(){

    Route::post('/login', [AuthController::class, 'login']);
    Route::post("/register", [AuthController::class, 'registro']);

    Route::middleware("auth:sanctum")->group(function(){
        Route::get("/perfil", [AuthController::class, 'perfil']);
        Route::post("/logout", [AuthController::class, 'salir']);
    });
});

// Crud Api Usuarios
Route::middleware("auth:sanctum")->group(function() {

    // actualizacion de contraseña
    Route::post("user/{id}/update-password", [UserController::class, "updatePassword"]);
    // actualizar imagen
    Route::post("producto/{id}/update-image", [ProductoController::class, "actualizarImagen"]);

    Route::apiResource("user", UserController::class);
    Route::apiResource("categoria", CategoriaController::class);
    Route::apiResource("producto", ProductoController::class);
    Route::apiResource("cliente", ClienteController::class);
    Route::apiResource("pedido", PedidoController::class);

});