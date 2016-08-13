class WordImagesController < ApplicationController
  before_action :set_word_image, only: [:show, :edit, :update, :destroy]

  # GET /word_images
  # GET /word_images.json
  def index
    @word_images = WordImage.all
  end

  # GET /word_images/1
  # GET /word_images/1.json
  def show
  end

  # GET /word_images/new
  def new
    @word_image = WordImage.new
  end

  # GET /word_images/1/edit
  def edit
  end

  # POST /word_images
  # POST /word_images.json
  def create
    @word_image = WordImage.new(word_image_params)

    respond_to do |format|
      if @word_image.save
        format.html { redirect_to @word_image, notice: 'Word image was successfully created.' }
        format.json { render :show, status: :created, location: @word_image }
      else
        format.html { render :new }
        format.json { render json: @word_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_images/1
  # PATCH/PUT /word_images/1.json
  def update
    respond_to do |format|
      if @word_image.update(word_image_params)
        format.html { redirect_to @word_image, notice: 'Word image was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_image }
      else
        format.html { render :edit }
        format.json { render json: @word_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_images/1
  # DELETE /word_images/1.json
  def destroy
    @word_image.destroy
    respond_to do |format|
      format.html { redirect_to word_images_url, notice: 'Word image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_image
      @word_image = WordImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def word_image_params
      params.require(:word_image).permit(:name, :url)
    end
end
