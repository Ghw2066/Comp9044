#!/usr/bin/perl -w

@lines=<STDIN>;

for($i=0;$i<@lines;$i++){
    chomp $lines[$i];
    if($lines[$i]=~/^#(\d{1,3})/){
        $num=$1-1;
        #print $num;
        chomp $lines[$num];
        $lines[$i]=$lines[$num];
    }
    print "$lines[$i]\n";
}