module V1
	class ApplicationV1Controller < Grape::API
		prefix 'api'
		version 'v1', using: :path
		mount V1::MusicStoresController
		add_swagger_documentation api_version:'v1', mount_path: "/docs", markdown: nil unless Rails.env.production?
	end
end