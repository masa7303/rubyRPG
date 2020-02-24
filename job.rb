#剣士クラスを決める
class Soldier
    
    attr_accessor :name,:power, :speed, :defense, :physical, :skill, :skill2, :money, :keyword
    
    
    def initialize(**boxs)
        @name       =   boxs[:name]
        @power      =   boxs[:power]
        @speed      =   boxs[:speed]
        @defense    =   boxs[:defense]
        @physical   =   boxs[:physical]
        @skill      =   boxs[:skill]
        @skill2     =   boxs[:skill2]
        @money      =   boxs[:money]
        @keyword    =   boxs[:keyword]
        
    end
    
    #バトル時のステータス
    def own_status
        "[自分のターン]#{@name.chomp}:[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical}]"
    end
    
    #体力がなくなった
    def defeated?
        @physical <= 0
    end
    
    #ダメージ計算
    def taken_damage(power,defense)
        @physical -= (power - defense)
        
    end
    
    #剣士クラスのパラメーター
    def soldier_parameters
        
        printf "[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical},能力:#{@skill},能力2:#{@skill2},所持金:#{@money}円]"
    end
    
    #剣士クラスを選択
    def selecter
        puts "《「#{@name.chomp}」は、「剣士」を選びました!》"
    end
    
end


#遊び人クラスを決める
class Playboy
    
    attr_accessor :name,:power, :speed, :defense, :physical, :skill, :skill2, :money, :keyword
    
    
    def initialize(**boxs)
        @name       =   boxs[:name]
        @power      =   boxs[:power]
        @speed      =   boxs[:speed]
        @defense    =   boxs[:defense]
        @physical   =   boxs[:physical]
        @skill      =   boxs[:skill]
        @skill2     =   boxs[:skill2]
        @money      =   boxs[:money]
        @keyword    =   boxs[:keyword]
    end
    
    #バトル時のステータス
    def own_status
        "[自分のターン]#{@name.chomp}:[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical}]"
    end
    
    #体力がなくなった
    def defeated?
        @physical <= 0
    end
    
    #ダメージ計算
    def taken_damage(power,defense)
        @physical -= (power - defense)
        
    end
    
    # 遊び人クラスのパラメーター
    def playboy_parameters
        
        printf "[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical},能力:#{@skill},能力2:#{@skill2},所持金:#{@money}円]"
    end
    
    # 遊び人クラスを選択
    def selecter
        puts "《「#{@name.chomp}」は、「遊び人」を選びました!》"
    end
    
end


#シーフクラスを決める
class Thief
    
    attr_accessor :name,:power, :speed, :defense, :physical, :skill, :skill2, :money, :keyword
    
    
    def initialize(**boxs)
        @name       =   boxs[:name]
        @power      =   boxs[:power]
        @speed      =   boxs[:speed]
        @defense    =   boxs[:defense]
        @physical   =   boxs[:physical]
        @skill      =   boxs[:skill]
        @skill2     =   boxs[:skill2]
        @money      =   boxs[:money]
    end
    
    #バトル時のステータス
    def own_status
        "[自分のターン]#{@name.chomp}:[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical}]"
    end
    
    #体力がなくなった
    def defeated?
        @physical <= 0
    end
    
    #ダメージ計算
    def taken_damage(power,defense)
        @physical -= (power - defense)
        
    end
    
    #シーフクラスのパラメーター
    def thief_parameters
        
        printf "[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical},能力:#{@skill},能力2:#{@skill2},所持金:#{@money}円]"
    end
    
    # 遊び人クラスを選択
    def selecter
        puts "《「#{@name.chomp}」は、「シーフ」を選びました!》"
    end
    
end
