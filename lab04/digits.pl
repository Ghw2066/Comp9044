#!/usr/bin/perl -w


while ( $line = <STDIN>) {


	$line =~ s/[0-4]/</g;
	$line =~ s/[6-9]/>/g;

	if($line !~ /./){
		last;
	}

	print "$line";

}
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


