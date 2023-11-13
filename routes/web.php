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
Route::get('/new-arrivals', [App\Http\Controllers\Frontend\FrontendController::class, 'newArrival']);
Route::get('/featured-products', [App\Http\Controllers\Frontend\FrontendController::class, 'featuredProducts']);
Route::get('/search', [App\Http\Controllers\Frontend\FrontendController::class, 'searchProducts']);

Route::middleware(['auth'])->group(function () {
    Route::get('wishlist', [App\Http\Controllers\Frontend\WishlistController::class,'index']);
    Route::get('cart', [App\Http\Controllers\Frontend\CartController::class,'index']);
    Route::get('checkout', [App\Http\Controllers\Frontend\CheckoutController::class,'index']);
    Route::get('orders', [App\Http\Controllers\Frontend\OrderController::class,'index']);
    Route::get('orders/{orderId}', [App\Http\Controllers\Frontend\OrderController::class,'show']);
    
    Route::get('profile', [App\Http\Controllers\Frontend\UserController::class,'index']);
    Route::post('profile', [App\Http\Controllers\Frontend\UserController::class,'updateUserDetails']);

});

Route::get('thank-you', [App\Http\Controllers\Frontend\FrontendController::class,'thankyou']);


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::prefix('admin')->middleware(['auth', 'isAdmin'])->group(function () {

    Route::get('dashboard', [App\Http\Controllers\Admin\DashboardController::class, 'index']);
    Route::get('settings', [App\Http\Controllers\Admin\SettingController::class, 'index']);
    Route::post('settings', [App\Http\Controllers\Admin\SettingController::class, 'store']);

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

    Route::get('orders', [App\Http\Controllers\Admin\OrderController::class, 'index']);
    Route::get('orders/{orderId}', [App\Http\Controllers\Admin\OrderController::class, 'show']);
    Route::put('orders/{orderId}', [App\Http\Controllers\Admin\OrderController::class, 'updateOrderStatus']);

    Route::get('invoice/{orderId}', [App\Http\Controllers\Admin\OrderController::class, 'viewInvoice']);
    Route::get('invoice/{orderId}/generate', [App\Http\Controllers\Admin\OrderController::class, 'generateInvoice']);
    
    Route::get('/users', [App\Http\Controllers\Admin\UserController::class, 'index']);
    Route::get('/users/create', [App\Http\Controllers\Admin\UserController::class, 'create']);
    Route::post('/users', [App\Http\Controllers\Admin\UserController::class, 'store']);
    Route::get('/users/{user_id}/edit', [App\Http\Controllers\Admin\UserController::class, 'edit']);
    Route::put('/users/{user_id}', [App\Http\Controllers\Admin\UserController::class, 'update']);
    Route::get('/users/{user_id}/delete', [App\Http\Controllers\Admin\UserController::class, 'destroy']);

});
