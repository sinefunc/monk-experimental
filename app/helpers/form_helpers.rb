class Main
  module FormHelpers
    def h(str)
      Rack::Utils.escape_html(str)
    end

    # Draws a checkbox with a label.
    def labeled_checkbox(label, name, value, options={})
      id = options.delete(:id) || name

      attrs = options.map { |(k, v)| " #{h k}='#{h v}'" }.join('')

      [ "<label#{attrs} class='checkbox' for='#{id}'>",
        checkbox(name, value, :id => id),
        "<span>#{h label}</span>",
        "</label>"
      ].join("\n")

    end

    # Draws a checkbox with a hidden field.
    def checkbox(name, value=nil, options={})
      selected = ''
      selected = " checked='1'"  if value
      attrs = options.map { |(k, v)| " #{h k}='#{h v}'" }.join('')

      [ "<input type='hidden' name='#{name}' value='0'>" +
        "<input#{attrs} type='checkbox' name='#{name}' value='1'#{selected}>"
      ].join("\n")
    end

    def select_options(items, active='', value_field=:id, name_field=:to_s)
      items.map do |item|
        selected = ''
        selected = " selected='1'"  if item == active
        [ "<option value='#{h item.try(value_field)}'#{selected}>",
          h(item.try(name_field)),
          "</option>" ].join('')
      end.join("\n")
    end
  end

  helpers FormHelpers
end
