class Post < ActiveRecord::Base
  belongs_to :user

  after_initialize :set_defaults
  before_validation :set_defaults
  after_create :log_event

  validates :title, :body, presence: true

  mount_uploader :image, ImageUploader

  def self.in_range(start, finish)
    where('created_at >= ? AND created_at <= ?', start, finish)
  end

  private

  def set_defaults
    # self.title = "New Post" unless title
    # self.title ||= "New Post"
    if title.blank?
      self.title = "New Post"
    end
    
    if body.blank?
      self.body = "You forgot to puts some stuffs here = ("
    end
  end

  def log_event
    puts "Post was created? Hurray?????"
  end
end
