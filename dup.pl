#!/bin/perl

use strict;

open (F, $ARGV[0]) or die "Couldn't open $ARGV[0] for reading";
my %present = ();
{
  while(<F>)
	{
		chomp;
		$present{$_}++;
		next if $present{$_} > 1;
		print "$_\n";
	}
close(F);
}
print "\n\n----Duplicates distribution----\n";
foreach my $keys  ( sort {$present{$b} <=> $present{$a}} keys %present) 
{
	print "$keys  = $present{$keys}\n";
}
