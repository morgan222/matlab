function [ win ] = connected_player2( b,row,col, player )
%UNTITLED3 Summarcol of this function goes here
%   Detailed erowplanation goes here
    win = 0;
    m = size(b,1);
    n = size(b,2);
        
    if col < 1 || row < 1 || col > n || row > m
        win = 0;
    else
        if b(row,col) == player
            if row+1 <=m  && col-1 >0 && win == 0
                if (b(row+1,col-1) == player)  
                    if (row+1 == m) 
                        win = 1;
                    else
                        win = connected_player2(b,row+1,col-1,player);
                    end
                end
            end

            if row + 1 <=m && win == 0
                if (b(row+1,col) == player) 
                    if (row +1 == m)
                            win = 1;
                    else
                            win = connected_player2(b,row+1,col,player);
                    end
                end
            end


            if col+1 <=n && row+1 <=m && win == 0
                if (b(row+1,col+1) == player) 
                    if (row+1 ==m)
                            win = 1;
                    else
                            win = connected_player2(b,row+1,col+1,player);
                    end
                end

            end
        end 
    end

    if win ==0 && row ==1 && col <= n && col >0
        win = connected_player2(b,row,col+1,player);
    end

end


        


