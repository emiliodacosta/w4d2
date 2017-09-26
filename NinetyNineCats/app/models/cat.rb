# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'date'


class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, inclusion: { in: %w(brown black gray white orange), message: "%{value} is not a valid color" }
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }

  def age

    cat_age = time_ago_in_words(self.birth_date)
  end

end
