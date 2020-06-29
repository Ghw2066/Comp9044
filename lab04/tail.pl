#!/usr/bin/perl -w
foreach $arg (@ARGV) {
    if ($arg eq "--version") {
        print "$0: version 0.1\n";
        exit 0;
    # handle other options
    # ...
    } else {
        push @files, $arg;
    }
}

foreach $file (@files) {
    open F, '<', $file or die "$0: Can't open $file: $!\n";

    # process F

    close F;
}
