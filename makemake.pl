#!/usr/bin/perl -w

my $static_date = `date`;
chomp($static_date);

print "# Makefile generated at $static_date\n\n"

print "CC = gcc\n";
print "CFLAGS = -Wall -g\n";
print "\n";
$dir = ".";
my @files = glob( $dir );
 
foreach $file (@files ){

    #print $file . "\n";
    open(DATA,"<$file") or die "can't open $file";
    @lines = <DATA>;
    foreach $line (@lines){
        if ($line =~ /^\s*(int|void)\s*main\s*\(/ ){
            print "$file:\t";
        }
    }
    #print @lines;    
    close(DATA);

    

}

