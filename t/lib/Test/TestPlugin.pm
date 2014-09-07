package Test::TestPlugin;

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ( $self, $app, $conf ) = @_;
    push @{ $app->renderer->classes }, __PACKAGE__;
    $app->add_view( "activity", "test" );
    $app->add_view( "activity", "test2" );

    $app->helper(
        test => sub {
            return shift->render_to_string(
                template => "test",
                format   => "html"
            );
        }
    );
    $app->helper(
        test2 => sub {
            return shift->render_to_string(
                template => "test2",
                format   => "html"
            );
        }
    );

}

1;
__DATA__
@@ test.html.ep
double it!
@@ test2.html.ep
42