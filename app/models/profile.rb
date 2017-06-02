class Profile < ActiveRecord::Base
  belongs_to :user

  validate :need_name, :no_sue_men, :two_genders

  def need_name
    #byebug
    if (last_name.nil?) && (first_name.nil?)
      errors.add(:last_name, "cannot be null if first name is null")
    end
  end

  def no_sue_men
    if (first_name == "Sue") && (gender == "male")
      errors.add(:gender, "male cannot be named Sue")
    end
  end

  def two_genders
    if (gender != "male") && (gender != "female") && (gender)
      errors.add(:gender, "gender must be male, female or nil")
    end
  end

  scope :get_all_profiles, -> (min_yr, max_yr){where("birth_year>= ? AND birth_year<=?", "#{min_yr}", "#{max_yr}").order(birth_year: :asc)}
end
