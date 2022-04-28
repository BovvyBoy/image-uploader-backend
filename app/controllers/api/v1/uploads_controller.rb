class Api::V1::UploadsController < ApplicationController
  before_action :set_upload, only: %i[ show update destroy ]

  # GET /uploads
  def index
    @uploads = Upload.all

    render json: @uploads.to_json(include: :images )
  end

  # GET /uploads/1
  def show
    @upload = Upload.find_by(title: params[:title])
    @picture = rails_blob_path(@upload.picture)

    render json: @upload.to_json(include: :images )
  end

  # POST /uploads
  def create
    @upload = Upload.new(upload_params)
    @picture = rails_blob_path(@upload.picture)

    if @upload.save
      render json: @upload, status: :created, location: @upload
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /uploads/1
  def update
    if @upload.update(upload_params)
      render json: @upload
    else
      render json: @upload.errors, status: :unprocessable_entity
    end
  end

  # DELETE /uploads/1
  def destroy
    @upload.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def upload_params
      params.require(:upload).permit(:title, :date, :picture)
    end
end
