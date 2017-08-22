class Cat < ApplicationRecord

COLORS= %w[Black White Green Blue Red Grey]

  validates :color, :inclusion => {:in=> COLORS,
  :message => "color is invalid" }
  validates :sex, :inclusion => {:in=> ['M', 'F'],
  :message => "sex is invalid" }



  def age
  ((Date.today-self.birth_date)/365).to_i
  end
end
