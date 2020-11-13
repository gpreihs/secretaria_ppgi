class RequestDocumentationController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request, only: [:show, :destroy]
    before_action :is_prof?, only: [:show, :destroy]

    def show 
    end

    def index
        @requests = current_user.requests
    end

    def create
        @request = Request.new(user: current_user, title: 'Nova Solicitacao', description: 'Abrir nova solicitacao')

        respond_to do |format|
            if @request.save
                format.html {redirect _to "/requests/#{@request.id}"}
            else
                format.html {redirect_to main_app.root_url, notice: @request.errors}
                
            end
        end
    end

    def destroy
        @request.destroy

        respond_to do |format|
            format.json {render json: true}
        end
    end

    def set_request
        @request = Request.find(params[:id])
    end

    private

    def request_params
        params.require(:request).permit(:date, :hour, :status).merge(user: current_user)
    end
