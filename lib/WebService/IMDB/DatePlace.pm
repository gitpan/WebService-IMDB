# $Id: DatePlace.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::DatePlace

=cut

package WebService::IMDB::DatePlace;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Name WebService::IMDB::Birth WebService::IMDB::Death);

use WebService::IMDB::Date;

__PACKAGE__->mk_accessors(qw(
    date
    place
));


=head1 METHODS

=head2 date

=head2 place

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    if (exists $data->{'date'}) { $self->date(WebService::IMDB::Date->_new($ws, $data->{'date'})); }
    if (exists $data->{'place'}) { $self->place($data->{'place'}); }

    return $self;
}

1;
