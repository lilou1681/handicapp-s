class InformationsController < ApplicationController
  def index
    sql_query = " \
        informations.title ILIKE :query \
        OR informations.content ILIKE :query \
      "
      if params[:query].present?
        @informations = Information.where(title: params[:query])
      else
        @informations = Information.all
    end
  end
end
