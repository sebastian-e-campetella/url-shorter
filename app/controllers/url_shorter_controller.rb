class UrlShorterController < JSONAPI::ResourceController

  def index
    url = UrlShorter.find_by(url_short: url_params[:url])
    url_redirect = /(http|https):\/\//.match(url.url).nil? ? "http://#{url.url}" : url.url
    url.visit!
    redirect_to url_redirect, status: :temporary_redirect 
  rescue Exception => e
    url = { error: "#{e} Not found" }
    respond_to do |f|
      f.any{render json: url.to_json, content_type: 'application/json'  }
    end
  end

  def url
    url_short = UrlShorter.create(url_params)
    respond_to do |f|
      f.any{render json: url_short.to_json, content_type: 'application/json'  }
    end
  end


	def url_detail
		url = UrlShorter.find_by(url_short: url_params[:url])
    url = JSONAPI::ResourceSerializer.new(UrlShorterResource).serialize_to_hash(UrlShorterResource.new(url, context))

		respond_to do |f|
			f.any{render json: url, content_type: 'application/json'  }
		end
	end
protected

  def url_params
    params.permit(:url, :url_short)
  end

end

