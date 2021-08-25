class TraitsController < ApplicationController
    def new
        @trait = Trait.new
    end

    def create
        @trait = Trait.new(trait_params)
        if @trait.save
            # raise @question.errors.inspect
            redirect_to traits_path
        else

            #raise @question.errors.inspect
            render :new            
        end
    end

    def show
        @trait = Trait.find(params[:id])
    end
    
    def index
        @traits = Trait.all
    end

    def edit
        @trait = Trait.find(params[:id])
    end

    def update
        @trait = Trait.find(params[:id])

        if @trait.update(trait_params)
            redirect_to @trait
        else
            render :edit
        end
    end
    
    private
        def trait_params
            params.require(:trait).permit(:name)
        end
end
