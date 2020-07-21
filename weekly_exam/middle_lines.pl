#!/usr/bin/perl -w

open(DATA, "<$ARGV[0]") or die "";
@lines = <DATA>;
#print @lines;    
close(DATA);
if(@lines%2==0){
    #$n=@lines/2;
    printf "$lines[@lines/2-1]";
    printf "$lines[@lines/2]";
}
else{
    printf "$lines[(@lines-1)/2]";
}

