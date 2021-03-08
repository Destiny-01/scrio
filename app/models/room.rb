class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :users, through: :messages
    validates_uniqueness_of :name
end
