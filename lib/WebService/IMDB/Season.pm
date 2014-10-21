# $Id: Season.pm 6444 2011-06-09 19:37:45Z chris $

=head1 NAME

WebService::IMDB::Season

=cut

package WebService::IMDB::Season;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

use WebService::IMDB::Credit;

__PACKAGE__->mk_accessors(qw(
    label
    list
    token
));


=head1 METHODS

=head2 label

=head2 list

=head2 token

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->label($data->{'label'});
    $self->list([ map { WebService::IMDB::Title::Stub->_new($ws, $_) } @{$data->{'list'}}]);
    $self->token($data->{'token'});

    return $self;
}

1;
