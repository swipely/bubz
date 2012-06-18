Rails.application.routes.draw do

  get "pages/stubme"

  get "pages/hitme"

  mount Bubz::Engine => "/bubz"
end
