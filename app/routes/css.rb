class Main
  get '/css/:file.css' do |file|
    render_css :"css/#{file}", :scss
  end

  helpers do
    def render_css(path, type=:scss)
      fname = settings.root('app', 'views', path.to_s) + ".#{type}"
      not_found  unless File.exists?(fname)

      mtime = File.mtime(fname)

      if settings.production?
        last_modified mtime
        etag mtime.to_i
        cache_control :public, :must_revalidate, :max_age => 86400*30
      end

      content_type :css, :charset => 'utf-8'
      render type, path
    end
  end
end

