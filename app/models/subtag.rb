class Subtag < ApplicationRecord
  has_many :asts
  has_many :articles, through: :asts
  has_many :tags, through: :asts
  accepts_nested_attributes_for :asts

  validates :title, presence: true

end
