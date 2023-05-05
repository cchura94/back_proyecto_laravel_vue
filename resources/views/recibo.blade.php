<div class="fondo">
<h1>Recibo de Pedido: {{$pedido["id"]}}</h1>
<hr>
<h3>CLIENTE: {{ $pedido["cliente"]["nombre_completo"] }}</h3>
<h3>CORREO: {{ $pedido["cliente"]["correo"] }}</h3>
<h3>CI/NIT: {{ $pedido["cliente"]["ci_nit"] }}</h3>
<hr>
<h2>Productos</h2>

<table border="1">
    <tr>
        <td>ID</td>
        <td>NOMBRE</td>
        <td>PRECIO</td>
        <td>CANTIDAD</td>
    </tr>
    @foreach ($pedido["productos"] as $prod)
    <tr>
        <td>{{ $prod["id"] }}</td>
        <td>{{ $prod["nombre"] }}</td>
        <td>{{ $prod["precio"] }}</td>
        <td>{{ $prod["pivot"]["cantidad"] }}</td>
    </tr>
    @endforeach
</table>


</div>

<style>
    .fondo{
        background-color: #cccccc;
    }
</style>