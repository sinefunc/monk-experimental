class Main
  get '/' do
    haml :home, :layout => :layout
  end
end

