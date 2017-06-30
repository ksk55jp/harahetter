class Tweet < ActiveRecord::Base
  validates :content, presence: true
  validates :content, length: { maximum: 140 }
  #validates :taberukoto_inclusion

  def taberukoto_inclusion
    ["食べる","飯","おやつ","ラーメン","お腹がすいた",""].foreach do  |keyword|
    end
    unless content.lik
      errors.add(:date, ": 過去の日付は使用できません")
    end
  end
  #validates :content, taberukoto: true
  #validates :content, inclusion: { in: %w(食べる 麺　パン　お腹がすいた 食った) }  # NG : 全体が一致していないとだめ
end
