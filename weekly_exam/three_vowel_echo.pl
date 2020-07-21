#!/usr/bin/perl -w

foreach $word (@ARGV){
    if($word =~ /[aeiouAEIOU]{3,}/){
        printf "$word ";
    }
}
printf "\n";