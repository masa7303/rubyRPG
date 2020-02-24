# カジノ
class Casino
    
    attr_accessor :name, :power, :speed, :defense, :physical, :skill, :money
    attr_accessor :own
    
    def initialize(user)
        
        @own = user
    end
    
    # カジノを始める
    def casino_start(num_preminu)
        odds = num_preminu
        hit_flag = true
        
        loop do
            
            #サイコロ２つを投げる
            sai = rand(1..6)
            sai2 = rand(1..6)
            
            #２つのサイコロの和を出している
            sum = sai + sai2
            
            puts "2つのサイコロの和は？"
            
            #遊び人の場合
            if @own.speed > 8
                
                #３分の１の確率で答えを知ることができる
                cheat = rand(3)
                if cheat == 0
                    puts "#{@own.name}の頭に数字が降りてきた！"
                    puts "合計 #{sum}"
                end
                
            end
            
            puts "【1: 偶数, 2: 奇数】"
            
            answer = gets.to_i
            
            puts "１つ目のサイコロ  #{sai}"
            puts "２つ目のサイコロ  #{sai2}"
            
            puts "合計 #{sum}"
            
            
            
            #結果が偶数
            if sum % 2 == 0
                
                if answer == 1
                    
                    puts "正解です！"
                    odds += (odds * 4)
                    puts "《現在の賭け金は「#{odds}円です」》"
                    
                    elsif answer == 2
                    
                    puts "残念！外れました・・・"
                    hit_flag = false
                    
                end
                
                　#結果が奇数
                　elsif sum % 2 == 1
                
                if answer == 1
                    
                    puts puts "残念！外れました・・・"
                    hit_flag = false
                    
                    elsif answer == 2
                    
                    puts "正解です！"
                    odds += (odds * 4)
                    puts "《現在の賭け金は「#{odds}円です」》"
                    break
                    
                end
                
            end
            
            
            # 続けるか聞く
            puts "《続けますか？》"
            puts "【1:　続ける, 1以外: やめる】"
            
            num_question = gets.to_i
            
            #続ける
            if num_question == 1
                
                puts "《続ける》"
                
                #続けない
                else
                
                puts "《やめた》"
                break
                
            end
            
        end
        
        # 結果を所持金にプラスかマイナスをする
        if hit_flag == true
            @own.money += odds
            
            # 所持金の結果の表示をしてあげる
            puts "プラス#{odds}円なので、現在の所持金#{@own.money}円です"
            
            
            elsif hit_flag == false
            @own.money -= num_preminu
            
            # 所持金の結果の表示をしてあげる
            puts "マイナス#{num_preminu}円なので、現在の所持金#{@own.money}円です"
            
        end
        
    end
    
    
    #丁半ゲームの場面
    def saikoro_situation
        
        loop do
            puts "《現在の所持金: #{@own.money}円です》"
            puts "《賭け金を決めてください ※上限は、１００円》"
            
            # 賭け金
            num_preminu = gets.to_i
            
            if num_preminu <= 0 || num_preminu > 100
                
                puts "「＊賭け金は、1~100円です」"
                
                elsif num_preminu > @own.money
                
                puts "『＊現在、あなたの所持金は、#{@own.money}なので、上限は#{@own.money}です』"
                
                
                elsif num_preminu <= 100
                
                puts "#{num_preminu}円賭けました"
                puts "スタート！！"
                
                casino_start(num_preminu)
                
                break
                
                else
                puts "《数字で選んでください》"
                
            end
        end
    end
    
    #ブラックジャックの場面
    def blackjack_prologue
        
        loop do
            puts "《現在の所持金: #{@own.money}円です》"
            puts "《賭け金を決めてください ※上限は、１００円》"
            
            # 賭け金
            num_preminu = gets.to_i
            
            if num_preminu <= 0 || num_preminu > 100
                
                puts "「＊賭け金は、1~100円です」"
                
                elsif num_preminu > @own.money
                
                puts "『＊現在、あなたの所持金は、#{@own.money}なので、上限は#{@own.money}です』"
                
                
                elsif num_preminu <= 100
                
                puts "#{num_preminu}円賭けました"
                puts "スタート！！"
                
                blackjack_start(num_preminu)
                
                break
                
                else
                puts "《数字で選んでください》"
                
            end
        end
    end
    
    #ブラックジャックのプレー
    def blackjack_start(num_preminu)
        
        #ディーラーとプレイヤーの手札
        dealer_cards = []
        player_cards = []
        
        while player_cards.length < 2
            player_cards.push(rand(1..11))
            
            if player_cards.length == 2
                puts "あなたの手札は #{player_cards} です"
            end
            
        end
        
        while dealer_cards.length < 2
            dealer_cards.push(rand(1..11))
            
            if dealer_cards.length == 2
                puts "ディーラーの手札は ？ と #{dealer_cards[1]} です"
            end
        end
        
        #２枚手札を引いた時点での勝敗の処理
        #合計が21を超えた場合の処理
        if dealer_cards.inject(:+) > 21
            puts "あなたの勝ちです"
            exit
            
            #合計が21ちょうどだった時
            elsif dealer_cards.inject(:+) == 21
            puts "ディーラーがブラックジャックです！あなたの負けです！"
            exit
        end
        
        #合計が21を超えた場合の処理
        if player_cards.inject(:+) > 21
            puts "あなたの負けです"
            exit
            
            #合計が21ちょうどだった時
            elsif player_cards.inject(:+) == 21
            puts "ブラックジャックです！あなたの勝ちです！"
            exit
        end
        
        #21以下の時の行動
        while player_cards.inject(:+) < 21
            
            puts "1: カードを引く, 2: カードを引かない"
            action = gets.to_i
            
            #カードを引く場合
            if action == 1
                player_cards.push(rand(1..11))
                
                #21を超えた場合は負け
                if player_cards.inject(:+) > 21
                    puts "あなたの現在の手札は #{player_cards} で、合計は #{player_cards.inject(:+)} です"
                    puts "あなたの負けです"
                    break
                    
                    elsif player_cards.inject(:+) == 21
                    puts "ブラックジャックです！あなたの勝ちです！"
                    
                    #２文字目の合言葉
                    @own.keyword.store(2,"ず")
                    puts "現時点での合言葉「#{@own.keyword.values}」"
                    exit
                    
                    else
                    puts "あなたの現在の手札は #{player_cards} で、合計は #{player_cards.inject(:+)} です"
                end
                
                elsif action == 2
                puts "引くのをやめました"
                break
            end
        end
        
        
        #ディーラーは17を超えるまで引き続ける
        if dealer_cards.inject(:+) < 17
            dealer_cards.push(rand(1..11))
            
            if dealer_cards.inject(:+) > 21
                puts "ディーラーがバーストしました！"
                exit
                
                elsif dealer_cards.inject(:+) > 17
                exit
            end
            
        end
        
        
        
        #結果判定
        #ディーラーのカードが21を超えた時
        if dealer_cards.inject(:+) > 21
            puts "あなたの手札 #{player_cards} 　合計  #{player_cards.inject(:+)} "
            puts "ディーラーの手札 #{dealer_cards} 　合計  #{dealer_cards.inject(:+)} "
            puts "あなたの勝ちです"
            
            #ディーラーの方が21に近い
            elsif dealer_cards.inject(:+) > player_cards.inject(:+)
            puts "あなたの手札 #{player_cards} 　合計  #{player_cards.inject(:+)} "
            puts "ディーラーの手札 #{dealer_cards} 　合計  #{dealer_cards.inject(:+)} "
            puts "あなたの負けです"
            
            #勝ち
            else
            puts "あなたの手札 　　#{player_cards} 　合計  #{player_cards.inject(:+)} "
            puts "ディーラーの手札 #{dealer_cards} 　合計  #{dealer_cards.inject(:+)} "
            puts "あなたの勝ちです"
        end
        
    end
    
    #カジノ
    def casino_prologue
        
        puts "《ようこそ、ここは「カジノです」》"
        puts "《何をしますか？》"
        
        loop do
            
            puts "【1: 丁半ゲーム,2: ブラックジャック, 3: 戻る】"
            puts "《現在の所持金: #{@own.money}円です》"
            
            
            
            num_casino = gets.to_i
            
            if num_casino == 1
                
                if @own.money <= num_casino
                    puts "お金を持っていない.."
                    
                    break
                    
                    elsif @own.money >= num_casino
                    
                    saikoro_situation
                    
                    break
                end
                
                elsif num_casino == 2
                
                blackjack_prologue
                
                break
                
                
                elsif num_casino == 3
                
                puts "《出て行きました》"
                
                break
                
                else
                "《番号を選んでください》"
            end
        end
    end
end
