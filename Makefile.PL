use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'XSamples',
	VERSION_FROM => 'lib/XSamples.pm',

	DEFINE         => '',
	INC            => '-I.',
	OBJECT         => '$(O_FILES)',
);
