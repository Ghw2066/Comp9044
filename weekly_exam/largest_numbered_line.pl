#!/usr/bin/perl -w



#@maxnumlines;

# $userinput =  <STDIN>;
# chomp ($userinput);
# print "User typed $userinput\n";
# while ($line = <>) {
#     if ($line =~ /^\D*(-?\d+(\.\d+)?)/) {
#         print "$1\n";
#     }
# }
while ($line = <>) {
    #last unless /\S/;
    print "$line";
    push @lines, $line;
    
}
#print @lines;

foreach $line (@lines){
    @words=split(/\s+/,$line);
    $max=0;
    foreach $word (@words){
        if($word =~ /-?\d+(\.\d+)?/ and $&>$max){
            $max = $&;
            # print "$&";
        }
    }  
    push @nums, $max;
}
$max=0;
foreach $num (@nums){
    if($num>$max){
        $max=$num;
    }
}

for ($i=0; $i<@lines; $i=$i+1){
    if($max==$nums[$i]){
        print "$lines[$i]\n";
    }
}
#print "@nums\n";