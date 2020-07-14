class AddUserRefToListings < ActiveRecord::Migration[6.0]
  def change
    add_reference :listings, :user, foreign_key: true
  end
end
