# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

RedmineApp::Application.routes.draw do
    get '/report' , to: 'report#index'
    post '/report', to: 'report#generate', as: 'generate_report'
    post '/planning', to: 'report#generate_planning', as: 'generate_planning'
    post '/project_report', to: 'report#project_report', as: 'project_report'
end