class User < ApplicationRecord
  include ActiveStash::Search
  has_one :patient

  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true

  validates :email, uniqueness: true

  encrypts :first_name #, cipher: MyCipher.new
  encrypts :last_name
  encrypts :email

  stash_index :first_name, :last_name, :dob
  stash_index :email, only: :exact
  stash_index :created_at#, :updated_at

  # TODO: Maybe make this take :only or :except
  stash_match_all :first_name, :last_name, :email
end
