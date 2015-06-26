class Image < ActiveRecord::Base

  belongs_to :identity
  mount_uploader :photo, PhotoUploader
  enum category: %w(portrait landscape city\ exploration nature animals)

  validates :name, :category, presence: true

  #Permisos de lectura y transformación de texto.
  def tags_text
    self.tags.join(', ')
  end

  #Permisos de escritura con map recoremos los elementos del arreglo.
  def tags_text=(value)
    self.tags = value.split(',').map{ |tag| tag.strip }
  end
end
