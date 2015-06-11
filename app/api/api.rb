require 'grape-swagger'

class API < Grape::API	
	prefix 'api'
	version 'v0.1', using: :path

	rescue_from ActiveRecord::RecordNotFound do |e|
		Rack::Response.new({
			error_code: 404,
			error_message: e.message
		}.to_json, 401).finish
	end

	rescue_from :all do |e|
		Rack::Response.new({
			error_code: 500,
			error_message: e.message
		}.to_json, 500).finish
	end

	mount Music::Store	
	add_swagger_documentation api_version:'v0.1', mount_path: "/docs", markdown: nil unless Rails.env.production?
end