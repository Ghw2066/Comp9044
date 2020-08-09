#!/usr/bin/perl -w

# sub isNumber{
#     if($_[0]=~/\d+/){
#         return 1;
#     }
#     else{
#         return 0;
#     }
# }

# sub condition{
    
#     if($_[0]=~/=/){
#         @vs=split(/\s*=\s*/,$_[0]);
#         if(isNumber($vs[0]) && isNumber($vs[1])){
#             print "$vs[0] == $vs[1]"; 
#         }
#         else{
#             print "$vs[0] eq $vs[1]"; 
#         }
#     }
#     elsif($_[0]=~/!=/){
#         @vs=split(/!=/,$_[0]);
#         if(isNumber($vs[0]) && isNumber($vs[1])){
#             print "$vs[0] != $vs[1]"; 
#         }
#         else{
#             print "$vs[0] ne $vs[1]"; 
#         }
#     }
#     elsif($_[0]=~/(-eq|-ne|-lt|-gt|-le|-ge)/){
#         @vs=split(/$&/,$_[0]);
#         $cm=substr($&,1);
#         print "$vs[0] $cm $vs[1]";
#     }
# }

# sub test{
#     @parts=split(/\stest/,$_[0]);
#     if($parts[1]=~/&&/){
#         @cdts=split(/\s&&\s/,$parts[1]);
#         condition($cdts[0]);
#         print " && ";
#         condition($cdts[1]);    
#     }
#     elsif($parts[1]=~/||/){
#         @cdts=split(/\s||\s/,$parts[1]);
#         condition($cdts[0]);
#         print " || ";
#         condition($cdts[1]);     
#     }
#     elsif($parts[1]=~/-d/){
#         @cdts=split(/-d\s/,$parts[1]);
#         print "-d $cdts[1])\n";
#     }
#     elsif($parts[1]=~/-r/){
#         @cdts=split(/-r\s/,$parts[1]);
#         print "-r $cdts[1])\n";
#     }
#     else{
#         condition($parts[1]);
#     }
# }

$input_file=$ARGV[0];

open(DATA,"<$input_file");
@lines = <DATA>;

foreach $line (@lines){

    if($line=~/\$\d/){
        $n=substr($&,1)-1;
        $line=~s/\$\d/\$ARGV[$n]/g;
    }
    print "$line";
    if($line =~ /^\s*echo/){
        chomp $line;
        if($line=~/echo\s'/){
            $line=~s/'//g;
            $line=~s/"/\\"/g;
        }
        elsif($line=~/echo\s"/){
            $line=~s/\s*echo\s*"//g;
            $line=~s/'/\\'/g;
        }
        $line=~s/\s*echo\s*//;
        @items=split(/\s/,$line);

        print 'print "';
        for($i=0;$i<@items;$i++){
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
        chomp $line;
        @items=split(/\s/,$line);
        print "foreach \$$items[1] (";
        if(@items==4){
            print "glob(\"$items[3]\")){\n\t";
            
        }
        elsif(@items>4){
            for($i=3;$i<@items;$i++){
                if($items[$i]=~/\d+/){
                    print "$items[$i]"
                }
                else{
                    print "'$items[$i]'";
                }
                
                if($i!=@items-1){
                    print ", ";
                }
            }
            print "){\n\t";
        }
    }
    elsif($line=~/done/){
        print "}\n";
    }
    elsif($line=~/exit/){
        print "$line";
    }
    elsif($line=~/read/){
        print '$line = <STDIN>;',"\n";
        print 'chomp $line;',"\n";
    }
    elsif($line=~/if/){
        #chomp $line;
        #print "$line\n";
        #print "if( ";
        #@items=split(/\s/,$line);
        # if($line=~/test/){
        #     test($line);    
        # }

        print " {\n";
    }
    elsif($line=~/fi/){
        print "}\n";
    }
    


    if($line=~/#\s/){
        @comment=split(/#/,$line);
        print "#$comment[1]";
    }

}


#print @lines;   
close(DATA);
