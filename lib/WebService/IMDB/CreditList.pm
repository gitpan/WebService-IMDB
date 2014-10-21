# $Id: CreditList.pm 6449 2011-06-10 01:01:53Z chris $

=head1 NAME

WebService::IMDB::CreditList

=cut

package WebService::IMDB::CreditList;

use strict;
use warnings;

our $VERSION = '0.03';

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
    if ($data->{'token'} eq "writers" && scalar @{$data->{'list'}} > 0 && exists $data->{'list'}->[0]->{'rewrite'}) {
	# TODO: How to parse this correctly?
	$self->list([]);
    } else {
	$self->list([ map { WebService::IMDB::Credit->_new($ws, $_) } @{$data->{'list'}}]);
    }
    $self->token($data->{'token'});

    return $self;
}

1;
