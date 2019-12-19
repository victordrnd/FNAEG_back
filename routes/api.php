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
Route::post('auth/signup',     'AuthController@signup');
Route::post('auth/login',      'AuthController@login');

Route::group(['middleware' => 'jwt.verify'], function () {
  Route::get('/auth/current',  'AuthController@getCurrentUser');

  Route::group(['prefix' => 'users'], function () {
    Route::get('/',             'UserController@showAll');
    Route::get('/{id}',         'UserController@get');
    Route::post('/add',         'UserController@add');
    Route::post('/update',      'UserController@update');
    Route::post('/delete/{id}', 'UserController@delete');
  });
});


Route::group(['prefix' => 'kit'], function () {
  Route::get('/',               'KitController@getAll');
  Route::get('/paginate',       'KitController@getAllWithPagination');
  Route::get('/export',         'KitController@export');
  Route::post('/import',        'KitController@import');
  Route::post('/',              'KitController@find');
  Route::post('/filter',        'KitController@filter');
  Route::post('/create',        'KitController@create');
  Route::put('/update',         'KitController@update');
  Route::delete('/delete',      'KitController@delete');
});

Route::group(['prefix' => 'fabricant'], function () {
  Route::get('/',               'FabricantController@getAll');
  Route::get('/paginate',       'FabricantController@paginate');
  Route::post('/',              'FabricantController@find');
  Route::post('/create',       'FabricantController@create');
  Route::put('/update',         'FabricantController@update');
  Route::delete('/delete',      'FabricantController@delete');
  Route::get('/minimized',      'FabricantController@minimized');
  Route::post('/filter',        'FabricantController@filter');
});

Route::group(['prefix' => 'order'], function () {
  Route::get('/',               'CommandeController@getAll');
  Route::post('/create',        'CommandeController@create');
});

Route::group(['prefix' => 'inventory'], function () {
  Route::get('/',               'InventaireController@getAll');
  Route::get('/paginate',       'InventaireController@paginate');
  Route::post('/',              'InventaireController@find');
  Route::post('/create',        'InventaireController@create');
  Route::delete('/{id}/delete', 'InventaireController@delete');
});

Route::group(['prefix' => 'record'], function () {
  Route::post('/update',        'EnregistrementController@update');
  Route::delete('/delete',      'EnregistrementController@delete');
});
