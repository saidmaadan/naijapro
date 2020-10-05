class Property < ApplicationRecord

    belong_to :property_type
    belong_to :category
end
