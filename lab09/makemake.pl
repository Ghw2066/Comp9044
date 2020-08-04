#!/usr/bin/perl -w

my $static_date = `date`;
#chomp($static_date);

print "# Makefile generated at $static_date\n";

print "CC = gcc\n";
print "CFLAGS = -Wall -g\n";
print "\n";
$dir = "./*.c";
my @files = glob( $dir );
 
foreach $file (@files ){

    #print $file . "\n";
    open(DATA,"<$file") or die "can't open $file";
    @lines = <DATA>;
    foreach $line (@lines){
        if ($line =~ /^\s*(int|void)\s*main\s*\(/ ){
            #$l = length($file);
            print substr($file,2,-2),":\t";
            #print ":\t";
            foreach $out (@files){
                print substr($out,2,-2),".o ";
            }
            print "\n\t",'$(CC) $(CFLAGS) -o $@ ';
            foreach $out (@files){
                print substr($out,2,-2),".o ";
            }
            print "\n\n";
            foreach $out (@files){
                open(DATA1,"<$out");
                print substr($out,2,-2),".o:\t";
                @heads = <DATA1>;
                foreach $head (@heads){
                    if( $head =~ /^#include\s\"*\"/){
                        print substr($head,10,-2)," ";
                    }
                }
                print substr($out,2);
                close(DATA1);
                print "\n";
            }
            last;
        }
        
    }
    #print @lines;    
    close(DATA);



}

