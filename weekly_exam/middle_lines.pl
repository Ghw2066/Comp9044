#!/usr/bin/perl -w

open(DATA, "<$ARGV[0]");
@lines = <DATA>;
#print @lines;    
close(DATA);
if(@lines%2==0){
    $n=@lines/2;
    printf "$lines[$n-1]";
    printf "$lines[$n]";
}
else{
    printf "$lines[(@lines-1)/2]";
}

