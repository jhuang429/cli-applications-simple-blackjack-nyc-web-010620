require "pry"

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card
  rand(1..10)
end

def display_card_total(total)
  puts "Your cards add up to #{total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  cards = 0
  cards += deal_card
  cards += deal_card
  display_card_total(cards)
  cards
end

def hit?(num)
  prompt_user
  action = get_user_input
  if action == "s"
    num
  elsif action == "h"
    num += deal_card
    display_card_total(num)
    num
  else
    while action != 's' || action != 'h' do
      invalid_command
      prompt_user
      action = get_user_input
      num
    end
  end
end

def invalid_command
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  hand = initial_round
  while hand < 22 do
    hand = hit?(hand)
  end
  end_game(hand)
end
