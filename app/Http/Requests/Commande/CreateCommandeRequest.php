<?php

namespace App\Http\Requests\Commande;

use App\Http\Requests\ApiRequest;

class CreateCommandeRequest extends APiRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'CodeKit' => 'required|exists:kits',
            'CodeLab' => 'required|exists:labos',
            'Qte' => 'required|integer'
        ];
    }
}
