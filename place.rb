# 家
class House
    
    attr_accessor :own
    
    def initialize(user)
        
        @own = user
    end
    
    #家
    def house_prologue
        
        puts "《ここは、「#{@own.name.chomp}」の家です！何をしますか？》"
        
        loop do
            
            puts "【0: 寝る, 1: 家族と話す 2: 家をでる】"
            
            num_house = gets.to_i
            
            if num_house == 0
                
                puts "#{@own.name.chomp}:『スッキリした！』"
                
                elsif num_house == 1
                
                puts "父: 『行くのか・・・餞別に合言葉を教えてやる。１文字目は'き'だ』"
                
                @own.keyword.store(1,"き")
                
                puts "現時点での合言葉「#{@own.keyword.values}」"
                
                elsif num_house == 2
                
                puts "《家を出ました》"
                
                break
                
                else
                
                puts "《番号で選択してください》"
            end
            
        end
    end
end


# 店
class Shop
    
    attr_accessor :name, :power, :speed, :defense, :physical, :skill, :money
    attr_accessor :own
    
    def initialize(user)
        
        @own = user
    end
    
    #店
    def shop_prologue
        
        puts "《ここは、お店です！何をしますか？》"
        
        loop do
            
            puts "【0: 買う,1: 店をでる】"
            
            num_shop = gets.to_i
            
            if num_shop == 0
                
                # 店の場面
                shop_situation
                
                elsif num_shop == 1
                
                puts "《お店を出ました》"
                
                break
                
                else
                puts "《番号で選択してください》"
            end
        end
        
        
    end
    
    # 店員との会話
    def shop_situation
        
        
        puts "何か買うのかい？"
        
        loop do
            
            
            puts "【0: 買う, 1: 戻る】"
            
            num_shop = gets.to_i
            
            if num_shop == 0
                
                # 買い物
                shop_selecter
                
                elsif num_shop == 1
                
                break
                
                else
                
                puts "《番号で選択してください》"
                
            end
            
        end
    end
    
    # 買い物
    def shop_selecter
        
        loop do
            puts "【0: 武器(200円), 1: 防具(100円), 2: 戻る】"
            puts "《現在の所持金: #{@own.money}円です》"
            puts "《現在の攻撃力: #{@own.power} , 現在の防御力: #{@own.defense}》"
            
            num_shop = gets.to_i
            
            if num_shop == 0
                
                # 武器を買う
                shop_wepon
                
                break
                
                
                elsif num_shop == 1
                
                # 防具を買う
                shop_armor
                
                break
                
                elsif num_shop == 2
                
                break
                
                else
                
                puts "《番号で選択してください》"
                
                break
            end
        end
    end
    
    # 武器を買うのか？
    def shop_wepon
        
        loop do
            
            if @own.money >= 200
                
                @own.money -= 200
                @own.power += 5
                
                puts "お金が「200円」減った"
                puts "攻撃力が,[5]上がった！"
                
                break
                
                else
                puts "金が足りないぜ"
                
                break
            end
        end
    end
    
    # 防具を買うのか？
    def shop_armor
        
        loop do
            
            if @own.money >= 100
                
                @own.money -= 100
                @own.defense += 3
                
                puts "お金が「100円」減った"
                puts "防御力が,[3]上がった！"
                
                break
                
                else
                puts "金が足りないぜ"
                
                break
            end
        end
    end
end


# 門
class Gate
    
    attr_accessor :name, :power, :speed, :defense, :physical, :skill, :money
    attr_accessor :own
    
    def initialize(user)
        
        @own = user
    end
    
    #門
    def gate_prologue
        
        puts "《ここから先は合言葉を知っている実力のある者しか通れないぞ》"
        puts "【0: 知っている,1: 出直してくる】"
        
        num_gate = gets.to_i
        
        loop do
            
            if num_gate == 0
                
                # 店の場面
                gate_situation
                
                elsif num_gate == 1
                
                break
                
                else
                puts "《番号で選択してください》"
            end
        end
    end
    
    
    #合言葉のチェック
    def gate_situation
        
        loop do
            
            if keyword == {1=> "き",2=> "ず",3=> "な"}
                puts "「正解だ」"
                puts "おめでとうございます！ゲームクリアです！"
                break
                
                elsif
                puts "合言葉が合わないな。出直してきな"
                break
                
            end
            
        end
        
    end
    
end


# ギルド
class Guild
    
    attr_accessor :name, :power, :speed, :defense, :physical, :skill, :money
    attr_accessor :own
    
    def initialize(user)
        
        @own = user
    end
    
    #ギルド
    def guild_prologue
        
        puts "《ここは、ギルドです！何をしますか？》"
        
        loop do
            
            puts "【0: 依頼を探す, 1: 出る】"
            
            num_guild = gets.to_i
            
            if num_guild == 0
                
                # 店の場面
                guild_situation
                
                
                
                elsif num_guild == 1
                
                puts "《ギルドを出ました》"
                
                break
                
                else
                
                puts "《番号で選択してください》"
                
            end
        end
    end
    
    
    #受付との会話
    def guild_situation
        
        
        puts "今出ている依頼はこれです"
        puts "0: 探し物ミッション【難易度★,報酬100円】, 1: 討伐ミッション【難易度★★★,報酬？？？】"
        puts "依頼を受けますか？"
        
        loop do
            
            
            puts "【0: 探し物ミッションを受ける, 1: 討伐ミッションを受ける, 2: ギルドを出る】"
            
            num_guild = gets.to_i
            
            if num_guild == 0
                
                #探し物ミッション
                search_mission
                
                
                elsif num_guild == 1
                
                #討伐ミッション
                subjugation_mission
                
                elsif num_guild == 2
                
                break
                
                else
                
                puts "《番号で選択してください》"
            end
            
        end
    end
    
    #探し物ミッション
    def search_mission
        
        puts "これは依頼主が飼っている猫を探す依頼です"
        puts "どこを探しに行きますか？"
        puts "【0: 岬, 1: 林, 2: 路地裏】"
        
        cat = rand(0..2)
        
        loop do
            
            num_search = gets.to_i
            
            if num_search == cat
                
                puts "猫を見つけました！"
                
                @own.money += 100
                
                # 所持金の結果の表示をしてあげる
                puts "プラス100円なので、現在の所持金#{@own.money}円です"
                break
                
                elsif num_search != cat
                
                puts "「ここにはいないようだ・・・」"
                puts "「次はどこを探しますか？」"
                
            end
            
        end
        
    end
    
    def subjugation_mission
        
        puts "これは依頼主からの魔物討伐の依頼です"
        puts "討伐には相応の実力が必要です。（攻撃力：●,防御力：●）"
        puts "それでも行きますか？"
        puts "【0: 洞窟へ行く,1: 出直してくる】"
        
        num_monster = gets.to_i
        
        if num_monster == 0
            
            #モンスターを討伐に行く
            battle_monster
            
            elsif num_monster == 1
            
            guild_situation
            
        end
        
    end
    
end
