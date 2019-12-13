<?php

namespace App\Http\Requests\Inventaire;

use App\Http\Requests\ApiRequest;

class CreateInventaireRequest extends ApiRequest
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
            'kits' => 'required|array',
            'kits.*.CodeKit' => 'required|exists:kits,CodeKit',
            'kits.*.Stock' => 'required|integer'
        ];
    }
}
