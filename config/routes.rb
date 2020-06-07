Rails.application.routes.draw do

  #get ( "/text", { :controller => "", :action => ""})
  #get ( "/label", { :controller => "", :action => ""})


  #web
  get( "/web", { :controller => "magic", :action => "web_form" })

  post( "/process_web", { :controller =>"magic", :action => "web_results"})
  

  


  # =============================

  root("vision#homepage")

  get("/vision/:detector", { :controller => "vision", :action => "form" })
  post("/vision/:detector", { :controller => "vision", :action => "magic" })

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
