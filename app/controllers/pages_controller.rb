class PagesController < ApplicationController
    def new
        @page = Page.new
    end

    def create
        # raise params.inspect
        @page = Page.new(page_params)
        @page.casestudy_id = params[:casestudy_id]
        if @page.save
            # raise @page.errors.inspect
            redirect_to page_path(params[:casestudy_id], @page)
        else

             #raise @page.errors.inspect
            render :new            
        end
    end

    def show
        @page = Page.find(params[:id])
    end
    
    def index
        @pages = Page.all
    end

    def edit
        @page = Page.find(params[:id])
    end

    def update
        @page = Page.find(params[:id])

        if @page.update(page_params)
            redirect_to @page
        else
            render :edit
        end
    end

    private
        def page_params
            params.require(:page).permit(:tile, :body)
        end
end
