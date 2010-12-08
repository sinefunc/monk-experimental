class Main
  module TemplateHelpers
    def partial(what, locals={})
      haml what, { :layout => false }, locals
    end

    def extends(what, locals={})
      partial what, locals
    end
  end

  helpers TemplateHelpers
end
