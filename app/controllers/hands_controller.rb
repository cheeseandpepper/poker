class HandsController < ApplicationController
  def index
    scope = Hand.all
    if params[:page]
      @page  = params[:page].to_i
      @hands = scope.limit(limit).offset(offset)
    else
      @page  = 1
      @hands = scope.limit(limit)
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