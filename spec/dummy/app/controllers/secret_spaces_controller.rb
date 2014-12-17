class SecretSpacesController < ApplicationController
  acts_as_token_authentication_handler_for User

  before_action :set_secret_space, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    @secret_spaces = SecretSpace.all
    respond_with(@secret_spaces)
  end

  def show
    respond_with(@secret_space)
  end

  def new
    @secret_space = SecretSpace.new
    respond_with(@secret_space)
  end

  def edit
  end

  def create
    @secret_space = SecretSpace.new(secret_space_params)
    @secret_space.save
    respond_with(@secret_space)
  end

  def update
    @secret_space.update(secret_space_params)
    respond_with(@secret_space)
  end

  def destroy
    @secret_space.destroy
    respond_with(@secret_space)
  end

  private
    def set_secret_space
      @secret_space = SecretSpace.find(params[:id])
    end

    def secret_space_params
      params.require(:secret_space).permit(:text)
    end
end
