module ParcelService
  class Parcel
    # Checking for line availability

    def train_arrived(train_id)
      train = Train.find(train_id)
  
      if train.line.status == "Available" || train.line.updated_at < 3.hours.ago

        source = train.line.source
        destination = train.line.destination

        same_track = Line.where(source: destination, destination: source).first
        same_track.update(status: 1)
        train.line.update(status: 1)
        Train.find(train_id).update(status: 1)
      else
        raise "Route is Busy"
      end
    end
    
    # calculating cost of parcel

    def get_parcel_cost(train_id, parcel_weight)
      train = Train.find(train_id)
      cost = (train.cost.to_f / train.total_weight.to_f).to_f
      parcel_cost = (parcel_weight.to_f * cost ).to_f
    end
  end
end