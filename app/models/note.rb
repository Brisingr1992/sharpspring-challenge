class Note < ApplicationRecord
  belongs_to :user

  validate :field_presence
  before_save :update_title

  private 

  def field_presence
    if title.nil? and body.nil?
      errors.add(:note, 'Need Both title and body!')
    end
  end

  def update_title
    assign_attributes({ :title => body[0, 30] }) unless title?
  end
end
