Rails.application.routes.draw do
  root                'static_pages#home'
  devise_for          :users

  resources           :venues do
    resources           :events do
      resources           :tickets, only: [:index, :show]
      resources           :ticket_options, except: :show
    end
  end
end
