require './description'
require './job'
require './place'
require './monster'
require './casino'

puts "あなたの名前は？"

user_name = gets

description = Description.new(user_name)

#職業選択
description.job_choice

#職業選択
loop do

    set_num = gets.to_i

    # 0を選べば、「剣士」
    if set_num == 0

        soldier = Soldier.new(name: user_name, power: 10, speed: 2, defense: 6,
                              physical: 8, skill: 0, skill2: 0, money: 50, keyword: {1=>"",2=>"",3=>""})


                              # 戦士を選ぶ
                              puts soldier.selecter

                              # 戦士のパラメータ
                              puts soldier.soldier_parameters

                              # 始まり
                              description.prologue

                              loop do

                                  puts "【0: 家に行く, 1: ギルドに行く, 2: カジノに行く, 3: 武具店に行く, 4: 森に行く, 5: 門に行く】"
                                  set_num = gets.to_i

                                  # 家に行く
                                  if set_num == 0

                                      house = House.new(soldier.clone)
                                      house.house_prologue

                                      puts soldier.soldier_parameters

                                      # ギルドに行く
                                      elsif set_num == 1

                                      guild = Guild.new(soldier.clone)
                                      guild.guild_prologue

                                      puts soldier.soldier_parameters

                                      # カジノに行く
                                      elsif set_num == 2

                                      casino = Casino.new(soldier.clone)
                                      casino.casino_prologue

                                      puts soldier.soldier_parameters

                                      # 武具店に行く
                                      elsif set_num == 3

                                      shop = Shop.new(soldier.clone)
                                      shop.shop_prologue

                                      puts soldier.soldier_parameters

                                      # 森に行く
                                      elsif set_num == 4

                                      monst = Monst.new(name:'Devil', power: 10, speed: 5, defense: 7, physical: 13, sleeping: false)
                                      puts "《モンスターが襲いかかってきた！！》"

                                      battle = Battle.new(soldier.clone, monst.clone)
                                      battle.game_start

                                      # 門に行く
                                      elsif set_num == 5

                                      gate = Gate.new(soldier.clone)
                                      gate.gate_prologue

                                      puts soldier.soldier_parameters


                                  end

                              end
    end


    if set_num == 1

        playboy = Playboy.new(name: user_name, power: 10, speed: 2, defense: 6,
                              physical: 7, skill: 0, skill2: 0, money: 70, keyword: {1=>"",2=>"",3=>""})


                              # 戦士を選ぶ
                              puts playboy.selecter

                              # 戦士のパラメータ
                              puts playboy.playboy_parameters

                              # 始まり
                              description.prologue

                              loop do

                                  puts "【0: 家に行く, 1: ギルドに行く, 2: カジノに行く, 3: 武具店に行く, 4: 森に行く, 5: 門に行く】"
                                  set_num = gets.to_i

                                  # 家に行く
                                  if set_num == 0

                                      house = House.new(playboy.clone)
                                      house.house_prologue

                                      puts playboy.playboy_parameters

                                      # ギルドに行く
                                      elsif set_num == 1

                                      guild = Guild.new(playboy.clone)
                                      guild.guild_prologue

                                      puts playboy.playboy_parameters

                                      # カジノに行く
                                      elsif set_num == 2

                                      casino = Casino.new(playboy.clone)
                                      casino.casino_prologue

                                      puts playboy.playboy_parameters

                                      # 武具店に行く
                                      elsif set_num == 3

                                      shop = Shop.new(playboy.clone)
                                      shop.shop_prologue

                                      puts playboy.playboy_parameters

                                      　　# 森に行く
                                      　　      elsif set_num == 4

                                      monst = Monst.new(name:'Devil', power: 10, speed: 5, defense: 7, physical: 13, sleeping: false)
                                      puts "《モンスターが襲いかかってきた！！》"

                                      battle = Battle.new(playboy.clone, monst.clone)
                                      battle.game_start

                                      # 門に行く
                                      elsif set_num == 5

                                      gate = Gate.new(playboy.clone)
                                      gate.gate_prologue

                                      puts playboy.playboy_parameters

                                  end

                              end
    end


    if set_num == 2

        thief = Thief.new(name: user_name, power: 10, speed: 2, defense: 6,
                          physical: 8, skill: 0, skill2: 0, money: 50, keyword: {1=>"",2=>"",3=>""})


                          # 戦士を選ぶ
                          puts thief.selecter

                          # 戦士のパラメータ
                          puts thief.thief_parameters

                          # 始まり
                          description.prologue

                          loop do

                              puts "【0: 家に行く, 1: ギルドに行く, 2: カジノに行く, 3: 武具店に行く, 4: 森に行く, 5: 門に行く】"
                              set_num = gets.to_i

                              # 家に行く
                              if set_num == 0

                                  house = House.new(soldier.clone)
                                  house.house_prologue

                                  puts thief.thief_parameters

                                  # ギルドに行く
                                  elsif set_num == 1

                                  guild = Guild.new(soldier.clone)
                                  guild.guild_prologue

                                  puts thief.thief_parameters

                                  # カジノに行く
                                  elsif set_num == 2

                                  casino = Casino.new(soldier.clone)
                                  casino.casino_prologue

                                  puts thief.thief_parameters

                                  # 武具店に行く
                                  elsif set_num == 3

                                  shop = Shop.new(soldier.clone)
                                  shop.shop_prologue

                                  puts thief.thief_parameters

                                  　　# 森に行く
                                  　　      elsif set_num == 4

                                  monst = Monst.new(name:'Devil', power: 10, speed: 5, defense: 7, physical: 13, sleeping: false)
                                  puts "《モンスターが襲いかかってきた！！》"

                                  battle = Battle.new(soldier.clone, monst.clone)
                                  battle.game_start

                                  # 門に行く
                                  elsif set_num == 5

                                  gate = Gate.new(soldier.clone)
                                  gate.gate_prologue

                                  puts thief.thief_parameters


                              end

                          end
    end
end
