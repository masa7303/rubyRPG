#説明
class Description
    attr_accessor :name
    
    def initialize(user_name)
        
        @name = user_name
        
        puts "ようこそ、#{@name.chomp}さん！"
    end
    
    #職業選択
    def job_choice
        
        puts "あなたの職業は？"
        
        puts "0: 剣士, 1: 遊び人, 2: シーフ"
        
    end
    
    # 始まり
    def prologue
        
        puts "このゲームのクリア条件は、「門番が知る３文字の合言葉を集めて村を出ること」です！"
        
        puts "では、まず行き先を決めてください！"
    end
    
end
