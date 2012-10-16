Rhet::Application.routes.draw do
  get '/topics', { :controller => 'topics', :action => 'intro' }
end
