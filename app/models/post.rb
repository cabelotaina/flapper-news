class Post < ActiveRecord::Base
  has_many :comments


  def as_jason(option = {})
    super(options.merge(include: :comments))
  end
end
