# $Id: Quote.pm 7350 2011-12-28 20:12:24Z chris $

=head1 NAME

WebService::IMDB::Quote

=cut

package WebService::IMDB::Quote;

use strict;
use warnings;

our $VERSION = '0.04';

use base qw(Class::Accessor);

use Carp;
our @CARP_NOT = qw(WebService::IMDB WebService::IMDB::Title);

use WebService::IMDB::QuoteLine;

__PACKAGE__->mk_accessors(qw(
    lines
    qconst
));


=head1 METHODS

=head2 lines

=head2 qconst

=cut

sub _new {
    my $class = shift;
    my $ws = shift;
    my $data = shift or die;

    my $self = {};

    bless $self, $class;

    $self->lines( [ map { WebService::IMDB::QuoteLine->_new($ws, $_) } @{$data->{'lines'}} ] );
    $self->qconst($data->{'qconst'});

    return $self;
}

1;
