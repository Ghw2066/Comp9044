#!/usr/bin/perl -w

$i=0;

foreach $item (@ARGV){
    if( exists($items{"$item"} ) ){
        #print "facebook 的网址为 $data{'facebook'} \n";
    }
    else
    {
        #print "facebook 键不存在\n";
        $items{"$item"}="$item";
        $data[$i]="$item";
        $i=$i+1;
    }
    
}
#@names = keys %items;
foreach $item (@data){
    print "$item ";
}
print "\n";