use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'XSamples',
	VERSION_FROM => 'lib/XSamples.pm',

	DEFINE         => '',
	INC            => '-I.',
	XSPROTOARG     => '-noprototypes',
	OBJECT         => '$(O_FILES)',
	XS             => {'XSamples.xs' => 'XSamples.c'},
);
