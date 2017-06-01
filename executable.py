import argparse
import os
import platform
import sys


def print_error():
    print('Your OS is not currently supported!')
    sys.exit(1)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Executes PDDL RicoRico versions')
    parser.add_argument('version', metavar='version', type=int, help='Version number')
    parser.add_argument('--test', dest='test', action='store_const', const=True, default=False,
                        help='Execute test suites')

    args = parser.parse_args()
    version = str(args.version)
    executeTests = args.test

    available_executables = {
        'Windows': os.path.join('windows', 'ff.exe'),
        'Linux': os.path.join('linux', 'ff')
    }
    current_os = platform.system()

    file_domain = os.path.join('versions', 'v' + version, 'rico_rico_domain.pddl')
    executable = available_executables.get(current_os, None)
    if executable is None:
        print_error()

    if not executeTests:
        file_problem = os.path.join('versions', 'v' + version, 'rico_rico.pddl')
        ff_args = ' -o ' + file_domain + ' -f ' + file_problem
        os.system(executable + ff_args)
    else:
        tests = instance_files = [f for f in os.listdir(os.path.join('versions', 'v' + version)) if '_ts_' in f]
        for test in tests:
            ff_args = ' -o ' + file_domain + ' -f ' + os.path.join('versions', 'v' + version, test)
            print('//// EXECUTING TEST -> ' + test + ' ////')
            os.system(executable + ff_args)
