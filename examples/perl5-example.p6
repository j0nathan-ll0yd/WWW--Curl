#!/opt/local/bin/perl6

BEGIN { 
  @*INC.push: '../lib';
}

use v6;
use WWW::Curl;

my $curl = WWW::Curl.new;
$curl.setopt( CURLOPT_FILE, '');
$curl.setopt( CURLOPT_HEADER, '1');
$curl.setopt( CURLOPT_URL, 'http://www.google.com/');

# Starts the actual request
my $retcode = $curl.perform;

# Looking at the results...
if ($retcode == 0) {
  say "Transfer went ok";
  my $response_code = $curl.getinfo( CURLINFO_RESPONSE_CODE );
  my $response_body = $curl.getbody;
  # judge result and next action based on $response_code
  say "Received response: $response_body";
}
else {
  # Error code, type of error, error message
  say "An error happened: $retcode " ~ $curl.strerror($retcode);
}
