function [ win ] = f_connected2( b,row,col, player)
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
         
            if col - 1 > 0
%           check all squares to the left of the current col
                if row -1 > 0
                    if b(row-1,col-1) == player 
                        %assume player 1 or player 2 cant win from
                        %going back a row or a column
                        win = f_connected2(b,row-1,col-1,player);    
                    end
                end
                
                if b(row,col-1) == player 
                    win = f_connected2(b,row,col-1,player);                     
                end
                
                if row + 1 <=m
                    if b(row+1,col-1) == player 
                        if player == 1 && row + 1 == m
                            win = 1;
                        else
                            win = f_connected2(b,row+1,col-1,player); 
                        end
                    end
                end
                
            end
            
            if col + 1 <=m
                %check all squares to the right of col
                 if row -1 > 0 && win ==0
                    if b(row-1,col+1) == player
                        %assume player 1 or player 2 cant win from
                        %going back a row or a column
                        if player == 2 && col + 1 == n
                            win = 1;
                        else
                            win = f_connected2(b,row-1,col+1,player);
                        end
                            
                    end
                end
                

                if b(row,col+1) == player && win ==0
                    if player ==2 && col + 1 == n
                        win =1;
                    else
                        win = f_connected2(b,row,col+1,player);    
                    end
                end
                
                if row + 1 <=m && win ==0
                    if b(row+1,col+1) == player 
                        if (player == 1 && row + 1 == m) || (player ==2 && col + 1 == n)
                            win = 1;
                        else
                            win = f_connected2(b,row+1,col+1,player); 
                        end
                    end
                end
            end
            
            if row + 1 <=m && win ==0
                if b(row+1,col) == player 
                    if (player == 1 && row + 1 == m) 
                        win = 1;
                    else
                        win = f_connected2(b,row+1,col,player); 
                    end
                end
            end
            
           if row -1 > 0 && win ==0
                if b(row-1,col) == player 
                    %assume player 1 or player 2 cant win from
                    %going back a row or a column
                    win = f_connected2(b,row-1,col,player);    
                end
           end
        end   
    end
     if win ==0 && col == 1 && row <= m && row >0 && player ==2
        win = f_connected2(b,row+1,col,player);
     end  
    if win ==0 && row == 1 && col <= n && col >0 && player ==1
        win = f_connected2(b,row,col+1,player);
    end  
end

