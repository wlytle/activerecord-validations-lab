class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 205 }
  validates :category, inclusion: { in: %w(Fiction Nonfiction), message: "%{value} is not a valid category " }
  validate :clickbaity

  def clickbaity
    if title.present? && !title.match?("Won't Believe" || "Secret" || "Top /\d/")
      errors.add(:not_clickbaity_enough, "Yo Dawg, jazz it up. I don't even want to click this!")
    end
  end
end
