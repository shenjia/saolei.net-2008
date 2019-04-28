#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os, shutil
import time

# 线上环境
if os.path.isdir('/cygdrive'):
    WWW_PATH = '/cygdrive/c/saolei.net/root'
    DEPLOY_PATH = '/cygdrive/c/saolei.net/deploy/'
    BACKUP_PATH = '/cygdrive/c/saolei.net/deploy/backup'
    GIT_REPO_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008/asp'
    
# 开发环境
else:
    WWW_PATH = '/www/saolei.net/root'
    DEPLOY_PATH = '/www/saolei.net/deploy'
    BACKUP_PATH = '/www/saolei.net/deploy/backup'
    GIT_REPO_PATH = '/www/saolei.net/deploy/saolei.net-2008/asp'
    
SYNC_PATH = 'asp/'
LOG_FILE = DEPLOY_PATH + '/deploy.log'

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

def check_updated_files():
    files = shell(DEPLOY_PATH + '/git_pull_diff.sh').strip().split('\n')
    commit = files.pop(0) if files else 'none'
    return commit, files


def backup(commit, files):
    BACKUP_DIR = BACKUP_PATH + '/' + now() + ' ' + commit
    os.mkdir(BACKUP_DIR)
    
    for file in files:
        #from_path = 
        #if not os.path.isfile()
        #shell_with_log('cp -F ')
        pass
    pass

def deploy(files):
    pass

# 拉取最新代码，分析文件变化情况
commit, files = check_updated_files()

if files:

    # 备份本次更新，准备回滚
    backup(commit, files)

    # 部署文件更新
    deploy(files)