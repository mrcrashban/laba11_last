class Fuc < ApplicationRecord
  validates :param, presence: true, uniqueness: true
  validates :index, presence: true
  validates :factorial, presence: true
  validates :first, presence: true
  validates :second, presence: true
  validates :third, presence: true
  validates :find, presence: true
end