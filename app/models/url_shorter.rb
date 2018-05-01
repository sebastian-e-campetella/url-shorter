class UrlShorter < ApplicationRecord

  before_save :set_url_shorted
  before_validation :set_url_shorted

  validates :url, presence: true, allow_blank: false
  validates :url_short, presence: true, uniqueness: true, allow_blank: false


  def set_url_shorted
    self.url_short = UrlShorter.count if self.url_short.nil?
  end

  def visit!
    self.update(visit_count: self.visit_count+1)
  end
end
