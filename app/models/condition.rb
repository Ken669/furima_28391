class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '新品' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '汚れ・傷なし' },
    { id: 4, name: '傷・汚れ少々' },
    { id: 5, name: '傷・汚れ' },
    { id: 6, name: '全体的に状態が悪い' }
  ]
end
