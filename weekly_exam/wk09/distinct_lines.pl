#!/usr/bin/perl -w

$num=$ARGV[0];
$num_lines=0;
$flag=0;
while(defined($line = <STDIN>)){
    #print $line;
    $line=lc ($line);
    $line =~ s/\s*//g;
    #print "$line";
    $data{$line}=1;
    $num_lines+=1;
    @keys=keys %data;
    $size=@keys;
    if($size==$num){
        print "$num distinct lines seen after $num_lines lines read.\n";
        $flag=1;
        last;
    }
}
if($flag==0){
    print "End of input reached after $num_lines lines read - $num different lines not seen.\n";
}
