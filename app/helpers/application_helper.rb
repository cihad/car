module ApplicationHelper

  def tree_render_nested_groups(groups)
    content_tag(:ol) do
      groups.map do |model, sub_groups|
        content_tag(:li, {id: dom_id(model), class: "border-bottom py-2"} ) do

          s = content_tag(:div, {class: 'd-flex'}) do
            (
              model.name +
              '<span class="ml-auto">'+price_for(model.price)+'</span>'
            ).html_safe
          end
          (s + tree_render_nested_groups(sub_groups)).html_safe
        end

      end.join.html_safe
    end
  end

  def tree_render_nested_groups_form(groups, form)
    content_tag(:ol) do
      groups.map do |model, sub_groups|
        content_tag(:li, {id: dom_id(model), class: "border-bottom py-2"} ) do

          s = content_tag(:div, {class: 'd-flex'}) do
            (
              model.name +
              (model.childless? ? "<span class='ml-auto'>#{price_for(model.price)}</span>" : "")+
              (model.childless? ? price_field(model, form) : '')
            ).html_safe
          end
          (s + tree_render_nested_groups_form(sub_groups, form)).html_safe
        end

      end.join.html_safe
    end
  end

  def price_field model, form
    form.fields_for :models, model do |model_form|
      model_form.fields_for :prices, model_form.object.prices.new do |price_fields|
        content_tag :div, {class: "input-group input-group-sm ml-3", style: "flex: 0 0 200px;"} do
          (
            price_fields.number_field(:price, class: "form-control") +
            content_tag(:div, {class: "input-group-append"}) do
              price_fields.select(:currency, Price::CURRENCIES, {}, {class: 'form-control form-control-sm'})
            end
          ).html_safe
        end
      end
    end
  end


  def price_for price
    if price
      unit_format = case price.currency
                when "TRY"
                  ["TL", "%n %u"]
                when "USD"
                  ["$", "%u%n"]
                when "EUR"
                  ["€", "%u%n"]
                else
                  ["TL", "%n %u"]
                end

      number_to_currency(
        price.price,
        unit: unit_format.first,
        format: unit_format.last,
        precision: 0,
        delimiter: ".")
    else
      "???"
    end
  end
end
