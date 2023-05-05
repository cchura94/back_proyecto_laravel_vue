<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\CategoriaController;
use App\Http\Controllers\ClienteController;
use App\Http\Controllers\PedidoController;
use App\Http\Controllers\ProductoController;
use App\Models\User;
use Illuminate\Support\Facades\Mail;

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

    // enviar correo
    Route::get("/pedido/{id}/enviar-email", [PedidoController::class, "enviarFacturaCorreo"]);

    Route::apiResource("user", UserController::class);
    Route::apiResource("categoria", CategoriaController::class);
    Route::apiResource("producto", ProductoController::class);
    Route::apiResource("cliente", ClienteController::class);
    Route::apiResource("pedido", PedidoController::class);
 
});
Route::get("correo", function(){
    $asunto = "Asunto de PRUEBA para juan";
    $for = "juan.abc@gmail.com";
    Mail::send('templatecorreo', ["mensaje" => "Hola"], function($msg) use ($asunto, $for) {
        $msg->from("ventas@empresa.com", "Ventas");
        $msg->subject($asunto);
        $msg->to($for);
    });

    return response()->json(["message" => "Correo enviado"]);
});

Route::get("categoria-xml", function(){
    $users = User::all();
    $response = '<?xml version="1.0" encoding="UTF-8"?>';
    $response .= '<soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">';
    $response .= '<soap:Body>';
    foreach ($users as $user) {
        $response .= '<user>';
        $response .= '<id>'.$user->id.'</id>';
        $response .= '<nombre>'.$user->name.'</nombre>';
        $response .= '<email>'.$user->email.'</email>';
        $response .= '</user>';
    }

    $response .= '</soap:Body>';
    $response .= '</soap:Envelope>';

    header("Content-Type: text/xml; charset=UTF-8");
    
    return response($response, 200, [
        'Content-Type' => 'application/xml'
    ]);

});