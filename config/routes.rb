Rhet::Application.routes.draw do

	get '/topics', { :controller => 'topics', :action => 'intro' }
	get '/home', { :controller => 'home', :action => 'index' }
	get '/about', { :controller => 'about', :action => 'aboutus' }

end
