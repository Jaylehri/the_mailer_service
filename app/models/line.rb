class Line < ApplicationRecord
    has_many :trains
    enum status: ['Available', "Busy"]
end
