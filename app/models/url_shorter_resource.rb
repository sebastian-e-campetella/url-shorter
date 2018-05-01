class UrlShorterResource < JSONAPI::Resource
  attributes :url, :url_short

  filters :url, :url_short
end
