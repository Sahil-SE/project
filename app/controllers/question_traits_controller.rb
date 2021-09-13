class QuestionTraitsController < ApplicationController
    def new
        @question = Question.find(params[:question_id])
        @traits_all = Trait.all
       # @traits = @question.traits
        @question_trait = QuestionTrait.new
    end

    def create
        @question = Question.find(params[:question_id])
        @question_trait = @question.question_traits.new(question_trait_params) #(trait_id: params[:trait][:id])
        #raise @question_trait.errors.inspect
        if @question_trait.save
           # raise @question_trait.inspect
            redirect_to question_path(params[:casestudy_id], @question)
        else
            raise @question_trait.errors.inspect
            redirect_to add_traits_path
        end
    end

    def destroy
        @casestudy = Casestudy.find(params[:casestudy_id])
        @question = Question.find(params[:question_id])
       # @qt = QuestionTrait.where(question_id: :question_id, trait_id: params[:id])
        @qt = QuestionTrait.find(params[:id])
       # raise @qt.inspect
        @qt.destroy
        redirect_to question_path(@casestudy, @question)
    end

    private

    def question_trait_params
        # raise params.inspect
        params.require(:question_trait).permit(:question_id,:trait_id)
    end

end
