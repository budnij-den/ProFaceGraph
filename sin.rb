require 'sinatra'
require 'shotgun'
#require 'HTTParty'
require 'httparty'

@@boardIds=['5d32d945cb40e80e51529fcc','5d3327f2960d453956aca29b','5d3327dc34f60a427f4319cc','5d3327c175e0612f0d4b21c1','5d3324abc623791e9e75d408']
@@site='https://api.trello.com/1/boards/'
level='/cards'

@@keytoken='key=4df9da93b9e3591255346830def40ff3&token=409385f5cf0e474004053123d31d5ce2407be980deec7ee5149f0fd7a158bf3a'
@@filter='closed'

#hierarchizer двумерный массив, псевдотаблица
@@hierarchizer=[]


# @@boardIds.each do |board|
# 	@@boardsUrls<<@@site+board+'?'+'fields=name'+'&'+@@keytoken
# 	@@boardsCardsUrls<<@@site+board+level+'?'+'fields=due,closed,dueComplete'+'&'+@@keytoken
# 	trashHash={}
# 	trashHash=HTTParty.get(@@boardsUrls[-1]).parsed_response #parent
# 	trashArray=[]
# 	trashArray<<trashHash
# 	trashArray<<HTTParty.get(@@boardsCardsUrls[-1]).parsed_response #linked cards
# 	@@hierarchizer<<trashArray
# end


get '/index' do
	#массив урлов досок
	@boardsUrls=[]
	#массив урлов карточек досок
	@boardsCardsUrls=[]
	#очищаем псевдокэш
	@@hierarchizer=[]
	@@boardIds.each do |board|
		@boardsUrls<<@@site+board+'?'+'fields=name'+'&'+@@keytoken
		@boardsCardsUrls<<@@site+board+level+'?'+'fields=due,closed,dueComplete'+'&'+@@keytoken
		trashHash={}
		trashHash=HTTParty.get(@boardsUrls[-1]).parsed_response #parent
		trashArray=[]
		trashArray<<trashHash
		trashArray<<HTTParty.get(@boardsCardsUrls[-1]).parsed_response #linked cards
		@@hierarchizer<<trashArray
	end
  erb :index
end

get '/gui' do
	#массив урлов досок
	@boardsUrls=[]
	#массив урлов карточек досок
	@boardsCardsUrls=[]
	#очищаем псевдокэш
	@@hierarchizer=[]
	@@boardIds.each do |board|
		@boardsUrls<<@@site+board+'?'+'fields=name'+'&'+@@keytoken
		@boardsCardsUrls<<@@site+board+level+'?'+'fields=due,closed,dueComplete'+'&'+@@keytoken
		trashHash={}
		trashHash=HTTParty.get(@boardsUrls[-1]).parsed_response #parent
		trashArray=[]
		trashArray<<trashHash
		trashArray<<HTTParty.get(@boardsCardsUrls[-1]).parsed_response #linked cards
		@@hierarchizer<<trashArray
	end
	erb :generalView
end

get '/private' do
	#массив урлов досок
	@boardsUrls=[]
	#массив урлов карточек досок
	@boardsCardsUrls=[]
	#очищаем псевдокэш
	@@hierarchizer=[]
	@@boardIds.each do |board|
		@boardsUrls<<@@site+board+'?'+'fields=name'+'&'+@@keytoken
		@boardsCardsUrls<<@@site+board+level+'?'+'fields=due,closed,dueComplete'+'&'+@@keytoken
		trashHash={}
		trashHash=HTTParty.get(@boardsUrls[-1]).parsed_response #parent
		trashArray=[]
		trashArray<<trashHash
		trashArray<<HTTParty.get(@boardsCardsUrls[-1]).parsed_response #linked cards
		@@hierarchizer<<trashArray
	end
	erb :private
end