# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  # Your code Here
  @candidates.each do |candidate|
    if candidate['id'] == id
      return candidate
    end
end
  
  def experienced?(candidate)
    # Your code Here
    if candidate['years_of_experience'] > 2
      return true
    else
      return false
    end
  end
  
  def qualified_candidates(candidates)
    # Your code Here
    selected_candidates = []
    candidates.each do |candidate|
      if experienced?(candidate) && enough_points(candidate) && tech_stacks(candidate) && age(candidate) && last_applied(candidate)
        selected_candidates.push(candidate)
      end
  end
  
  # More methods will go below

  def enough_points(candidate)
    if candidate['github_points'] >= 100
      return true
    else
      return false
    end
  end

  def tech_stacks(candidate)
    if candidate['languages'].include?('Python' || 'Ruby')
      return true
    else
      return false
    end
  end

  def age(candidate)
    if candidate['age'] > 17
      return true
    else
      return false
    end
  end

  def last_applied(candidate)
    if candidate['date_applied'] < 15.days.ago.to_date
      return true
    else
      return false
    end
  end