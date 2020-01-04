<?php

namespace App\Http\Requests\Commande;

use App\Http\Requests\ApiRequest;

class UpdateCommandeRequest extends ApiRequest
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
            'id' => 'required|exists:commandes',
            'status_id' => 'sometimes|integer|exists:statuses,id',
            'lignes' => 'sometimes|array|nullable',
            'lignes.*.CodeKit' => 'required_if:lignes|exists:kits,CodeKit',
            'lignes.*.Qte' => 'required_if:lignes|integer'
        ];
    }
}
