<?php

namespace App\Http\Requests\Fabricant;

use App\Http\Requests\ApiRequest;

class CreateFabricantRequest extends ApiRequest
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
            'codef' => 'string|required|unique:fabricants',
            'nom' => 'string|required',
            'pays' => 'string|required',
            'ville' => 'string|required'
        ];
    }
}
