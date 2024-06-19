Rails.application.routes.draw do
  # Ruta raíz (puedes cambiarla a lo que prefieras)
  root 'parametros#index'

  # Rutas para el recurso `parametros`
  resources :parametros

  # Otras rutas de ejemplo
  # get 'home/index'
  # resources :users
  # namespace :admin do
  #   resources :products
  # end

  # Ruta por defecto si ninguna otra coincide
  # get '*path' => redirect('/')
end
