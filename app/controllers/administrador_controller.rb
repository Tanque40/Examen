class AdministradorController < ApplicationController
    before_action :authenticate_administrator!, only: [:index, :welcome, :alumnos, :secciones, :preguntas, :calificar, :resultados]
    def welcome
    end

    def index
    end

    def alumnos
    end

    def examen
        fecha = Time.now - 1209600 #El numero es así de grande porque le resta 14 días por si hay que activarlo de nuevo
        fechaABuscar = fecha.strftime("%Y-%m-%d")
        @examenes = Exam.where('fecha >= ?', fechaABuscar)
        @semestre = Semestre.all
        @turno = Turno.all
        @parcial = Parcial.all
        @examen = Exam.new
    end

    def activarExam
        if Exam.update( params[:id], :activo => true )
            respond_to do |format|
                format.json { render :json => { "respuesta" => "Examen activado correctamente" } }
            end
        end
    end

    def desactivarExam
        if Exam.update( params[:id], :activo => false )
            respond_to do |format|
                format.json { render :json => { "respuesta" => "Examen desactivado correctamente" } }
            end
        end
    end

    def guardarExamen
        @examen = Exam.new( materium_id: params["materia_id"], parcial_id: params["parcial_id"], turno_id: params["turno_id"], semestre_id: params["semestre_id"], fecha: params["fecha"])
        @examen.save
        @newExamen = Exam.find(@examen.id)
        info = {"materium_id" => @newExamen.materium.materia, "parcial_id" => @newExamen.parcial.noParcial, "turno_id" => @newExamen.turno.nomTurn, "semestre_id" => @newExamen.semestre.nomSemestre, "fecha" => @newExamen.fecha}
        respond_to do |format|
            format.json { render :json => info }
        end
    end

    def buscarExamen
        fecha = Time.now
        fechaABuscar = fecha.strftime("%Y-%m-%d")
        examen = Exam.where('materium_id = ? and fecha >= ?', params[:id], fechaABuscar)
        res = []
        examen.each{ |acum|
            res.append({ "id" => acum.id, "materia" => acum.materium.materia, "fecha" => acum.fecha, "turno" => acum.turno.nomTurn })
        }
        respond_to do |format|
            format.json { render :json => res }
        end
    end

    def materiasSearch
        @materias = Materium.where('semestre_id = ?', params[:id])
        respond_to do |format|
            format.json { render :json => @materias }
        end
    end

    def preguntas
        @semestre = Semestre.all
    end

    def guardarPreguntas
        @pregunta = Question.new(params)
        @pregunta.save
    end

    def calificar
    end

    def resultados
    end

    def iniciar
    end
end
