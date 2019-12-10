<?php

namespace App\Http\Requests\Kit;

use Illuminate\Foundation\Http\FormRequest;

class SearchKitRequest extends FormRequest
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
            'min' => 'sometimes|numeric',
            'max' => 'sometimes|numeric',
            'stock' => 'sometimes|boolean',
            'fabricants.CodeF' => 'sometimes|exists:fabricants,CodeF',
            'orderBy' => 'sometimes|array',
            'orderBy.*' => 'sometimes|string'
        ];
    }
}
