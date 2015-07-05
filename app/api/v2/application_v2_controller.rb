module V2
	class ApplicationV2Controller < Grape::API
		version 'v2', using: :path
		mount V2::MusicStoresController
		# add_swagger_documentation api_version:'v2', mount_path: "/docs", markdown: nil unless Rails.env.production?
	end
end