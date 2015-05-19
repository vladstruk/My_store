require 'pry'
class Item < ActiveRecord::Base
  attr_accessible :price, :name, :real, :weight, :description
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  after_initialize {puts "initialized"}
end
