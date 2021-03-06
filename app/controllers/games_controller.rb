class GamesController < ApplicationController
  def index
    scope = Game.all.includes(:hands)
    if params[:page]
      @page  = params[:page].to_i
      @games = scope.limit(limit).offset(offset)
    else
      @page  = 1
      @games = scope.limit(limit)
    end
  end

  private
  def limit
    20
  end

  def offset
    limit * (params[:page].to_i - 1)
  end
end