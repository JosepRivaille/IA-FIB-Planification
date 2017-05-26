import platform
from sys import stdin, argv
import os


if __name__ == '__main__':
	version = argv[1]

	file_domain = os.path.join('versions', 'v' + version, 'rico_rico_domain.pddl')
	file_problem = os.path.join('versions', 'v' + version, 'rico_rico.pddl')
	ff_args = ' -o ' + file_domain + ' -f ' + file_problem
	
	available_executables = {
		'Windows': os.path.join('windows', 'ff.exe') + ff_args,
		'Linux': os.path.join('linux', 'ff') + ff_args
	}
	current_os = platform.system()

	os.system(available_executables.get(current_os, "echo 'Error!'"))