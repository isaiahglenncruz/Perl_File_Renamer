#!/usr/bin/perl
use strict;
use warnings;
use File::Copy;  # check file existence

# assign arguments to variables if: there are 2 present, current file exists, and 
# the intended_filename doesn't conflict with a file that already exists.
if (@ARGV != 2) {
    die "Usage: ./rename.pl <current_filename> <intended_filename>\n";
}
my ($current_filename, $intended_filename) = @ARGV;
unless (-e $current_filename) {
    die "Error: The file '$current_filename' does not exist.\n";
}
if (-e $intended_filename) {
    die "Error: A file with the name '$intended_filename' already exists.\n";
}

# check if: the current_filename is a directory, and if user has read/write permissions
unless (-f $current_filename) {
    die "Error: '$current_filename' is not a regular file.\n";
}
unless (-r $current_filename && -w $current_filename) {
    die "Error: You do not have sufficient permissions to rename '$current_filename'.\n";
}


# cout
if (rename($current_filename, $intended_filename)) {
    print "Successfully renamed '$current_filename' to '$intended_filename'.\n";
} else {
    die "Error: Could not rename '$current_filename' to '$intended_filename': $!\n";
}