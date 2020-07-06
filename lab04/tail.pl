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
	    #print "$N\n";
	    #	    exit 0;
    } else {
        push @files, $arg;
    }
}
$n_arg=@ARGV;
#$line_cnt=0;
$j=0;
#while(!$n_arg && defined(my $line=<>)){
#	$line_cnt=$line_cnt+1;
#}
while(!$n_arg && defined(my $line=<>)){
	if($j>1){    
		print $line;
	}
	$j=$j+1;
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
