class Main
  get '/js/app.js' do
    js = settings.js_files
    content_type :js
    last_modified js.mtime
    etag js.mtime.to_i
    cache_control :public, :must_revalidate, :max_age => 86400*30

    js.compressed
  end
end
