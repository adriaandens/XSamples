use ExtUtils::MakeMaker;

WriteMakefile(
	NAME => 'Module',
	VERSION => '0.1',
	XSPROTOARG => '-noprototypes',
	OBJECT => '$(O_FILES)',
);
