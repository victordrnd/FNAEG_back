<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $table = "roles";
    protected $fillable = ['libelle', 'niveau'];
    protected $hidden = ['created_at', 'updated_at', 'pivot'];
    
    public function permissions(){
        return $this->belongsToMany(Permission::class, 'role_permission');
    }

}
