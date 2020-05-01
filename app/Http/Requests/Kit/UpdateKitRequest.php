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
            'codekit' => 'string|required|exists:kits,codekit',
            'prix' => 'numeric|required',
            'annee' => 'date|required',
            'duree' => 'int|required',
            'stock' => 'int|required',
            'codef' => 'string|exists:fabricants,codef|required'
        ];
    }
}
