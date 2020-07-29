#!/usr/bin/perl -w

#@a1=(4,5,1,3,6,2,10);
my @ordered = sort {$a<=>$b} @ARGV;
$i=0;
$median=(@ordered-1)/2;
#print "$median\n";
foreach $num (@ordered){
    if($i==$median){
        print "$num\n";
        last;
    }
    $i++;
}

#print "$ordered\n"