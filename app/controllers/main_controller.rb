class MainController < ApplicationController
  def index
  end

  def secret
    unless current_user
      render plain: '401 Unauthorized', status: :unauthorized
    end
  end
end
