class Materium < ApplicationRecord
  belongs_to :semestre
  has_many :exams
end
