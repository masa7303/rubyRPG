# モンスタークラス
class Monst

    attr_accessor :name,:power, :speed, :defense, :physical, :sleeping


    def initialize(**boxs)
        @name       =   boxs[:name]
        @power      =   boxs[:power]
        @speed      =   boxs[:speed]
        @defense    =   boxs[:defense]
        @physical   =   boxs[:physical]
        @sleeping   =   boxs[:sleeping]
    end

    # モンスターのパラメーター
    def monster_parameters

        printf "#{@name.chomp}:[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical}]"
    end

    #バトル時のステータス
    def own_status

        "[敵のターン]#{@name}:[攻撃力:#{@power},素早さ:#{@speed},防御力:#{@defense},体力:#{@physical}]"
    end

    #体力がなくなったか？
    def defeated?

        @physical <= 0
    end

    #ダメージ計算
    def taken_damage(power,defense)

        @physical -= (power - defense)

    end

end





# バトルクラス
class Battle

    attr_accessor :name,:power, :speed, :defense, :physical, :skill, :skill2, :sleeping
    attr_accessor :own, :emeny


    def initialize(user, monster)

        @turn_count = 0
        @players = [user, monster]
        @own = user
        @emeny = monster

    end


    # 逃げるコマンド
    def command_escape

        if @own.speed > 5

            puts "《逃げ帰りました》"
            puts "“ゲームオーバー”"
            puts "《次は、モンスターを倒せるように頑張りましょう！》"
            exit

            else

            puts "《逃げられない！？》"

        end


    end

    # 敗北
    def defeated?

        @physical <= 0

    end


    # ターン交代
    def turn_phaze

        @turn_count += 1
        @players.reverse! if @players.size.modulo(@turn_count).even?    #攻守交代
    end

    # 敗北したか調べる
    def game_over?

        @players.find(&:defeated?)

        if  @emeny.defeated?
            puts "《クリア！！！》"
            puts "『おめでとうございます！』"

            #３文字目の合言葉
            @own.keyword.store(3,"な")
            puts "現時点での合言葉「#{@own.keyword.values}」"
            exit

        elsif @own.defeated?

            puts "《ゲームオーバー》"
            puts "ヒント：　［店で装備を買いましょう］"
            exit
        end


    end

    #ステータス表示
    def print_situation

        puts @players.map(&:own_status)
    end


    # 戦い
    def battle

        attacker, defender = @players

        if attacker == @own
            defender.taken_damage(attacker.power, defender.defense)
        end
    end


    # コマンド選択
    def command

        attacker, defender = @players

        if attacker == @own
            puts "1: 攻撃,2: 魔法（ファイラ）,3: 魔法（スリープ）,4: 逃げる"

            elsif attacker == @emeny
            puts "1: 防御,4: 逃げる"
        end

    end

    # 戦いの場面
    def print_battle_situation

        attacker, defender = @players

        if attacker == @own

            #相手が眠っている状態の時
            if defender.sleeping
                puts [
                "「#{attacker.name.chomp}」の攻撃!!",
                "「#{defender.name.chomp}」は《#{(attacker.power - defender.defense) * 2}》のダメージを受けた！",
                "「#{defender.name.chomp}」は目覚めた!",
                ("「#{defender.name.chomp}」をやっつけた！" if defender.defeated?)
                ]

                else
                puts [
                "「#{attacker.name.chomp}」の攻撃!!",
                "「#{defender.name.chomp}」は《#{(attacker.power - defender.defense)}》のダメージを受けた！",
                ("「#{defender.name.chomp}」をやっつけた！" if defender.defeated?)
                ]
            end


            elsif attacker == @emeny

            if attacker.sleeping
                puts "「#{defender.name.chomp}」は眠っている！"

                else
                puts [
                "#{attacker.name.chomp}の攻撃",
                "#{defender.name.chomp}は#{(attacker.power - defender.defense)}のダメージを受けた！",
                ("「#{defender.name.chomp}」は、やられた..." if defender.defeated?)
                ]

            end

        end
    end

    # スリープの場面
    def print_sleep_situation

        attacker, defender = @players

        puts "「#{attacker.name.chomp}」はスリープの魔法を使った！"
        sleep_success = rand(2)

        #50％の確率で眠らせる
        if sleep_success == 0
            puts "ドラゴンを眠らせた！"
            defender.sleeping = true

            elsif sleep_success == 1
            　puts "しかし何も起こらなかった・・・"
            　break
        end
    end

    # ゲームスタート
    def game_start


        loop do


            print_situation #パラメーター表示

            command         #コマンド

            set = gets.to_i

            #攻撃を選択した時
            if set == 1

                battle                  #戦い
                print_battle_situation  #戦いの場面
                turn_phaze              #ターン交代
                break if game_over?

                #魔法（ファイラ）を選択した時
                elsif set == 2

                battle                  #戦い
                print_battle_situation  #戦いの場面
                turn_phaze              #ターン交代
                break if game_over?

                #魔法（スリープ）を選択した時
                elsif set == 3

                print_sleep_situation  #戦いの場面
                turn_phaze              #ターン交代
                break if game_over?

                elsif set == 4
                command_escape          #逃げる


                else
                puts "「１〜４」の数字を選んでください"
            end
        end
    end



end
