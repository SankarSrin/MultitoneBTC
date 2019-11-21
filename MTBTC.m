%Function to generate Multi-tone BTC

%%   Author: 
%%   Mr. Sankarasrinivasan
%%   Research Fellow, Multimedia Signal Processing Lab, NTUST, Taiwan
%%   Advisor: Prof. Jing Ming Guo
%%   Dated: Apr, 2018
%% im=test image; bs=block size={8,16,32,64}; T=4 or 6 Tones



function [Y]=MTBTC(im,bs,T)

[s1 s2]=size(im);

if(T==4)
 [DA,DAt, DAc, DAct]=gen_ditherarrayMT_DMS4(bs);
end

if(T==6)
 [DA,DAt, DAc, DAct]=gen_ditherarrayMT_DMS6(bs);
end


T=T-1;
x1=1;y1=1;
MT=ones(bs,bs); 
NT=ones(bs,bs);
for i=1:bs:s1
    for j=1:bs:s2             
        bl=im(i:i+(bs-1),j:j+(bs-1));
        mx=double(max(bl(:)));
        mn=double(min(bl(:))) ;      
        k=double(mx-mn)        ;     
        for p=1:T
        DAbl(:,:,p)=k.*DA(:,:,p)+mn;             
        end                
       for nT=1:1:T     
       MT=(bl>=DAbl(:,:,nT));      
       M(:,:,nT)=MT;
      
       end
      
       if(T==5)
       for x=1:1:bs
           for y=1:1:bs
              
             
              if(M(x,y,1)==1 )
                  blc(x,y)=mx;
              elseif(M(x,y,2)==1)
                  blc(x,y)=mx-0.2*k;                    
              elseif(M(x,y,3)==1 )
                  blc(x,y)=mx-0.4*k;
              elseif(M(x,y,3)==1 )
                  blc(x,y)=mx-0.6*k;
              elseif(M(x,y,3)==1 )
                  blc(x,y)=mx-0.8*k;                    
              else
                  blc(x,y)=mn;
              end
              
           end
       end
       end
       
       
       
           if(T==3)
       for x=1:1:bs
           for y=1:1:bs
              
             
              if(M(x,y,1)==1 )
                  blc(x,y)=mx;
              elseif(M(x,y,2)==1)
                  blc(x,y)=mx-0.33*k;                    
              elseif(M(x,y,3)==1 )
                  blc(x,y)=mx-0.66*k;                        
              else
                  blc(x,y)=mn;
              end
              
           end
       end
       end  
       
    
 Y(i:i+(bs-1),j:j+(bs-1))=blc;
         y1=y1+1; 

    end
    
     y1=1;
     x1=x1+1;
end
imshow(Y,[]);
