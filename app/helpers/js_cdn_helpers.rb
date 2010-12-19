class Main
  module JsCdnHelpers
    def jquery(version='1.4.4', fallback_url='/js/jquery.js')
      google_cdn_js "jquery/#{version}/jquery.min.js", fallback_url
    end

    def jquery_ui(version='1.8.5', fallback_url='/js/jqueryui.js')
      google_cdn_js "jqueryui/#{version}/jquery-ui.min.js", fallback_url
    end

    def google_cdn_js(remote_path, fallback_url)
      remote_url = "http://ajax.googleapis.com/ajax/libs/#{remote_path}"
      cdn_js remote_url, fallback_url
    end

    def cdn_js(remote_url, fallback_url)
      if settings.production?
        "<script type='text/javascript' src=\"#{remote_url}\"></script>"+
        "<script>!window.jQuery && document.write('<script src=\"#{fallback_url}\"><\\/script>')</script>"
      else
        "<script type='text/javascript' src='#{fallback_url}'></script>"
      end
    end
  end

  helpers JsCdnHelpers
end
