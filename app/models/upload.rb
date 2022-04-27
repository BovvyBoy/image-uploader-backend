class Upload < ApplicationRecord
    has_one_attached :picture
    has_many_attached :selections
    has_many :images, dependent: :destroy
end
