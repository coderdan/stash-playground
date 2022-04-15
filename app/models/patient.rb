class Patient < ApplicationRecord
  belongs_to :user
  lockbox_encrypts :height, type: :float
  lockbox_encrypts :weight, type: :float
end
