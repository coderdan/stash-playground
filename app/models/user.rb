class MyCipher
  def encrypt(message, key, **options)
    ActiveRecord::Encryption::Message.new(payload: message).tap do |message|
      #message.headers.iv = iv
      #message.headers.auth_tag = cipher.auth_tag
    end
  end

  def decrypt(ciphertext, key:)
    ciphertext
  end
end

class User < ApplicationRecord
  include StashIndex
  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true

  encrypts :first_name #, cipher: MyCipher.new
  encrypts :last_name
end
