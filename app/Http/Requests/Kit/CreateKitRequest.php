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
            'codekit' => 'string|required|unique:kits',
            'prix' => 'numeric|required',
            'annee' => 'date|required',
            'duree' => 'int|required',
            'codef' => 'string|exists:fabricants,codef|required'
        ];
    }
}
