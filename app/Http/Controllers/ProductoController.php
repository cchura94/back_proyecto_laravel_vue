<?php

namespace App\Http\Controllers;

use App\Models\Producto;
use Illuminate\Http\Request;

class ProductoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // http://api.laravel.com/api/v1/producto?page=1&q=tec&limit=5
        $limit = isset($request->limit)?$request->limit:10;
        if($request->q){
            $productos = Producto::where('nombre', 'like', "%".$request->q. "%")
                        ->orderBy('id', 'desc')                   
                        ->paginate($limit);
        }else{
            $productos = Producto::orderBy('id', 'desc')->paginate($limit);            
        }

        return response()->json($productos);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // validacion
        $request->validate([
            "nombre" => "required",
            "categoria_id" => "required"
        ]);

        // guardar en la BD
        $prod = new Producto();
        $prod->nombre = $request->nombre;
        $prod->precio = $request->precio;
        $prod->cantidad = $request->cantidad;
        $prod->categoria_id = $request->categoria_id;
        $prod->imagen = "-";
        $prod->descripcion = $request->descripcion;
        $prod->save();
        
        // return
        return response()->json(["message" => "Producto Registrado"], 201); 
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $prod = Producto::findOrFail($id);

        return response()->json($prod, 200); 
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            "nombre" => "required",
            "categoria_id" => "required"
        ]);
        
        // guardar en la BD
        $prod = Producto::findOrFail($id);
        $prod->nombre = $request->nombre;
        $prod->precio = $request->precio;
        $prod->cantidad = $request->cantidad;
        $prod->categoria_id = $request->categoria_id;
        $prod->descripcion = $request->descripcion;
        $prod->update();
        
        // return
        return response()->json(["message" => "Producto Actualizado"], 201); 
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $prod = Producto::findOrFail($id);
        $prod->delete();
        return response()->json(["message" => "Producto Eliminado"], 200);
    }
}
