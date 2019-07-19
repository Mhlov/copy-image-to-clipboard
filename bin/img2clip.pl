#!/usr/bin/perl 
#
# perl -MMIME::Types -e '$f=shift;$t=MIME::Types->new()->mimeTypeOf($f);exec qw/xclip -selection clipboard -t/,$t,"-i",$f if $t and -e $f' %f
#
use strict;
use utf8;
use MIME::Types;

sub get_mime_type {
	my $mt = MIME::Types->new();
	return $mt->mimeTypeOf(shift);
}

sub main {
	my $file = shift;
	my $type = get_mime_type($file);
	die "unknown type of file\n" unless ($type);
	exec xclip => '-selection' => 'clipbord', '-target' => $type, '-in' => $file;
	#0;
}

exit main(@ARGV);
