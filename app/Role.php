<?php

namespace App;
use App\RolePermission;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = "roles";
    protected $fillable = ['libelle', 'niveau'];
    protected $hidden = ['created_at', 'updated_at', 'pivot'];
    
    public function permissions(){
        return $this->belongsToMany(Permission::class, 'role_permission');
    }

    public function hasPermission($permission_id){
        return RolePermission::where('permission_id', $permission_id)->where('role_id', $this->id)->count();
    }
}
