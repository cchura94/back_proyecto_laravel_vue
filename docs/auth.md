# Auth Api Rest Laravel
## 1. Crear el controller AuthController 
- Generar el controlador par las funciones (Login, register, profile, logout)
```bash
php artisan make:controller AuthController
```
## Agregar las rutas en routes/api.php
```php
Route::prefix("/v1/auth")->group(function(){

    Route::post('/login', [AuthController::class, 'login']);
    Route::post("/register", [AuthController::class, 'registro']);

    Route::middleware("auth:sanctum")->group(function(){
        Route::get("/perfil", [AuthController::class, 'perfil']);
        Route::post("/logout", [AuthController::class, 'salir']);
    });
});
```
## logica de registro en AuthController (registro)