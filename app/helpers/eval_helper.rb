module EvalHelper
	def init_eval()
        @casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy = @casestudy_user.casestudy
		@questions = @casestudy.questions
        @questions.each do |question|
		  @question_traits = question.question_traits
          @question_traits.each do |question_trait|
            @assessor_response = @casestudy_user.assessor_responses.find_or_create_by(user_id: @casestudy_user.user_id, assessor_id: @casestudy_user.assessor_id, rating: 0.0 , question_trait_id: question_trait.id)
			# raise @assessor_reponse.inspect
          end
        end
	end

	def start_eval()
		@casestudy_user.save
	end

	def final_submit
		@casestudy_user = CasestudyUser.find(params[:casestudy_user_id])
		@casestudy_user.status = 3
		# @casestudy_user.completed_time = Time.now
		@casestudy_user.save
		sign_out current_user
	end
end