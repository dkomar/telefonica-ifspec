use constant {
     PC_CONSTRUCTED => 1<<5,

     CL_UNIVERSAL   => 0,
     CL_CONTEXT     => 1<<7,
};

sub encode_ident {
	my $class = shift;
	my $pc = shift;
	my $tag = shift;

	my $id=0;
	$id |= CL_UNIVERSAL if ($class eq "universal");
	$id |= CL_CONTEXT if ($class eq "context");
	$id |= PC_CONSTRUCTED if ($pc eq "constructed");

	if( $tag < 31 ){
		return pack('C', $id|$tag);
	}
	$id |= 0x1f;
	return pack('Cw', $id, $tag);
}

sub encode_length {
	my $len = shift;

	return pack('C', $len)        if $len < 1<<7;
	return pack('CC', 0x81, $len) if $len < 1<<8;
	return pack('Cn', 0x82, $len) if $len < 1<<16;
	return pack('CCn',0x83, ($len>>16), ($len&0xFFFF)) if $len < 1<<24;
	return pack('CN', 0x84, $len) if $len < 1<<32;
	die "encode_length is not prepared for such a length";
}
sub encode_value_integer {
	my $val = shift;

	return pack('C', $val) if $val < 1<<8;
	return pack('n', $val) if $val < 1<<16;
	return pack('Cn',($val>>16), ($val&0xFFFF)) if $val < 1<<24;
	return pack('N', $val) if $val < 1<<32;
	die "encode_value_integer is not prepared for such a length";
}

sub encode_value_timestamp {
	my $val = shift;

	$val =~ /^([0-9]{12})([+-])([0-9]{4})$/;

	return pack 'H12AH4', $1, $2, $3;
}

sub encode_value_hexstring {
	my $val = shift;

	$val =~ /^0x([0-9A-F]*)$/;

	return pack 'H', $1;
}

return 1;
