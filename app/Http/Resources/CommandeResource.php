<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CommandeResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'status' => $this->status->libelle,
            'status_id' => $this->status_id,
            'details' => $this->details,
            'prix' => $this->details->sum(function($ligne){
                return $ligne->kit->prix * $ligne->Qte;
            }),
            'creator' => $this->creator,
            'created_at' => $this->created_at->toDateTimeString(),
            'updated_at' => $this->updated_at->toDateTimeString(),
            'last_created' => $this->created_at->diffForHumans(),
        ];
    }
}
