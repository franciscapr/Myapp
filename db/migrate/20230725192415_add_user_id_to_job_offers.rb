class AddUserIdToJobOffers < ActiveRecord::Migration[7.0]
  def change
    add_reference :job_offers, :user, null: false, foreign_key: true
  end
end
