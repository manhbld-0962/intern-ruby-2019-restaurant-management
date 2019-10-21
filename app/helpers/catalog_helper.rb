module CatalogHelper
  def get_image catalog
    catalog.image? ? catalog.image.url : "catalog/catalog1.jpeg"
  end
end
