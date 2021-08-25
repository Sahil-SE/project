class QuestionTraitsController < ApplicationController
    def new
        @question = Question.find(params[:question_id])
        @traits_all = Trait.all
        @traits = @question.traits
        @trait = QuestionTrait.new
    end

    def create
        @question = Question.find(params[:question_id])
        @question_trait = @question.question_traits.create(question_trait_params) #(trait_id: params[:trait][:id])
        if @question_trait.save
           # raise @question_trait.inspect
            redirect_to question_path(params[:casestudy_id], @question)
        else
            raise @question_trait.errors.inspect
            redirect_to add_traits_path
        end
    end

    private

    def question_trait_params
        # raise params.inspect
        params.require(:question_trait).permit(:trait_id)
    end

end
