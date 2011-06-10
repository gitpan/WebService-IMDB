# $Id: Certificate.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::Certificate

=cut

package WebService::IMDB::Certificate;

use strict;
use warnings;

our $VERSION = '0.03';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

__PACKAGE__->mk_accessors(qw(
    attr
    certificate
    country
));


=head1 METHODS

=head2 attr

=head2 certificate

=head2 country

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    if (exists $data->{'attr'}) { $self->attr($data->{'attr'}); }
    $self->certificate($data->{'certificate'});
    if (exists $data->{'country'}) { $self->country($data->{'country'}); }

    return $self;
}

1;
