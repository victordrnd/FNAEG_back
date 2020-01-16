<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        Gate::define('kits.view', function($user){
            return $user->hasPermission('kits.view');
        });

        Gate::define('fabricants.view', function($user){
            return $user->hasPermission('fabricants.view');
        });

        Gate::define('orders.view', function($user){
            return $user->hasPermission('orders.view');
        });

        Gate::define('orders.create', function($user){
            return $user->hasPermission('orders.create');
        });

        Gate::define('orders.update', function($user){
            return $user->hasPermission('orders.update');
        });

        Gate::define('users.view', function($user){
            return $user->hasPermission('users.view');
        });

        Gate::define('users.create', function($user){
            return $user->hasPermission('users.create');
        });

        Gate::define('inventory.view', function($user){
            return $user->hasPermission('inventory.view');
        });

    }
}
