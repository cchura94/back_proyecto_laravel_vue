<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $usuarios = User::select("id", "name", "email")->get();

        return response()->json($usuarios, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // validamos
        $request->validate([
            "name" => "required",
            "email" => "required|email|unique:users,email",
            "password" => "required"
        ]);
        // guardamos
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->save();
        // respondemos
        return response()->json(["message" => "Usuario Registrado", "user" => $user], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $user = User::findOrFail($id);
        // User::where('id', $id)->first();
        return response()->json($user, 200);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
         // validamos
         $request->validate([
            "name" => "required",
            "email" => "required|email|unique:users,email,$id",
            "password" => "required"
        ]);

        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $request->email;
        // $user->password = bcrypt($request->password);
        $user->update();
        // respondemos
        return response()->json(["message" => "Usuario Modificado", "user" => $user], 201);
   
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user = User::findOrFail($id);
        $user->delete();

        return response()->json(["message" => "Usuario Eliminado"], 200);
   
    }

    public function updatePassword($id, Request $request)
    {
        $request->validate([
            "password" => "required",
            "npassword" => "required",
            "npassword2" => "required|same:npassword"
        ]);

        $user = User::findOrFail($id);
        $user->password = bcrypt($request->npassword);
        $user->save();
        
        return response()->json(["message" => "Contraseña Actualizada"], 200);
    }
}
