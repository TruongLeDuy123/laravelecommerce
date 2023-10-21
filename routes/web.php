<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Auth::routes();

Route::get('/', [App\Http\Controllers\Frontend\FrontendController::class, 'index']);
Route::get('/collections', [App\Http\Controllers\Frontend\FrontendController::class, 'categories']);
Route::get('/collections/{category_slug}', [App\Http\Controllers\Frontend\FrontendController::class, 'products']);
Route::get('/collections/{category_slug}/{product_slug}', [App\Http\Controllers\Frontend\FrontendController::class, 'productView']);



Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::prefix('admin')->middleware(['auth', 'isAdmin'])->group(function () {

    Route::get('dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'index']);

    // Sliders
    Route::get('sliders', [App\Http\Controllers\Admin\SliderController::class, 'index']);
    Route::get('sliders/create', [App\Http\Controllers\Admin\SliderController::class, 'create']);
    Route::post('sliders/create', [App\Http\Controllers\Admin\SliderController::class, 'store']);
    Route::get('sliders/{slider}/edit', [App\Http\Controllers\Admin\SliderController::class, 'edit']);
    Route::put('sliders/{slider}', [App\Http\Controllers\Admin\SliderController::class, 'update']);
    Route::get('sliders/{slider}/delete', [App\Http\Controllers\Admin\SliderController::class, 'destroy']);


    // Category
    Route::get('category', [App\Http\Controllers\Admin\CategoryController::class, 'index']);
    Route::get('category/create', [App\Http\Controllers\Admin\CategoryController::class, 'create']);
    Route::post('category', [App\Http\Controllers\Admin\CategoryController::class, 'store']);
    Route::get('category/{category}/edit', [App\Http\Controllers\Admin\CategoryController::class, 'edit']);
    Route::put('category/{category}', [App\Http\Controllers\Admin\CategoryController::class, 'update']);

    // Products
    Route::get('products', [App\Http\Controllers\Admin\ProductController::class, 'index']);
    Route::get('products/create', [App\Http\Controllers\Admin\ProductController::class, 'create']);
    Route::post('products', [App\Http\Controllers\Admin\ProductController::class, 'store']);
    Route::get('products/{product}/edit', [App\Http\Controllers\Admin\ProductController::class, 'edit']);
    Route::put('products/{product}', [App\Http\Controllers\Admin\ProductController::class, 'update']);
    Route::get('products/{product_id}/delete', [App\Http\Controllers\Admin\ProductController::class, 'destroy']);
    Route::get('product-image/{product_image_id}/delete', [App\Http\Controllers\Admin\ProductController::class, 'destroyImage']);

    Route::post('product-color/{prod_color_id}', [App\Http\Controllers\Admin\ProductController::class, 'updateProdColorQty']);
    Route::get('product-color/{prod_color_id}/delete', [App\Http\Controllers\Admin\ProductController::class, 'deleteProdColor']);


    // Brands
    Route::get('brands', App\Http\Livewire\Admin\Brand\Index::class);

    // Colors
    Route::get('colors', [App\Http\Controllers\Admin\ColorController::class, 'index']);
    Route::get('colors/create', [App\Http\Controllers\Admin\ColorController::class, 'create']);
    Route::post('colors/create', [App\Http\Controllers\Admin\ColorController::class, 'store']);
    Route::get('colors/{color}/edit', [App\Http\Controllers\Admin\ColorController::class, 'edit']);
    Route::put('colors/{color_id}', [App\Http\Controllers\Admin\ColorController::class, 'update']);
    Route::get('colors/{color_id}/delete', [App\Http\Controllers\Admin\ColorController::class, 'destroy']);

});
