Допустим у нас есть простенькая иерархия моделей:

 
class Course
  has_many :materials
end

# paperclip.async_storage загружает
# file в AWS S3 через sidekiq

class Material
  belongs_to :course

  has_attached_file :file, styles: { thumb: "100x>" }, storage: Paperclip.async_storage
end
 
Задача: реализовать service-класс, с методом который на вход принимает курс, и затем создает новый (сохраненный в БД объект course) объект, скопированный из оригинала со всеми дочерними сущностями и вложениями (file например). Вызов метода должен быть асинхронный (а-ля delayed job)

class Service

  def
end