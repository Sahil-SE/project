class CasestudiesController < ApplicationController
load_and_authorize_resource

    def new
        @casestudy = Casestudy.new
    end

    def create
        @casestudy = Casestudy.new(casestudy_params)
        @casestudy.contentcreator = current_user
        if @casestudy.save
            # raise @casestudy.errors.inspect
            redirect_to @casestudy
        else

            raise @casestudy.errors.inspect
            render :new            
        end
    end

    def show
        @casestudy = Casestudy.find(params[:id])
    end
    
    def index
        @casestudies = Casestudy.all
    end

    def edit
        @casestudy = Casestudy.find(params[:id])
    end

    def update
        @casestudy = Casestudy.find(params[:id])

        if @casestudy.update(casestudy_params)
            redirect_to @casestudy
        else
            render :edit
        end
    end
    
    private
        def casestudy_params
            params.require(:casestudy).permit(:tile, :duration, :scale)
        end
        
end