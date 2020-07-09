#!/usr/bin/perl -w

$num=0;

while ( -e ".snapshot.$num" ) 
{
    print ".snapshot.$num ";
    
    $num=$num+1;  

    print "$num \n";
}
mkdir( ".snapshot.$num" ) and print "Creating .snapshot.$num\n";

$dir = "./*";
my @files = glob( $dir );
 
foreach (@files ){
    if (not $_ =~ /snapshot.pl/){
        `cp "$_" "./.snapshot.$num"`;
        print $_ . " yes\n";
    }
}



