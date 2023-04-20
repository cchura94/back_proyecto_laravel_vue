# PASOS
1. Generar los Modelos y las migraciones

```
php artisan make:model Categoria -m
php artisan make:model Producto -m
php artisan make:model Cliente -m
php artisan make:model Pedido -m
php artisan make:migration create_pedido_producto_table
```
2. Generar los controladores API
```
php artisan make:controller CategoriaController --api
php artisan make:controller ProductoController --api
php artisan make:controller ClienteController --api
php artisan make:controller PedidoController --api
```

3. Agregar las Rutas en routes/api.php
- En la carpeta routes/api.php agregamos
```php
use App\Controllers\CategoriaController;
use App\Controllers\ProductoController;
use App\Controllers\ClienteController;
use App\Controllers\PedidoController;

Route::apiresouce("categoria", CategoriaController::class);
Route::apiresouce("producto", ProductoController::class);
Route::apiresouce("cliente", ClienteController::class);
Route::apiresouce("pedido", PedidoController::class);

```
4. Trabajar en la logica de negocios