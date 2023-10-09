class B2sController < ApplicationController
  before_action :set_b2, only: %i[ show edit update destroy ]

  # GET /b2s or /b2s.json
  def index
    @b2s = B2.all
  end

  # GET /b2s/1 or /b2s/1.json
  def show
  end

  # GET /b2s/new
  def new
    @b2 = B2.new
  end

  # GET /b2s/1/edit
  def edit
  end

  # POST /b2s or /b2s.json
  def create
    @b2 = B2.new(b2_params)

    respond_to do |format|
      if @b2.save
        format.html { redirect_to b2_url(@b2), notice: "B2 was successfully created." }
        format.json { render :show, status: :created, location: @b2 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @b2.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b2s/1 or /b2s/1.json
  def update
    respond_to do |format|
      if @b2.update(b2_params)
        format.html { redirect_to b2_url(@b2), notice: "B2 was successfully updated." }
        format.json { render :show, status: :ok, location: @b2 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @b2.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b2s/1 or /b2s/1.json
  def destroy
    @b2.destroy

    respond_to do |format|
      format.html { redirect_to b2s_url, notice: "B2 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b2
      @b2 = B2.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def b2_params
      params.require(:b2).permit(:name)
    end
end
