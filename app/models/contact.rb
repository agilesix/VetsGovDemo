class Contact < ActiveRecord::Base
  validates :email, :message, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validate :my_validation_method


  # hold hash style
  #:my_key => 'some value'
  #'my_key' => 'some value'

  # new hash style
  #my_key: 'some_value'

  private

  def my_validation_method
  	# do fancy validation
  end
end
