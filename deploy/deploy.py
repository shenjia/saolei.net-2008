#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
import time
import re

# 线上环境
if os.path.isdir('/cygdrive'):
    WWW_PATH = '/cygdrive/c/saolei.net/root'
    DEPLOY_PATH = '/cygdrive/c/saolei.net/deploy'
    BACKUP_PATH = '/cygdrive/c/saolei.net/deploy/backup'
    GIT_REPO_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008'
    
# 开发环境
else:
    WWW_PATH = '/www/saolei.net/root'
    DEPLOY_PATH = '/www/saolei.net/deploy'
    BACKUP_PATH = '/www/saolei.net/deploy/backup'
    GIT_REPO_PATH = '/www/saolei.net/deploy/saolei.net-2008'
    
SYNC_PATH = 'asp/'
LOG_FILE = DEPLOY_PATH + '/deploy.log'
DEL_LIST = DEPLOY_PATH + '/del_files.sh'

def encode_path(path):
    for str in ['*', ' ', '>', '(', ')']:
        path = path.replace(str, '\\' + str)
    return path

def now():
    return time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))

def log(string):
    os.system('echo "' + string + '" >> ' + LOG_FILE)

def log_with_time(string):
    os.system('echo "[' + now() + '] ' + string + '" >> ' + LOG_FILE)

def shell(command):
    return os.popen(command).read()

def shell_with_log(command):
    log_with_time(command)
    return shell(command)

def check_sync_files():
    files = shell(DEPLOY_PATH + '/git_pull_diff.sh').strip().split('\n')
    commit = files.pop(0) if files else 'none'
    sync_files = []
    for file in files:
        if file.startswith(SYNC_PATH):
            sync_files.append(file.lstrip(SYNC_PATH))
    return commit, sync_files

def copy_file(file, copy_file):
    shell_with_log('cp -f ' + encode_path(file) + ' ' + encode_path(copy_file) + ' > /dev/null')

def del_file(file):
    # 为安全起见，只记录要删除的文件，定期手动删除
    log('add [ ' + file + ' ] to del file list')
    with open(DEL_LIST, 'w+') as f:
        f.write('rm -rf ' + encode_path(file))

def backup(commit, files):

    log('start backuping...')

    BACKUP_DIR = BACKUP_PATH + '/' + now() + ' ' + commit
    if not os.path.exists(BACKUP_DIR):
        os.makedirs(BACKUP_DIR)

    for filepath in files:
        
        path, file = os.path.split(filepath)
        source_file = WWW_PATH + '/' + filepath

        if not os.path.isfile(source_file):
            log('source file [ ' + source_file + ' ] not exists, skip backup!')
            continue
        
        backup_file = BACKUP_DIR + '/' + filepath 
        backup_path = BACKUP_DIR + '/' + path

        if not os.path.exists(backup_path):
            os.makedirs(backup_path)
        
        copy_file(source_file, backup_file)

def deploy(files):

    log('start deploying...')

    for filepath in files:
        path, file = os.path.split(filepath)
        source_file = GIT_REPO_PATH + '/' + SYNC_PATH + filepath
        deploy_file = WWW_PATH + '/' + filepath
        deploy_path = WWW_PATH + '/' + path

        if not os.path.exists(deploy_path):
            os.makedirs(deploy_path)

        if os.path.exists(source_file):
            copy_file(source_file, deploy_file)

        else:
            del_file(deploy_file)

# 拉取最新代码，分析文件变化情况
commit, files = check_sync_files()

if files:

    # 备份本次更新，准备回滚
    backup(commit, files)

    # 部署文件更新
    deploy(files)

else:
    print('no new commit!')