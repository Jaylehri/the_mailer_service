class Api::V1::ParcelController < ApplicationController
    before_action :parcel_params, only: [:create]
    skip_before_action :verify_authenticity_token
  
    # Creating Parcel

    def create
      ActiveRecord::Base.transaction do
        train = Train.find(params[:train_id])
        if train.status == "Available"
          parcels_weight = train.parcels.pluck(:weight).sum.to_f + params[:weight].to_f
          parcels_volume =  train.parcels.pluck(:volume).sum.to_f  + params[:volume].to_f
        
          parcel_cost = ParcelService::Parcel.new.get_parcel_cost(params[:train_id], parcels_weight)
          
          if train.total_volume >= parcels_volume.to_f && train.total_weight >= parcels_weight.to_f
            parcel = Parcel.create weight: params[:weight], volume: params[:volume], cost: parcel_cost, train_id: params[:train_id]
            
            ParcelService::Parcel.new.train_arrived (params[:train_id]) if train.total_volume == parcels_volume.to_f || train.total_weight == parcels_weight.to_f
            render json: { parcel: parcel, message: "Booked successfully" }
          else
            render json: { message: "Not Available space" }
          end
        else
          render json: { message: "Train Unavailable"}
        end
      rescue => e
        render json: {error: e.message}
      end
    end
  
    private
    
    # permitting params

    def parcel_params
      params.permit(:weight, :volume, :train_id)
    end
  end
  