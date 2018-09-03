class AdministradorController < ApplicationController
    before_action :authenticate_administrator!, only: [:index, :welcome, :alumnos, :secciones, :preguntas, :calificar, :resultados]
    def welcome
    end

    def index
    end

    def alumnos
    end

    def examen
        if request.get?
            @examenes = Exam.all
            @semestre = Semestre.all
            @turno = Turno.all
        elsif request.post?

        end
    end

    def materiasSearch
        @materias = Materium.where('semestre_id = ?', params[:id])
        respond_to do |format|
            format.json { render :json => @materias }
        end
    end

    def preguntas
    end

    def calificar
    end

    def resultados
    end

    def iniciar
    end
end
