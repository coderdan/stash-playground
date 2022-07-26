class User < ApplicationRecord
  include ActiveStash::Search
  has_one :patient

  encrypts :first_name
  encrypts :last_name
  encrypts :email

  validates :title, :first_name, :last_name,
    :email, :dob, :gender, 
    presence: true

  stash_index :first_name, :last_name, :email, :dob
  stash_index :gender, :title, only: :exact
  stash_index :created_at

  stash_match_all :first_name, :last_name, :email
end
