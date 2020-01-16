<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Http\Requests\User\CreateUserRequest;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{

  /**
  * Return all users from users table
  * @return array
  */
    public function showAll()
    {
        $users = User::with('role')->get();
        return Controller::responseJson(200, "Les utisateurs ont bien été retournés", $users);
    }






    /**
    * Return user identified by $id
    * @param int $id
    * @return array
    */
    public function get($id)
    {
        try {
            $user = User::where('id', $id)->firstOrFail();
        } catch (ModelNotFoundException $e) {
            return Controller::responseJson(404, "L'utilisateur demandé n'existe pas", $e->getMessage());
        }
        return Controller::responseJson(200, "L'utilisateur a bien été retourné", $user);
    }


    public function filter(Request $req)
    {
        $users = (new User)->newQuery();

        if ($req->has('keyword') && $req->filled('keyword')) {
            $keywords = explode(" ", $req->keyword);
            foreach ($keywords as $keyword) {
                $users->orWhere('firstname', 'like', "%$keyword%")->orWhere('lastname', 'like', "%$keyword%");
            }
        }
        $users = $users->with('role')->get();
        return Controller::responseJson(200, "Les utilisateurs ont été filtrés", $users);
    }



    public function create(CreateUserRequest $req)
    {
        try {
            $user = User::create([
        'firstname' => $req->firstname,
        'lastname' => $req->lastname,
        'email' => $req->email,
        'password' => Hash::make($req->password),
        'role_id' => $req->role_id
      ]);
        } catch (Exception $e) {
            return Controller::responseJson(422, "Une erreur est survenue");
        }
        return Controller::responseJson(200, "L'utilisateur a correctement été crée", $user);
    }


    /**
    * update an existing user
    * @param int $id
    * @param string $firstname
    * @param string $lastname
    * @param string $email
    * @param date $birth_date
    * @return array
    */
    public function update(Request $request)
    {
        try {
            $user = User::findOrFail($request->id);
        } catch (ModelNotFoundException $e) {
            return Controller::responseJson(422, "L'utilisateur n'existe pas");
        }
        $user->update($request->all());
        return Controller::responseJson(200, "L'utilisateur a bien été mis à jour", User::find($request->id));
    }




    /**
    * @param int $id
    * @return void
    */
    public function delete($id)
    {
        User::destroy($id);
        return Controller::responseJson(200, "L'utilisateur a correctement été sauvegardé");
    }
}
