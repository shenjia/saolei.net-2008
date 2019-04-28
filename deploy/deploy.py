#!/usr/bin/env python
# -*- coding: UTF-8 -*-

import os
import time

# 线上环境
if os.path.isdir('/cygdrive'):
    WWW_PATH = '/cygdrive/c/saolei.net/root'
    DEPLOY_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008/asp'
    GIT_REPO_PATH = '/cygdrive/c/saolei.net/deploy/saolei.net-2008/'
# 开发环境
else:
    WWW_PATH = '/www/saolei.net/root'
    DEPLOY_PATH = '/www/saolei.net/deploy'
    GIT_REPO_PATH = '/Users/zhangshenjia/Cloud/works/github/saolei.net-2008'

DEPLOY_LOG = DEPLOY_PATH + '/deploy.log'
GIT_LOG = DEPLOY_PATH + '/git.log'

def log(string):
    now = time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))
    os.system('echo "[' + now + '] ' + string + '" >> ' + DEPLOY_LOG)

def git_pull():
    log('git pull origin master')
    os.chdir(GIT_REPO_PATH)
    os.system('date >> ' + GIT_LOG)
    os.system('git pull origin master >> ' + GIT_LOG + ' 2>&1')

def get_new_files():
    
    pass

def backup(files):
    pass

def deploy(files):
    pass

# 1. 拉取最新代码
git_pull()

# 2. 分析文件变化情况
files = get_new_files()

# 3. 备份本次更新，准备回滚
backup(files)

# 4. 部署文件更新
deploy(files)