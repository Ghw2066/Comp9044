#!/usr/bin/perl -w


$line = <STDIN>;

$line =~ s/[0-4]/</g;
$line =~ s/[6-9]/>/g;
print "$line\n";

#@string = split('',$line);




#foreach $ch (@string){
	#print "$ch";
	#if($ch >= 0 && $ch <= 9 ){
	#		if ($ch < 5 && $ch >= 0) {
	#		$ch = "<";
	#	}
	#	elsif ($ch > 5 && $ch <=9) {
	#		$ch = ">";
	#	}
		#}
	
		#print "$ch";
		#}
		#print "\n";


