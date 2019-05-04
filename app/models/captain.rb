class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    #nested joings boats => classifications
    self.joins(boats: :classifications).group('boats.id').where('classifications.name = "Catamaran"')
  end

  def self.sailors
    self.joins(boats: :classifications).group('boats.id').where('classifications.name = "Sailboat"').uniq
  end

  def self.talented_seafarers
    self.joins(boats: :classifications).group('boats.id').having('classifications.name': "Motorboat" && "Sailboat").sort
  end

  def self.non_sailors
    self.joins(boats: :classifications).group('boats.id').having('classifications.name = "Sailboat"')
  end
end
