class Link < ActivePStore::Base
  attr_accessor :trimmed_url
  attr_accessor :short_url
  attr_accessor :original_url

  def generate_short_url
    if (link = Link.find_by(trimmed_url: self.trimmed_url))
      self.short_url = link.short_url
    else
      self.short_url = Base64.encode64(self.trimmed_url)[0..6]
      self.save
    end
  end

  def trim_url
    self.trimmed_url = self.original_url.scan(/^(?:https?:)?(?:\/\/)?(?:www*.)?([^\/\?]+)/).flatten.first
  end

end

