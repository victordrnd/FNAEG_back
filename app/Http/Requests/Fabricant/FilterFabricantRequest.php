<?php

namespace App\Http\Requests\Fabricant;

use Illuminate\Foundation\Http\FormRequest;

class FilterFabricantRequest extends FormRequest
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
            'keyword' => 'sometimes|string',
            'ordersBy' => 'sometimes|array',
            'ordersBy.*.key' => 'required_with:ordersBy.*.value|string',
            'ordersBy.*.value' => 'required_with:ordersBy.*.key|in:asc,desc' 
        ];
    }
}
