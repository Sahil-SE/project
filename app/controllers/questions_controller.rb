class QuestionsController < ApplicationController
    def new
        @question = Question.new
    end

    def create
        @question = Question.new(question_params)
        @question.casestudy_id = params[:casestudy_id]
        if @question.save
            # raise @question.errors.inspect
            redirect_to question_path(params[:casestudy_id], @question)
        else

            raise @question.errors.inspect
            render :new            
        end
    end

    def show
        @question = Question.find(params[:id])
        @traits = @question.traits
        # raise @traits.inspect
    end
    
    def index
        @casestudy = Casestudy.find(params[:casestudy_id])
        @questions = @casestudy.questions
    end

    def edit
        #raise params.inspect
        @casestudy = Casestudy.find(params[:casestudy_id])
        
        @questions = Question.find(params[:id])
       # @questions.casestudy_id = @casestudy.id
    end

    def update
        #raise params.inspect

        @casestudy = Casestudy.find(params[:casestudy_id])

        @question = @casestudy.questions.find(params[:id])

        
        if @question.update(question_params)
            redirect_to question_path(params[:casestudy_id], @question)
        else
            render :edit
        end
    end
    
    def destroy
        @question = Question.find(params[:id])
        
        if @question.destroy
            redirect_to casestudy_questions_path
        end
    end
    # def assign_traits
    #     #raise params.inspect
    #     @question = Question.find(params[:id])

    #     @traits = Trait.all
    #     @question_trait = QuestionTrait.new
        
    # end

    private
        def question_params
            params.require(:question).permit(:tile, :body)
        end
    
end
