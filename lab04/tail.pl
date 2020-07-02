#!/usr/bin/perl -w
$N = 10;

foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
    # handle other options
    # ...
    } elsif ($arg =~ /-\d/){
	    $arg =~ tr/-//d;
	    $N = $arg;
	    print "$N\n";
	    #	    exit 0;
    } else {
        push @files, $arg;
    }
}

while(defined(my $line=<>)){
    print $line;
}

foreach $file (@files) {
    open F, '<', $file or die "$0: Can't open $file: $!\n";
    $nf=@files;
    if ($nf>1){
        print "==> $file <==\n";
    }
    # process F
    @lines=<F>;
    
    $num=@lines-$N;
    #print "$num\n";
    $i=0;
    foreach $line (@lines){
        if($i>=$num){
            print "$line";
        }
        $i = $i+1;
    }

    
    # foreach $line (@F){
    # 	if ($i>$num-$N){
	# 	print "$line\n";
    #     }
	# }
   
    close F;
}
