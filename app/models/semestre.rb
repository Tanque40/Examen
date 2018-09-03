class Semestre < ApplicationRecord
    has_many :materias
    has_many :examens
end
