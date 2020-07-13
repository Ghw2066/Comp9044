#!/usr/bin/perl -w
use File::Copy;

sub save(){
    $num=0;
    while ( -e ".snapshot.$num" ) 
    {
        print ".snapshot.$num ";
        
        $num=$num+1;  

        print "$num \n";
    }
    mkdir( ".snapshot.$num" ) and print "Creating .snapshot.$num\n";

    $dir = "./*";
    my @files = glob( $dir );
    
    foreach $f (@files ){
        if (not $f =~ /snapshot.pl/){
            $dis=".snapshot.$num";
            copy($f, $dis);
            #`cp "$f" "./.snapshot.$num"`;
            print $f . " yes\n";
        }
    }
}

sub load($resnum){
    $resdir=".snapshot.$resnum";
    my @resfiles = glob( $resdir );
    foreach $f (@resfiles){
        copy($f, "../")
    }
}

if ($ARGV[0] eq "save"){
    save();
}

if ($ARGV[0] eq "load" and $ARGV[1]){ 
    load($ARGV[1]);
}







