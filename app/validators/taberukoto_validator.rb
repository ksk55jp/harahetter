class TaberukotoValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)

    keyword= ["そば",'食べ','飯','メシ', 'ご飯', "ごはん",
    "ゴハン", "めん","eat","ate","lunch","dinner",
    "うどん","ガパオ","すし","ケバブ","アイス",
    "ステーキ","丼","パン","刺身","お好み","広島焼",
    "広島やき",
    "チャーハン","麺","寿司","味噌","みそ","ラーメン",
    "肉","ジンギスカン","クッパ","BBQ","バーベキュー",
    "breakfast","揚げ" ,"炒", "イタリアン"].join('|').upcase.tr('ぁ-ん','ァ-ン')

    unless value.upcase.tr('ぁ-ん','ァ-ン')=~ /#{keyword}/
      record.errors[attribute] << (options[:message] || "食べるものに関係あります？")
    end
  end
end
