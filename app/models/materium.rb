class Materium < ApplicationRecord
  belongs_to :semestre
  has_many :examens
end
