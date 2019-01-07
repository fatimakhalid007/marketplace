class User < ApplicationRecord
    authenticates_with_sorcery!
    has_many :user_item, dependent: :destroy
    has_many :item  ,through: :user_item

  # # validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  # # validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  # # validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  # # validates :email, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #VALID_CONTACT=/^(\+\d{2,4})?\s?(\d{10})$/
  #VALID_CONTACT='[\+]\d{2}[\(]\d{2}[\)]\d{4}[\-]\d{4}'
  VALID_CONTACT=/\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[-]?\d{4}\z/
  validates :name, presence: true
  validates :contact , length:{minimum:8} #,:numericality => true,:length => { :minimum => 10, :maximum => 15 }
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true
  before_save { self.email = email.downcase }
  validates :email, presence:true,format:     { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false }

   has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
   validates :contact, format:{ with:VALID_CONTACT }
   # validates_attachment :avatar, presence: true
   def like?(other_user)

   	user_item.find_by(user_id: other_user.id)
   end
end
 