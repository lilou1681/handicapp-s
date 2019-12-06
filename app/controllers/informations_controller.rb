class InformationsController < ApplicationController
  def index
      if params[:query].present?
        sql_query = "title ILIKE :query OR content ILIKE :query"
        @informations = Information.where(sql_query, query: "%#{params[:query]}%")
      else
        @informations = Information.all
    end
  end
end
