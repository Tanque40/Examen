class Exam < ApplicationRecord
  belongs_to :materia
  belongs_to :parcial
  belongs_to :turno
  belongs_to :semestre
  has_many :questions
end
