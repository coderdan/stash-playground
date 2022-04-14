class User < ApplicationRecord
  include StashIndex
  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true
end
