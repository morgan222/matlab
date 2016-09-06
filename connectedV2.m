function [ win ] = connectedV2( b,row,col, player, previous_b)
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
                        win = connected(b,row-1,col-1,player);    
                    end
                end
                

                if b(row,col-1) == player && b(row,col-1) ==0
                    win = connected(b,row,col-1,player);                     
                end
                
                if row + 1 <=m
                    if b(row+1,col-1) == player && b(row+1,col-1) ==0
                        win = connected(b,row,col-1,player);                     
                    end
                end
                
            end
            
            if row+1 <= m && col+1 <=n && win == 0
                if (b(row+1,col+1) == player)  
                    if (col+1 == n) 
                        win = 1;
                    else
                        win = connected(b,row+1,col+1,player);
                    end
                end
            end


            if col+1 <= n && win == 0
                if (b(row,col+1) == player) 
                    if (col+1 == n)
                            win = 1;
                    else
                            win = connected(b,row,col+1,player);
                    end
                end
            end


            if col+1 <=n && row-1 >0 && win == 0
                if (b(row-1,col+1) == player) 
                    if (col+1 == n)
                            win = 1;
                    else
                            win = connected(b,row-1,col+1,player);
                    end
                end

            end
        
%             if player == 2
%                  if row-1 >0  && col-1 >0 && win == 0
%                     if (b(row-1,col-1) == player)  
%                         if (row-1 == 1) 
%                             win = 1;
%                         else
%                             win = connected(b,row-1,col-1,player);
%                         end
%                     end
%                 end
% 
% 
%                 if row - 1 > 0 && win == 0
%                     if (b(row-1,col) == player) 
%                         if (row -1 == 1)
%                                 win = 1;
%                         else
%                                 win = connected(b,row-1,col,player);
%                         end
%                     end
%                 end
% 
% 
%                 if col+1 <=n && row-1 >0 && win == 0
%                     if (b(row-1,col+1) == player) 
%                         if (row-1 == 1)
%                                 win = 1;
%                         else
%                                 win = connected(b,row-1,col+1,player);
%                         end
%                     end
% 
%                 end
%             end 
        end   
    end
        
    if win ==0 && col == 1 && row <= m && row >0
        win = connected(b,row+1,col,player);
    end
end

