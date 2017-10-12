class Article < ApplicationRecord

  scope :tag, ->(tag) { Article.includes(:tags)
                         .where(tags: { title: tag})}

  scope :subtag, ->(tag) { Article.includes(:subtags)
                         .where(subtags: { title: tag})}


  belongs_to :user
  has_many :asts
  has_many :tags, through: :asts
  has_many :subtags, through: :asts

  accepts_nested_attributes_for :tags, :subtags, :asts

  validates :title, :content, presence: true
  validates :content, length: {minimum: 15}

  def all_tags=(titles)
    self.tags = titles.split(",").map do |title|
        Tag.where(title: title.strip).first_or_create!
    end
  end

  def all_subtags=(titles)
    self.subtags = titles.split(",").map do |title|
      Subtag.where(title: title.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:title).join(", ")
  end

  def all_subtags
    self.subtags.map(&:title).join(", ")
  end

  def list_all_unique_tags
    tags.map(&:title).uniq
  end

  def list_all_unique_subtags
    subtags.map(&:title).uniq
  end

end
