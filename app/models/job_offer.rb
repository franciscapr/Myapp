class JobOffer < ApplicationRecord
    has_many :postulations
    belongs_to :user
end
