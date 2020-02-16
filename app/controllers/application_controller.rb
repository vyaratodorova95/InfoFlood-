class ApplicationController < ActionController::Base
protect_from_forgery with: :exception

def redirect_if_not_found
logger.error "Attempt to access non-existent #{request.controller_class}#{params[:id]}"
flash[:notice] = 'Sorry, but that doesn\'t exist.'
redirect_to(country_index_url)
end

def redirect_if_information_not_found
logger.error "Attempt to access non-existent #{request.controller_class}#{params[:id]}"
flash[:notice] = 'Sorry, but that doesn\'t exist.'
redirect_to(information_index_url)
end

def redirect_if_location_not_found
logger.error "Attempt to access non-existent #{request.controller_class}#{params[:id]}"
flash[:notice] = 'Sorry, but that doesn\'t exist.'
redirect_to(location_index_url)
end

end

