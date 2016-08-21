class CandidatesController < ApplicationController
before_action :set_image,:set_vote, only: [:create,:destroy,:update,:reset]

def create 
	@candidate= @image.candidates.new(candidate_params)
	if @vote.voted?
		redirect_to @image, alert: "You've voted! Add new candidate is not allowed"
	elsif  @candidate.content.empty?
		redirect_to @image, alert: "Empty content is not allowed!"
	else
		@candidate.votesum+=1
		@candidate.ownership= current_user.id
		if @candidate.save && 
			@vote.voted=@candidate.id
			@vote.save
			@image.update_status
			redirect_to @image, notice: "Candidates successfully added!"
		else 
		redirect_to @image, alert: "Unable to add new candidate!"
		end
	end
	
end

def update
	if  @vote.voted?
		redirect_to @image, alert: "You've voted!"
	else
		@candidate=@image.candidates.find(params[:id])
		@candidate.votesum+=1
		
		if @candidate.save 
			@vote.voted=@candidate.id
			@vote.save
			@image.update_status
			redirect_to @image, notice: "Votes updated!"
	    else
	    	redirect_to @image, alert: "Vote Failed!" 
	    end
	    
	end
	
end



def destroy 
	@candidate= @image.candidates.find(params[:id])
    @candidate.destroy
    @vote.reset
    @image.update_status
    redirect_to @image, notice: "Candidate deleted!" 
end


def reset
	#delete the new candidate user created
	# or just downvote 
	if @vote.voted?
		@can=@image.candidates.find(@vote.voted)
		if @can.ownership==current_user.id  
			@can.destroy
		else 
			@can.votesum-=1
		end
		
		if @can.save
			@vote.reset
			@image.update_status
			redirect_to @image, notice: "Reset Successfully!"
		else 
			redirect_to @image, alert:"Reset Failed!"
		end
	else 
		redirect_to @image
	end
end


private
	
	def set_image
		@image= Image.find(params[:image_id])
	end

	def set_vote
		@vote = current_user.votes.find_by(image:@image)
	end

	def candidate_params 
		params.require(:candidate).permit(:content, :votesum, :ownership)
	end

end
