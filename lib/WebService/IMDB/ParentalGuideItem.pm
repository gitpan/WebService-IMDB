# $Id: ParentalGuideItem.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::ParentalGuideItem

=cut

package WebService::IMDB::ParentalGuideItem;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

__PACKAGE__->mk_accessors(qw(
    label
    text
));


=head1 METHODS

=head2 label

=head2 text

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->label($data->{'label'});
    $self->text($data->{'text'});

    return $self;
}

1;
