class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options presence: true, format: { with: /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/ ,message: "半角英数字のみで入力して下さい" } do
    validates :password
  end

  validates :nickname, presence: true
  validates :date_of_birth, presence: true
  validates :last_name, presence: true
  validates :last_name_kana, presence: true

end
