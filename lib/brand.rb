class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true, :length => { :maximum => 100})
  validates :name, uniqueness: true


  before_save(:titlecase_name)


  private

  def titlecase_name
    self.name = name.split.map(&:capitalize).join(' ')
  end
end
