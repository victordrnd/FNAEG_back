<?php

namespace App\Http\Requests\Kit;

use App\Http\Requests\ApiRequest;

class CreateKitRequest extends ApiRequest
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
            'CodeKit' => 'string|required|unique:kits',
            'prix' => 'numeric|required',
            'Annee' => 'date|required',
            'Duree' => 'int|required',
            'CodeF' => 'string|exists:fabricants,CodeF|required'
        ];
    }
}
