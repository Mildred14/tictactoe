class TTT
    def position(tamano, tablero, respuesta_position)
        for i in 0...tamano 
            for j in 0...tamano
                if tablero[i][j] == respuesta_position
                    return [i],[j]
                end
            end
        end
    end
    def winner(tablero, player)
        #Rows
        if tablero[0][0] !=0 && tablero[0][1] !=0 && tablero[0][2] !=0
            if tablero[0][0] == tablero[0][1] && tablero[0][1]==tablero[0][2]
                return player
            end
        end
        
        if tablero[1][0] !=0 && tablero[1][1] !=0 && tablero[1][2] !=0
            if tablero[1][0] == tablero[1][1] && tablero[1][1]==tablero[1][2]
                return player
            end
        end
        
        if tablero[2][0] !=0 && tablero[2][1] !=0 && tablero[2][2] !=0
            if tablero[2][0] == tablero[2][1] && tablero[2][1]==tablero[2][2]
                return player
            end
        end
        #Columns
        if tablero[0][0] !=0 && tablero[1][0]!=0 && tablero[2][0] !=0
            if tablero[0][0] == tablero[1][0] && tablero[1][0]==tablero[2][0]
                return player
            end
        end
        if tablero[0][1] !=0 && tablero[1][1]!=0 && tablero[2][1]!=0
            if tablero[0][1] == tablero[1][1] && tablero[1][1]==tablero[2][1]
                return player
            end
        end
        if tablero[0][2] !=0 && tablero[1][2]!=0 && tablero[2][2]!=0
            if tablero[0][2] == tablero[1][2] && tablero[1][2]==tablero[2][2]
                return player
            end
        end
        #Diagonal
        if tablero[0][0] !=0 && tablero[1][1] !=0 && tablero[2][2]!=0
            if tablero[0][0] == tablero[1][1] && tablero[1][1] == tablero[2][2]
                return player
            end
         end
         if tablero[0][2] !=0 && tablero[1][1] !=0 && tablero[2][0]!=0
            if tablero[0][2] == tablero[1][1] && tablero[1][1] == tablero[2][0]
                return player
            end
         end
    end
    #This def fill can show you the number of positions
    def fill (tamano)
        @num = 1
        @limite_matriz = tamano-1 
        tablero = Array.new(tamano){ Array.new(tamano)}
        (0..@limite_matriz).each do |row|
            (0..@limite_matriz).each do |col|
                tablero[row][col] = @num
                @num += 1
            end
        end
        return tablero
    end 
    #This is my main board and with this function you fill it 
    def fill_principal (tamano)
        @num = 0
        #@limite_matriz = tamano-1 
        tablero = Array.new(tamano){ Array.new(tamano)}
        (0..@limite_matriz).each do |row|
            (0..@limite_matriz).each do |col|
                tablero[row][col] = @num
            end
        end
        return tablero
    end 
    #Print board with "X" and "O" in  dev fill()
    def print_board(tamano, tablero_principal)
        print "\n ******* Rellena tu tablero ******** \n"
        for i in 0...tamano
            print tablero_principal[i]
            print "\n"
        end
    end
    
        #Play tictactoe
    def play()
        tamano=3
        player_one ="X"
        player_two = "O"
        tablero=fill(tamano)
        tablero_principal = fill_principal(tamano)
        
        for i in 0...tamano
            print tablero[i]
            print "\n"
        end
        print "\n ******* Rellena tu tablero ******** \n"
        for i in 0...tamano
            print tablero_principal[i]
            print "\n"
        end
    
        i = 0
        while i < 9 do
            puts i
            if i%2!=0
                tablero
                print "Decide tu posición X: "
                respuesta_position = gets.to_i
                if respuesta_position.between?(1,9) 
                    value= position(tamano, tablero, respuesta_position)
                    x=value[0][0]
                    y=value[1][0]
                    
                    if tablero_principal[x][y]== "X" || tablero_principal[x][y]=="O"
                        puts "\n-SELECCIOONA OTRA OPCION- "
                    else     
                        tablero_principal[x][y]=player_one 
                        
                        if winner(tablero_principal, player_one) == player_one
                            print_board(tamano, tablero_principal)
                             puts "¡¡G A N A S T E:  #{player_one}!!"  
                            break                      
                        end
                        i += 1
                    end
                    print_board(tamano, tablero_principal)
                else 
                    puts "Selecciona un número del 1 al 9"
                end   
            end
            if i%2==0
                tablero
                print "Decide tu posición O: "
                respuesta_position = gets.to_i
                value= position(tamano, tablero, respuesta_position)
                if respuesta_position.between?(1,9) 
                    value= position(tamano, tablero, respuesta_position)
                    x=value[0][0]
                    y=value[1][0]
                    
                    if tablero_principal[x][y]== "X" || tablero_principal[x][y]=="O"
                        puts "\n-SELECCIOONA OTRA OPCION- "
                    else     
                        tablero_principal[x][y]=player_two
                        if winner(tablero_principal, player_two) == player_two
                            print_board(tamano, tablero_principal)                    
                            puts "¡¡G A N A S T E:  #{player_two}!!"
                            break
                        end
                        i += 1
                    end
                    print_board(tamano, tablero_principal)
                else 
                    puts "Selecciona un número del 1 al 9"
                end   
            end
        end
    end
        
    def begin
        print "Deseas comenzar el juego? (y/n) "
        respuesta = gets.chomp
        if respuesta === "y"
            TTT.new.play
        elsif respuesta=="n"
            return 
        end
    end
    
end
TTT.new.begin
    