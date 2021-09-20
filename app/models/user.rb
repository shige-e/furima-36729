class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates_format_of :password, with: PASSWORD_REGEX, message: ' is invalid. Include both letters and numbers'
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, presence: true,
                          format: { with: NAME_REGEX, message: ' is invalid. Input full-width characters' }
  validates :first_name, presence: true,
                         format: { with: NAME_REGEX, message: ' is invalid. Input full-width characters' }
  NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, presence: true,
                               format: { with: NAME_KANA_REGEX, message: ' is invalid. Input full-width katakana characters' }
  validates :first_name_kana, presence: true,
                              format: { with: NAME_KANA_REGEX, message: ' is invalid. Input full-width katakana characters' }
  validates :birth_day, presence: true
end
