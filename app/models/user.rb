class User < ActiveRecord::Base
    validates :content, length: {in: 1..140}
#     バリデーションはモデルに記述します。
#     validates :titleとすることで、titleにバリデーションを設定することができます。
# 　　またpresence: trueとすることで、空の値で登録することを禁止します。
end
