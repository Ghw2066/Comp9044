#!/usr/bin/perl -w

$n=0;
while(defined($line = <STDIN>)){
    @words = split(/[^a-zA-Z]+/, $line);
    foreach $_ (@words) {
        #if ($number ne '') {
            #$total += $number;
        printf "$_\n";
        $n++;
        #}
        # unless($word =~ /[a-zA-Z]+/){
        #     printf "$word ";
        # }

    }
    #$m++;
    #printf "\n";
}

#@input_text_array = <>;
#$input_text_array = <STDIN>;
#join "", @input_text_array;

#@numbers = split(/[a-zA-Z]+/, $input_text_array);
#print join(",", @numbers), "\n";

# foreach $number (@numbers) {
#     #if ($number ne '') {
#         $total += $number;
#         $n++;
#     #}
# }
#$n=$n-$m-$m;
printf "$n words\n";
