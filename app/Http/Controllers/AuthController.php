<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{

    public function login(Request $request)
    {
        $credenciales = $request->validate([
            "email" =>"required|email",
            "password" =>"required"
        ]);
        
        if(!Auth::attempt($credenciales)){
            return response()->json(['message' => "Credenciales Incorrectas", 'error' => true]);
        }

        // generar el token
        $user = Auth::user();
        $tokenResult = $user->createToken("Token Personal");
        $token = $tokenResult->plainTextToken;

        return response()->json([
            'access_token' => $token,
            "type_token" => "Bearer",
            "usuario" => $user
        ]);        
    }

    public function registro(Request $request)
    {
        // validar
        $request->validate([
            "name" => "required",
            "email" => "required|email|unique:users",
            "password" => "required",
            "cpassword" => "required|same:password"
        ]);

        // registrar
        $usuario = new User();
        $usuario->name = $request->name;
        $usuario->email = $request->email;
        $usuario->password = Hash::make($request->password);
        $usuario->save();
        // retornar una resposta json
        return response()->json(["message" => "Usuario Registrado", "error" => false]);     
    }

    public function perfil()
    {
        $user = Auth::user();
        return response()->json($user);
        
    }

    public function salir()
    {
        
    }
}
