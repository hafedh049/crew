from subprocess import run
from os import getcwd
from time import sleep

repo_path = getcwd()
run(['cd', repo_path], shell=True)

while True:
    
    result = run(['git', 'status', '--porcelain'], capture_output=True, text=True)

    status_output = result.stdout

    if status_output:
        run(['git', 'add', '.'])
        if status_output.startswith('M'):
            print(status_output.replace('M','Modified',1))
            run(['git', 'commit', '-m', status_output.replace('M','Modified',1)]) 
        elif status_output.startswith('A'):
            print(status_output.replace('A','Added',1))
            run(['git', 'commit', '-m', status_output.replace('A','Added',1)]) 
        elif status_output.startswith('D'):
            print(status_output.replace('D','Deleted',1))
            run(['git', 'commit', '-m', status_output.replace('D','Deleted',1)]) 