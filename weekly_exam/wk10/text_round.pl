#!/usr/bin/perl -w

@lines=<STDIN>;

foreach $line (@lines){
    @items=split(/[^\S\t]/,$line);
    for($i=0;$i<@items;$i++){
        if($items[$i]=~/([0-9]+\.[0-9]+)/){

            $pre=$`;
            $num=$&;
            $suf=$';

            @nums=split(/\./,$num);
            $num_pre=$nums[0];
            $num_suffix=join '.',0,$nums[1];
            
            #print "$1 $2 $num_suffix $4\n";
            if($num_suffix<0.5){
                $num_pre=$num_pre+0;
            }
            else{
                $num_pre=$num_pre+1;
            }
            $items[$i]=join '',$pre,$num_pre,$suf;
        }
        print "$items[$i] ";
    }
    print "\n";
}

