require 'pry'
class Item < ActiveRecord::Base
  attr_accessible :price, :name, :real, :weight, :description
  validates :name, presence: true

  after_initialize {puts "initialized"}
end
