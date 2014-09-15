Rails.application.routes.draw do
  root 'pastes#new'

  resource :paste, except: :show

  get 'paste/:token' => 'pastes#show', as: :show_paste
end
