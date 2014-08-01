use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Module1',
	VERSION => '0.1',
	XSPROTOARG => '-noprototypes',
	OBJECT => '$(O_FILES)',
);
