# Implementing a stock_picker method.
# It should take an array of stock prices, one for each hypothetical day.
# The method should return the best day to buy (like the lowest price), and the best day to sell (highest price).
# You must buy before you can sell.
# We should also pay attention to edge cases, like when the lowest day is the last day or the highest day is the first day, in which case we couldn't satisfy the previous rule.
#
def stock_picker(prices)
  return [] if prices.empty? || prices.length == 1

  min_price_index = 0
  max_profit = 0
  best_days = [0, 0]
  prices.each_with_index do |price, current_day|
    min_price_index = current_day if price < prices[min_price_index]

    current_profit = price - prices[min_price_index]

    if current_profit > max_profit
      max_profit = current_profit
      best_days = [min_price_index, current_day]
    end
  end
  best_days
end

# Example usage
def generate_random_array
  length = rand(10..40)
  array = (1..35).to_a.shuffle
  array.first(length)
end

# prices = generate_random_array
prices = [35, 34, 1, 16, 19, 5, 24, 30, 17, 25, 20, 8, 12, 11, 31, 18, 33, 32, 10, 9, 27, 6, 26, 4]
puts "Today's prices are #{prices}."
result = stock_picker(prices)

# Incremented both days by 1 to display in a more human readable way.
puts "Buy on day #{result[0] + 1} and sell on day #{result[1] + 1} for a maximum profit of #{prices[result[1]] - prices[result[0]]}."
