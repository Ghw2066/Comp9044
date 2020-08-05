#!/usr/bin/perl -w

while ($line = <>) {
    #last unless /\S/;
    #print "$line";
    push @lines, $line;
    
}
#print @lines;
foreach $line (@lines){
    @words=split(/\s+/,$line);
    $max=0;
    $num_exist=0;
    foreach $word (@words){
        if($word =~ /-?\d+(\.\d+)?/ and $&>$max){
            $max = $&;
            $num_exist=1;
            # print "$&";
        }
    }  
    
        #print "$max";
    push @nums,$max;
    push @nums_exist, $num_exist;
    
    
}
$max=0;
foreach $num (@nums){
    if($num>$max){
        $max=$num;
    }
}

for ($i=0; $i<@lines; $i=$i+1){
    if($max == $nums[$i] and $nums_exist[$i]==1){
        print "$lines[$i]";
    }
}
#print "@nums\n";