<?php

namespace App\Http\Requests\Kit;

use App\Http\Requests\ApiRequest;


class UpdateKitRequest extends ApiRequest
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
            'CodeKit' => 'string|required|exists:kits,CodeKit',
            'prix' => 'numeric|required',
            'Annee' => 'date|required',
            'Duree' => 'int|required',
            'Stock' => 'int|required',
            'CodeF' => 'string|exists:fabricants,CodeF|required'
        ];
    }
}
