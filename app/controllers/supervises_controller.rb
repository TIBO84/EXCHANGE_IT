class SupervisesController < ApplicationController
  before_action :authenticate_user!

  def home
    @exchanges = Exchange.all
    @exchanges = @exchanges.order(id: :asc)
  end

  def stat
  end
end
