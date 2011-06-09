# $Id: Death.pm 6427 2011-06-09 17:05:16Z chris $

=head1 NAME

WebService::IMDB::Death

=cut

package WebService::IMDB::Death;

use strict;
use warnings;

our $VERSION = '0.01';

use base qw(WebService::IMDB::DatePlace);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Name);

use WebService::IMDB::Date;

__PACKAGE__->mk_accessors(qw(
    cause
));


=head1 METHODS

=head2 cause

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = $class->SUPER::_new($ws, $data);

    if (exists $data->{'cause'}) { $self->cause($data->{'cause'}); }

    return $self;
}

1;
