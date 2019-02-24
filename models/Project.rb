class Project < ActiveRecord::Base
  has_many :projecttechnos, dependent: :destroy
  has_many :technos, :through => :projecttechnos

  # Adds an attribute to hold techs used
  # So I can do this Project.techs = ["wutever"]
  attr_accessor :techs
  def attributes
    super.merge('techs' => self.techs)
  end
end