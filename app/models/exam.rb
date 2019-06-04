class Exam < ApplicationRecord
  belongs_to :materium
  belongs_to :parcial
  belongs_to :turno
  belongs_to :semestre
end
