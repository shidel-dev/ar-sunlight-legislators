require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateSenators < ActiveRecord::Migration
  def change
    create_table :senators do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :phone
      t.string :fax
      t.string :website
      t.string :email
      t.string :party
      t.string :gender
      t.string :birthdate
      t.string :twitter_id

      t.timestamp

    end
  end
end
