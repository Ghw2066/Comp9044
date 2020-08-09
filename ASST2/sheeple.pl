#!/usr/bin/perl -w

$input_file=$ARGV[0];

open(DATA,"<$input_file");
@lines = <DATA>;

for $line (@lines){

    if(@line =~ /^\s*echo/){

    }

}


print @lines;   
close(DATA);
