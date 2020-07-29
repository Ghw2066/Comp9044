#!/usr/bin/perl -w
use Text::Diff;
my $diff = diff "dir1/a.txt", "dir2/a.txt", { STYLE => "Context" };