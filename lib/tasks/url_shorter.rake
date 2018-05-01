namespace :url_shorter do
  task expired_in_six_months: :environment do
    UrlShorter.where("created_at <= ?",6.months.ago).update(expired: 1)
  end
end
