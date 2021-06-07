class TvitsController < ApplicationController
  before_action :set_tvit, only: %i[ show edit update destroy ]

  # GET /tvits or /tvits.json
  def index
    @tvits = Tvit.all
    @tvit = Tvit.new
  end

  # GET /tvits/1 or /tvits/1.json
  def show
  end

  # GET /tvits/new
  def new
    @tvit = Tvit.new
  end

  # GET /tvits/1/edit
  def edit
  end

  # POST /tvits or /tvits.json
  def create
    @tvit = Tvit.new(tvit_params)

    respond_to do |format|
      if @tvit.save
        format.html { redirect_to @tvit, notice: "Tvit was successfully created." }
        format.json { render :show, status: :created, location: @tvit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tvit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tvits/1 or /tvits/1.json
  def update
    respond_to do |format|
      if @tvit.update(tvit_params)
        format.html { redirect_to @tvit, notice: "Tvit was successfully updated." }
        format.json { render :show, status: :ok, location: @tvit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tvit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tvits/1 or /tvits/1.json
  def destroy
    @tvit.destroy
    respond_to do |format|
      format.html { redirect_to tvits_url, notice: "Tvit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tvit
      @tvit = Tvit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tvit_params
      params.require(:tvit).permit(:tvit)
    end
end
