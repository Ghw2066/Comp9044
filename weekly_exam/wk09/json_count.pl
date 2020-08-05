#!/usr/bin/perl -w
$json=$ARGV[1];
$target=$ARGV[0];
open(DATA,"<$json");
@lines = <DATA>;
$num=0;
$name="";
$dist{$target}=0;
foreach $line (@lines){
    chomp $line;
    if($line =~ /"how_many":\s[0-9]*,/){
        #print substr($line,20,-2),"\n";
        $temp=substr($line,20,-2);
        $num=$temp;
        #print "$num\n";
    }
    if($line =~ /"species":\s".*"/){
        #print substr($line, 20,-2), "\n";
        $name=substr($line, 20,-2);
        $dist{$name}+=$num;
    }

}

print "$dist{$target}\n";

#print @lines;    
close(DATA);