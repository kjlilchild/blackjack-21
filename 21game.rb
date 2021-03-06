def dealer_first()
    dealer1 = rand(1..11)
    if dealer1 == 1
        dealer1 == 11
        return dealer1
    end
    puts "The Dealer is Showing: #{dealer1}"
    return dealer1
end

# This is a method that is called to draw a card.
def hit()
    card_1 = rand(1..10) 
end

# Method for player card selection. Hit and Stay.
def player()
    #generates two random cards for the player.
    card_1 = rand(1..11)
    card_2 = rand(1..10)
    answer = card_1 + card_2

    puts "Your Cards: #{card_1} and #{card_2} = #{answer} "
    if answer == 21 
        puts "You Win!"
        exit
    end

    puts "Type in your answer: (hit|stay) CARD 3"
    choice = gets.chomp.downcase
    
    #Third card to be drawn.
    if choice.include? 'hit'
        answer += hit()
        puts "#{answer}"
        if answer == 21
            puts "You have #{answer}! You Win!"
            exit
        end
        if answer > 21
            puts "#{answer} Bust!"
            exit
        end
    elsif choice.include? 'stay'
        return answer
    end
    
    puts "(hit|stay) CARD 4"
    choice2 = gets.chomp.downcase
    
    #4th card to be drawn. 2nd Hit.

    if choice2.include? 'hit'
        answer += hit()
        if answer > 21
            puts "#{answer} Bust!"
            exit
        elsif answer == 21
            puts "#{answer}! You Win!"
            exit
        else 
            puts "#{answer}"
            puts "(hit|stay)"
            choice = gets.chomp.downcase
            
        end

        if choice.include? 'hit'
            answer += hit()
            if answer > 21
                puts "#{answer} Bust!"
                exit
            elsif answer == 21
                puts "#{answer}! You Win!"
                exit
            else
                puts "#{answer}"
            end
        else 
            choice.include? 'stay' 
            puts "#{answer}"
            return answer        
        end       
    end

    if choice2.include? 'stay'
        puts "#{answer}"
        return answer
    end

    puts "(hit|stay) CARD 5"
    choice3 = gets.chomp.downcase

    #5th and final card to be drawn
    if choice3.include? 'hit'
        answer += hit()
        puts "#{answer}"
        if answer <= 21
            puts "#{answer}5 Card Charlie! You Win!"
        end
        
        if answer > 21
            puts "#{answer} BUST! You Lose!"
        end
    end        
end      
      
def gameplay(dealer, player)
    puts " The Dealer has: #{dealer} | You have: #{player}"
    dealer2 = rand(1..10)
    answer = dealer2 + dealer

    until answer == 21 || answer > player do
        answer += hit()    
    end

    if answer > 21
        puts "The dealer has #{answer} | You have #{player}. You Win!"
        exit
    elsif answer == 21
        puts "The dealer has #{answer} | You have #{player}. You Lose!"
        exit
    elsif answer == player
        puts "The dealer has #{answer} | You have #{player}. You Lose!"
        exit
    elsif answer > player
        puts "The dealer has #{answer} | You have #{player}. You Lose!"
        exit
    else
        puts "The dealer has #{answer} | You have #{player}. You Win!"
        exit
    end
end

gameplay(dealer_first(), player())
