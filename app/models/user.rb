class User < ApplicationRecord
  include ActiveStash::Search

  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true

  encrypts :first_name
  encrypts :last_name

  stash_index :first_name, :last_name, :email, :dob
  stash_index :gender, :title, only: :exact
  stash_match_all :first_name, :last_name, :email
end
