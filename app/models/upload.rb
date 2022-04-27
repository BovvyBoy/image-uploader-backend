class Upload < ApplicationRecord
    has_one_attachment :picture
    has_many_attached :selections
    has_many :images
end
