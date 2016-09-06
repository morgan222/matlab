function [ win ] = f_connected( b,row,col, player, previous_b)
%This is a hex solver using factorials?
%This solver will keep a log of previous positions
%This solver will be able to traverse the board in any direction
    win = 0;
    m = size(b,1);
    n = size(b,2);
    
    if col < 1 || row < 1 || col > n || row > m
        win = 0;
    else
        if b(row,col) == player
            previous_b(row,col) = 1;
%           Check each sqaure around current row/col

            if col - 1 > 0
%           check all squares to the left of the current col
                if row -1 > 0
                    if b(row-1,col-1) == player && previous_b(row-1,col-1) == 0
                        %assume player 1 or player 2 cant win from
                        %going back a row or a column
                        win = f_connected(b,row-1,col-1,player,previous_b);    
                    end
                end
                

                if b(row,col-1) == player && previous_b(row,col-1) ==0
                    win = f_connected(b,row,col-1,player,previous_b);                     
                end
                
                if row + 1 <=m
                    if b(row+1,col-1) == player && previous_b(row+1,col-1) ==0
                        if player == 1 && row + 1 == m
                            win = 1;
                        else
                            win = f_connected(b,row+1,col-1,player,previous_b); 
                        end
                    end
                end
                
            end
            
            if col + 1 <=m
                %check all squares to the right of col
                 if row -1 > 0 && win ==0
                    if b(row-1,col+1) == player && previous_b(row-1,col+1) == 0
                        %assume player 1 or player 2 cant win from
                        %going back a row or a column
                        if player == 2 && col + 1 == n
                            win = 1;
                        else
                            win = f_connected(b,row-1,col+1,player,previous_b);
                        end
                            
                    end
                end
                

                if b(row,col+1) == player && previous_b(row,col+1) ==0 && win ==0
                    if player ==2 && col + 1 == n
                        win =1;
                    else
                        win = f_connected(b,row,col+1,player,previous_b);    
                    end
                end
                
                if row + 1 <=m && win ==0
                    if b(row+1,col+1) == player && previous_b(row+1,col+1) ==0
                        if (player == 1 && row + 1 == m) || (player ==2 && col + 1 == n)
                            win = 1;
                        else
                            win = f_connected(b,row+1,col+1,player,previous_b); 
                        end
                    end
                end
            end
            
            if row + 1 <=m && win ==0
                if b(row+1,col) == player && previous_b(row+1,col) ==0
                    if (player == 1 && row + 1 == m) 
                        win = 1;
                    else
                        win = f_connected(b,row+1,col,player,previous_b); 
                    end
                end
            end
            
           if row -1 > 0 && win ==0
                if b(row-1,col) == player && previous_b(row-1,col) == 0
                    %assume player 1 or player 2 cant win from
                    %going back a row or a column
                    win = f_connected(b,row-1,col,player,previous_b);    
                end
           end
        end   
    end
     if win ==0 && col == 1 && row <= m && row >0 && player ==2
        win = f_connected(b,row+1,col,player,previous_b);
     end  
    if win ==0 && row == 1 && col <= n && col >0 && player ==1
        win = f_connected(b,row,col+1,player,previous_b);
    end  
end

