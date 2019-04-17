class Formula < ApplicationRecord
    belongs_to :admin_user
    belongs_to :product


    validates :for1, presence: true
    validates :cantidad, presence: true
   # validates :factor, presence: true

end
