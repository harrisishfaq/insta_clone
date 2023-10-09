class B1sController < ApplicationController
  before_action :set_b1, only: %i[ show edit update destroy ]

  # GET /b1s or /b1s.json
  def index
    @b1s = B1.all
  end

  # GET /b1s/1 or /b1s/1.json
  def show
  end

  # GET /b1s/new
  def new
    @b1 = B1.new
  end

  # GET /b1s/1/edit
  def edit
  end

  # POST /b1s or /b1s.json
  def create
    @b1 = B1.new(b1_params)

    respond_to do |format|
      if @b1.save
        format.html { redirect_to b1_url(@b1), notice: "B1 was successfully created." }
        format.json { render :show, status: :created, location: @b1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @b1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /b1s/1 or /b1s/1.json
  def update
    respond_to do |format|
      if @b1.update(b1_params)
        format.html { redirect_to b1_url(@b1), notice: "B1 was successfully updated." }
        format.json { render :show, status: :ok, location: @b1 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @b1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /b1s/1 or /b1s/1.json
  def destroy
    @b1.destroy

    respond_to do |format|
      format.html { redirect_to b1s_url, notice: "B1 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_b1
      @b1 = B1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def b1_params
      params.require(:b1).permit(:name)
    end
end
