class UrlShorterResource < JSONAPI::Resource
  attributes :url, :url_short, :visit_count
end
