class DocsController < ApplicationController
  before_action :set_child, only: :index

  def index; end

  def create
    @doc = Doc.new(docs_params)
    @child = Children.find(params[:child_id])
    @doc.children = @child
    @doc.save
    redirect_to child_docs_path
  end

  # def order
  #   Doc.order(created_at: :desc)
  # #  SELECT "docs".* FROM "docs" ORDER BY "docs"."created_at" DESC
  # end

  private

  def set_child
    @child = Children.find(params[:child_id])
  end

  def docs_params
    params.require(:doc).permit(:name, :url, :file)
  end

end
