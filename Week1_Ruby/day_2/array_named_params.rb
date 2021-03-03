#!/usr/bin/ruby -w

# В Ruby нет именнованых параметров у массивов,
# но это ограничение можно попробовать обойти через хеши

def tell_the_truth(option = {})
  if option[:profession] == :lawyer
    'Можно сказать, что это это почти наверняка не ложь!'
  else
    true
  end
end

khem = tell_the_truth
puts "If the function was called without any value: #{khem}"

khem = tell_the_truth profession: :lawyer
puts "If the function was called with a value: #{khem}"
