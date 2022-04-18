class User < ApplicationRecord
  include ActiveStash::Search

  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true

  encrypts :first_name #, cipher: MyCipher.new
  encrypts :last_name
end
