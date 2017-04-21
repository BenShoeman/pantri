module RecipessHelper

  def link_to_toggle_recipe_save(recipe)
    url = recipe_save_path(recipe)

    if recipe.saved?
      link_to_with_icon('icon-star', 'Save', url, {
        method: 'DELETE',
        remote: true,
        class: 'save btn btn-primary',
      })
    else
      link_to_with_icon('icon-star', 'Save', url, {
        method: 'PUT',
        remote: true,
        class: 'save btn',
      })
    end
  end

  def link_to_with_icon(icon_css, title, url, options = {})
    icon = content_tag(:i, nil, class: icon_css)
    title_with_icon = icon << ' '.html_safe << h(title)
    link_to(title_with_icon, url, options)
  end

end
