class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    render text:"<br><br>Contul dumneavoastra nu este inca autorizat pentru aceasta actiune. <br>Daca sunteti membru al Grupului Montan, veti primi cat de curand autorizare din partea unui administrator si email de confirmare.<br>Momentan puteti doar vizualiza pagina principala si indexul postarilor."
  end
end
