module ApplicationHelper
  def image_categories
    #Se utiliza el metodo inject para hash o elementos
    Image.categories.inject({}) do |hash, elem|
      hash.merge!(t("categories.#{elem.first.gsub(' ', '_')}") => elem.first)
    end
  end
end
