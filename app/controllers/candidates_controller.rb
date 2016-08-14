class CandidatesController < ApplicationController
before_action :set_image, only: [:create,:destroy,:update]

def create 
	@candidate= @image.candidates.new(candidate_params)
	if  @candidate.content.empty?
		redirect_to @image, alert: "Empty content is not allowed!"
	elsif @candidate.save 
		redirect_to @image, notice: "Candidates successfully added!"
	else 
		redirect_to @image, alert: "Unable to add new candidate!"
	end

end

def destroy 
	@candidate= @image.candidates.find(params[:id])
    @candidate.destroy
    redirect_to @image, notice: "Candidate deleted!"	
end


def update
	@candidate=@image.candidates.find(params[:id])
	@candidate.votes+=1
	if @candidate.save
		redirect_to @image, notice: "Votes updated!"
    else
    	redirect_to @image, alert: "Vote Failed!" 
    end
end

private
	def set_image
		@image= Image.find(params[:image_id])
	end

	def candidate_params 
		params.require(:candidate).permit(:content, :votes)
	end

end
