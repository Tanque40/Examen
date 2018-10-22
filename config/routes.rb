Rails.application.routes.draw do
  devise_for :administrators
  get 'administrador/welcome', as: :welcome
  get 'administrador/index', as: :index
  get 'administrador/alumnos', as: :alumnos
  get 'administrador/examen', as: :examen
  get 'administrador/materiasSearch/:id', to: "administrador#materiasSearch"
  get 'administrador/desactivarExam/:id', to: "administrador#desactivarExam"
  get 'administrador/activarExam/:id', to: "administrador#activarExam"
  get 'administrador/buscarExamen/:id', to: "administrador#buscarExamen"
  get 'administrador/preguntas', as: :preguntas
  get 'administrador/calificar', as: :calificar
  get 'administrador/resultados', as: :resultados
  get 'alumno/index'
  get 'alumno/datos'
  get 'alumno/examen'
  post 'administrador/guardarExamen'
  post 'alumno/iniciar'
  root:to => 'alumno#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
