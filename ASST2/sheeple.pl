#!/usr/bin/perl -w

# sub print_comment{
#     @comment=split(/#/,$_[0]);
#     print "#$comment[1]";
# }

$input_file=$ARGV[0];

open(DATA,"<$input_file");
@lines = <DATA>;

foreach $line (@lines){

    if($line =~ /^\s*echo/){
        chomp $line;
        if($line=~/echo\s'/){
            $line=~s/'//g;
            $line=~s/"/\\"/g;
        }
        elsif($line=~/echo\s"/){
            $line=~s/"//g;
            $line=~s/'/\\'/g;
        }
        
        @items=split(/\s/,$line);

        print 'print "';
        for($i=1;$i<@items;$i++){
            print "$items[$i]";
            if($i!=@items-1){
                print " ";
            }
            else{
                print '\n';
            }
        }
        print '";',"\n";
    }
    elsif($line =~ /^\s*(ls|pwd|id|date)/){
        chomp $line;
        print 'system "';
        print "$line";
        print '";',"\n";
    }
    elsif($line =~ /=/){
        chomp $line;
        @items=split(/=/,$line);
        print '$',"$items[0] = ";
        if($items[1]=~/[0-9\$]+/){
            print "$items[1];\n";
        }
        else{
            print "'","$items[1]';\n";
        }    
    }
    elsif($line=~/#!/){
        #for($i=0;$i<)
        print "#!/usr/bin/perl -w\n";
    }
    elsif($line=~/^\s*\n/){
        print "\n";
    }
    elsif($line =~ /cd\s/){
        chomp $line;
        @items=split(/\s/,$line);
        print "chdir '$items[1]'\n";
    }
    elsif($line=~/for/){
        if($line=~/\sin\s/){

        }
    }


    if($line=~/#\s/){
        @comment=split(/#/,$line);
        print "#$comment[1]";
    }

}


#print @lines;   
close(DATA);
