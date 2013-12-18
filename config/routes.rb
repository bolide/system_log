SystemLog::Engine.routes.draw do
  get "system_log/index"
  get 'system_log/clear'
  root :to => 'system_log#index'
end