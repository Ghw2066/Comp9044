#!/usr/bin/perl -w

unless(@ARGV == 2){
	die "Usage: ./echon.pl <number of lines> <string>\n"
}

$n = $ARGV[0];
$string = $ARGV[1];

unless($n =~ /^\d+$/){
	die "./echon.pl: argument 1 must be a non-negative integer\n";
}

while ($n>0) {
	print "$string\n";
	$n=$n-1;
}
#print "@ARGV\n";

