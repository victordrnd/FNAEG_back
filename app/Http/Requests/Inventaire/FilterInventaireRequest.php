<?php

namespace App\Http\Requests\Inventaire;

use App\Http\Requests\ApiRequest;

class FilterInventaireRequest extends ApiRequest
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
            'dateRange' => 'sometimes|array|nullable'
        ];
    }
}
