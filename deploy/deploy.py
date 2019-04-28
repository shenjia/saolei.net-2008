#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
import time

# 线上环境
if os.path.isdir('/cygdrive'):
    WWW_PATH = '/cygdrive/c/saolei.net/root'
    DEPLOY_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008/asp'
    GIT_REPO_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008'
    GIT_BRANCH = 'master'
# 开发环境
else:
    WWW_PATH = '/www/saolei.net/root'
    DEPLOY_PATH = '/www/saolei.net/deploy'
    GIT_REPO_PATH = '/www/saolei.net/deploy/saolei.net-2008'
    GIT_BRANCH = 'test'

DEPLOY_LOG = DEPLOY_PATH + '/deploy.log'
GIT_LOG = DEPLOY_PATH + '/git.log'


def log(string, file=DEPLOY_LOG):
    now = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
    os.system('echo "[' + now + '] ' + string + '" >> ' + file)

def shell(command):
    return os.popen('git log|head -n 1|sed \'s/commit //\'').read()

def shell_with_log(command):
    log(command)
    return shell(command)


def git_pull():
    os.chdir(GIT_REPO_PATH)
    old_commit = shell('git log|head -n 1|sed \'s/commit //\'')
    shell('date >> ' + GIT_LOG)
    shell_with_log('git fetch')
    shell_with_log('git branch ' + GIT_BRANCH)
    shell_with_log('git pull origin ' + GIT_BRANCH + ' >> ' + GIT_LOG + ' 2>&1')
    new_commit = shell('git log|head -n 1|sed \'s/commit //\'')
    return old_commit, new_commit
    

def get_new_files(old_commit, new_commit):
    if old_commit == new_commit:
        log('no new commit!')
        exit()
    log(old_commit + ' -> ' + new_commit)


def backup(files):
    pass

def deploy(files):
    pass

# 1. 拉取最新代码
old_commit, new_commit = git_pull()

# 2. 分析文件变化情况
files = get_new_files(old_commit, new_commit)

# 3. 备份本次更新，准备回滚
backup(files)

# 4. 部署文件更新
deploy(files)