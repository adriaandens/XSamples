use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'XSamples',
	VERSION_FROM => 'lib/XSamples.pm',

	DEFINE         => '',
	INC            => '-I.',
	XSPROTOARG     => '-noprototypes',
	OBJECT         => 'XSamples.o Hashes.o',
	XS             => {
		'XSamples.xs' => 'XSamples.c',
		'Hashes.xs' => 'Hashes.c'
	},
);
