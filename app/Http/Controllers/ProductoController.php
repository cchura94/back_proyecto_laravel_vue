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
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
