# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Your code Here
  @candidates.each do |candidate|
    if candidate['id'] == id
      return candidate
    end
  end
end
  
  def experienced?(candidate)
    # Your code Here
    candidate['years_of_experience'] >= 2
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    selected_candidates = []
    candidates.each do |candidate|
      if experienced?(candidate) && enough_points(candidate) && tech_stacks(candidate) && age(candidate) && last_applied(candidate)
        selected_candidates.push(candidate)
      end
    end
  end
  
  # More methods will go below

  def enough_points(candidate)
    candidate['github_points'] >= 100
  end

  def tech_stacks(candidate)
    candidate['languages'].any? { |language| language == 'Ruby' || language == 'Python' }
  end

  def age(candidate)
    candidate['age'] > 17
  end

  def last_applied(candidate)
    candidate['date_applied'] < 15.days.ago.to_date
  end