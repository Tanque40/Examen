class Alumno < ApplicationRecord
  belongs_to :semestre
  belongs_to :turno
end
