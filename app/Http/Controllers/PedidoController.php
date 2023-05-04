<?php

namespace App\Http\Controllers;

use App\Models\Pedido;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class PedidoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $pedidos = Pedido::orderBy('id', "desc")
                            ->with('productos', 'cliente')
                            ->paginate(10);
        return response()->json($pedidos, 200);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        /*
        {
            "cliente_id": 1,
            "productos": [
                {producto_id: 1, cantidad: 1},
                {producto_id: 4, cantidad: 3}
            ]
        }
        */
        $request->validate([
            "cliente_id" => "required",
            "productos" => "required"
        ]);

        DB::beginTransaction();

        try {
            $pedido = new Pedido();
            $pedido->cliente_id = $request->cliente_id;
            $pedido->fecha = date('Y-m-d H:i:s');
            $pedido->user_id = Auth::id();
            $pedido->save();

            foreach ($request->productos as $obj) {
                $producto_id = $obj["id"];
                $cantidad = $obj["cantidad"];

                $pedido->productos()->attach($producto_id, ["cantidad" => $cantidad]);
            }

            $pedido->estado = 2;
            $pedido->observaciones = $request->observaciones;
            $pedido->update();

            DB::commit();
            // all good
            return response()->json(["message" => "Pedido Registrado"], 201);
        } catch (\Exception $e) {
            DB::rollback();
            // something went wrong
            return response()->json(["message" => "Error al registrar el Pedido", "error" => $e], 422);
        }
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
