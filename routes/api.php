<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//   return $request->user();
// });
Route::post('auth/signup', 'AuthController@signup');
Route::post('auth/login', 'AuthController@login');

Route::group(['middleware' => 'jwt.verify'], function () {
    Route::get('/auth/current', 'AuthController@getCurrentUser');

    Route::group(['prefix' => 'users'], function () {
        Route::get('/', 'UserController@showAll');
        Route::get('/{id}', 'UserController@get')->middleware('can:users.view');
        Route::post('/filter', 'UserController@filter')->middleware('can:users.view');
        Route::post('/create', 'UserController@create')->middleware('can:users.create');
        Route::post('/update', 'UserController@update')->middleware('can:users.view');
        Route::post('/delete/{id}', 'UserController@delete')->middleware('can:users.create');
    });


    Route::group(['prefix' => 'kit', 'middleware' => 'can:kits.view'], function () {
        Route::get('/', 'KitController@getAll');
        Route::get('/paginate', 'KitController@getAllWithPagination');
        Route::get('/export', 'KitController@export');
        Route::get('/count', 'KitController@count');
        Route::post('/import', 'KitController@import');
        Route::post('/', 'KitController@find');
        Route::post('/filter', 'KitController@filter');
        Route::post('/create', 'KitController@create');
        Route::put('/update', 'KitController@update');
        Route::delete('/delete', 'KitController@delete');
    });

    Route::group(['prefix' => 'fabricant', 'middleware' => 'can:fabricants.view'], function () {
        Route::get('/', 'FabricantController@getAll');
        Route::get('/paginate', 'FabricantController@paginate');
        Route::post('/', 'FabricantController@find');
        Route::post('/create', 'FabricantController@create');
        Route::put('/update', 'FabricantController@update');
        Route::delete('/delete', 'FabricantController@delete');
        Route::get('/minimized', 'FabricantController@minimized');
        Route::post('/filter', 'FabricantController@filter');
    });

    Route::group(['prefix' => 'order'], function () {
        Route::get('/', 'CommandeController@getAll')->middleware('can:orders.view');
        Route::get('/paginate', 'CommandeController@paginate')->middleware('can:orders.view');
        Route::post('/filter',   'CommandeController@filter')->middleware('can:orders.view');
        Route::post('/create', 'CommandeController@create')->middleware('can:orders.create');
        Route::post('/update', 'CommandeController@update')->middleware('can:orders.view');
        Route::get('/stats', 'CommandeController@stats');
        Route::get('/amount', 'CommandeController@amount');
    });

    Route::group(['prefix' => 'inventory'], function () {
        Route::get('/', 'InventaireController@getAll')->middleware('can:inventory.view');
        Route::get('/paginate', 'InventaireController@paginate')->middleware('can:inventory.view');
        Route::post('/', 'InventaireController@find')->middleware('can:inventory.view');
        Route::post('/filter', 'InventaireController@filter')->middleware('can:inventory.view');
        Route::post('/create', 'InventaireController@create')->middleware('can:inventory.view');
        Route::delete('/{id}/delete', 'InventaireController@delete')->middleware('can:inventory.view');
        Route::get('/stats', 'InventaireController@stats');
        Route::get('/graphs', 'InventaireController@graphs');
        Route::get('/last', 'InventaireController@last');
    });

    Route::group(['prefix' => 'record', 'middleware' => 'can:inventory.view'], function () {
        Route::post('/update', 'EnregistrementController@update');
        Route::delete('/delete', 'EnregistrementController@delete');
    });

    Route::group(['prefix' => 'roles'], function () {
        Route::get('/', 'RoleController@getAllRoles');
    
        Route::post('/{id}/add',  'RoleController@addPermissionsToRole')->where('id', '[0-9]+');;
        Route::post('/{id}/remove',  'RoleController@removePermissionsToRole')->where('id', '[0-9]+');;
      });
});
