require 'yaml'
require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'date'
require 'trello'

raw_config = File.read("config.yml")
CONFIG = YAML.load(raw_config)

# https://trello.com/1/authorize?&response_type=token&expiration=never&scope=read,write&name=GA%20Trello&key=b4dc5a60306950190babfa10d85ea7d6

Trello.configure do |config|
  config.developer_public_key = CONFIG['trello']['key']
  config.member_token = CONFIG['trello']['token']
end

board = Trello::Board.find(CONFIG['cohort']['id'])
start_date = Date.parse CONFIG['cohort']['starts']
board_start_date = board.lists[1].cards[1].due.to_date
difference_in_days = (start_date.mjd - board_start_date.mjd) + 1

board.lists.reverse.each do |list|
  puts list.name
  list.cards.reverse.each do |card|
    if card.due
      card_start_date = card.due.to_date
      card_new_start_date = card_start_date + difference_in_days
      strf = "%a %b %d"
      date_transform = "#{card_start_date.strftime(strf)} => #{card_new_start_date.strftime(strf)} || "
      card.due = card_new_start_date
    end
    puts card.save ? "    #{date_transform}#{card.name}" : "crap, error"
  end
end