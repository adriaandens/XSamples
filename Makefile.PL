use ExtUtils::MakeMaker;
use Cwd;
use File::Copy;

# Compile all XS files into one
# and rename the orginal ones
opendir(DH, getcwd());
my @xs_files = grep { /\.xs$/ } readdir(DH);
closedir(DH);

open(XS_ALL, '> XS_All.xs');

	my $c_stuff, $xs_stuff;
	foreach my $xs_file (@xs_files) {
		my $write_to_xs_stuff;
		open(XS, '<', $xs_file);
		while(<XS>) {
			$write_to_xs_stuff = 1 if(/MODULE\s*=/);
			if($write_to_xs_stuff) {
				$xs_stuff .= $_;
			} else {
				$c_stuff .= $_;
			}
		}	
		close(XS);
	}

	print XS_ALL $c_stuff;
	print XS_ALL $xs_stuff;

	# Move them files
	move($_, $_ . '_old') foreach(@xs_files);

close(XS_ALL);

WriteMakefile(
	NAME => 'XSamples',
	VERSION_FROM => 'lib/XSamples.pm',

	DEFINE         => '',
	INC            => '-I.',
	XSPROTOARG     => '-noprototypes',
	OBJECT         => '$(O_FILES)',
	#XS             => {
		#'XSamples.xs' => 'XSamples.c',
		#'Hashes.xs' => 'Hashes.c'
	#},
);
