class Train < ApplicationRecord
    has_many :parcels
    belongs_to :line
    # validate :check_line_availability
    enum status: ['Available', "Unavailable"]
   
    # def check_line_availability
    #   line = Line.find self.line_id
    #   errors.add("Line is busy") if line.status == 'Busy'
    # end
end
