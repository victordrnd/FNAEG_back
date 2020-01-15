<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
class RoleController extends Controller
{
    public function getAll(){
        $roles = Role::all();
        return Controller::responseJson(200, "Les roles ont été retournés", $roles);
    }
}
