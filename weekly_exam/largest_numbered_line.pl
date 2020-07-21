#!/usr/bin/perl -w



#@maxnumlines;

# $userinput =  <STDIN>;
# chomp ($userinput);
# print "User typed $userinput\n";

while (<STDIN>) {
    #last unless /\S/;
    print "$_";
    push @lines, $_;
    
}
print @lines;

# foreach $line (@lines){
#     @words=split(/\s+/,$line);
#     $max=0;
#     foreach $word (@words){
#         if($word =~ /[0-9.]+/ and $&>$max){
#             $num = $&;
#         }
#     }  
#     push @nums, $num;
# }

# print "@nums\n";