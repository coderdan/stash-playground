class StashRelation < ActiveRecord::Relation
  def initialize(klass, table: klass.arel_table, predicate_builder: klass.predicate_builder, values: {})
    super
  end
end

class User < ApplicationRecord
  include ActiveStash::Search

  validates :title, :first_name, :last_name, :email, :dob, :gender, 
    presence: true

  encrypts :first_name #, cipher: MyCipher.new
  encrypts :last_name

  def self.men
    puts "here #{current_scope}"
    where(gender: "male")
  end
end
