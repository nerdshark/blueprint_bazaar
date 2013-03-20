module ProjectsHelper
  # @param [Project] project
  # @param [Integer] minimum_votes
  def calculate_bayesian_rating(project, minimum_votes)
    total_votes = (project.upvotes + project.downvotes)
    net_votes = project.upvotes - project.downvotes
    average_vote = net_votes / total_votes
    ((total_votes/minimum_votes) * average_vote) + ((minimum_votes/(total_votes+minimum_votes)) * 0.5)
  end

  def sort_projects_by_bayesian()
    #@sorted_projects = Array.new
    #projects.each do |project|

    #end
  end
end
