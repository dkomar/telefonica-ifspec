use XML::LibXML;
require "BERlite.pm";
use Data::Dumper;

# load
open my $fh, '<', 'tmp.xml';
binmode $fh; # drop all PerlIO layers possibly created by a use open pragma
$doc = XML::LibXML->load_xml(IO => $fh);
close $fh;

sub recursive_find () {
    my $element = shift;
    my $value = "";

    if ($element->getAttribute('pc') eq "constructed")
    {
        for my $child ($element->findnodes("*"))
        {
            $value .= &recursive_find($child);
        }
    }
    else
    {
        if ($element->hasAttribute("conv"))
        {
            my $func = $element->getAttribute("conv");
            $value = &{"conv_to_".$func}($element->textContent);
        }
        else
        {
            $value = $element->textContent;
        }
    }

    $value = sprintf "%s%s%s",
        &encode_ident($element->getAttribute('class'), $element->getAttribute('pc'), $element->getAttribute('tag')),
        &encode_length(length($value)),
        $value;

    return $value;
}

sub conv_to_integer()
{
    $_ = shift;
    return pack "N", $_;
}

my $result = &recursive_find(($doc->findnodes("/tag"))[0]);

print $result;

  #&encode_ident($class, $pc, $tag),
#printf "%s%s%s", 
#  &encode_ident("universal", "primitive", 12),
#  &encode_length(3),
#  "aaa";
