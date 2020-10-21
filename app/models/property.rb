class Property < ApplicationRecord

    belongs_to :property_type
    belongs_to :category
    belongs_to :agent

    has_many_attached :photos
end