
FactoryBot.define do
    factory :plan do
      title { 'Factoryで作ったデフォルトのタイトル１' }
      content { 'Factoryで作ったデフォルトのコンテント１' }
      start_time { '2022/10/28' }
      limit_time { '2022/10/27'}
    end
    factory :second_plan, class: Plan do
      title { 'Factoryで作ったデフォルトのタイトル２' }
      content { 'Factoryで作ったデフォルトのコンテント２' }
      start_time { '2022/10/28' }
      limit_time { '2022/10/27' }
    end
    factory :thrid_plan, class: Plan do
      title { 'Factoryで作ったデフォルトのタイトル3' }
      content { 'Factoryで作ったデフォルトのコンテント3' }
      start_time { '2022/10/28' }
      limit_time { '2022/10/27' }
    end
  end