class Project < ActiveRecord::Base
  has_many :projecttechnos, dependent: :destroy
  has_many :technos, :through => :projecttechnos

  attr_accessor :techs
  def attributes
    super.merge('techs' => self.techs)
  end
end