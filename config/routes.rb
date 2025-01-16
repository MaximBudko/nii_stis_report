# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
    get '/report' , to: 'report#index'
    post '/report', to: 'report#generate', as: 'generate_report'
end