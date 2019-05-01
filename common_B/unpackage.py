#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os

base_path = os.getenv('_base_path_')
project = os.getenv('_project_')
WORK_DIR = base_path + '/apps/' + project + '/'
JAR_REPO_DIR = base_path + '/apps/jar_repo/'
ORIG_DIR = WORK_DIR + 'packages/'
TEMP_DIR = WORK_DIR + 'pkgs/'
TEMP_WARS_DIR = TEMP_DIR + 'wars/'
TEMP_UNZIP_WAR_DIR =  WORK_DIR + 'work/'
TEMP_ADD_JARS_DIR = TEMP_DIR + 'add_jars/'
TEMP_JAR_LIST = TEMP_DIR + 'jar_list.txt'
ZIP_FILE = ORIG_DIR + 'pkgs.zip'

os.system('mkdir -p ' + JAR_REPO_DIR)
os.system('mkdir -p ' + ORIG_DIR)
os.system('mkdir -p ' + TEMP_DIR)
os.system('mkdir -p ' + TEMP_WARS_DIR)
os.system('mkdir -p ' + TEMP_ADD_JARS_DIR)

# unzip pkgs.zip
os.system('rm -rf ' + TEMP_DIR + "*")
print('unzip ' + ZIP_FILE + ' ...')
os.system('unzip -q %s -d %s' % (ZIP_FILE, TEMP_DIR))
print('unzip ' + ZIP_FILE + ' successfully!')

# put new jars to jar_repo
os.system('\cp -f %s %s' % (TEMP_ADD_JARS_DIR + '*', JAR_REPO_DIR))

# restore wars
file = open(TEMP_JAR_LIST, 'r')
aLine = file.readline()
preWarName = ''
while aLine !='':
    curWarName = aLine.split('=')[0]

    # unzip war
    fullWarName = curWarName + '.war'
    if preWarName != curWarName and curWarName != '':
        print('unzip ' + fullWarName + ' \t...')
        os.system('unzip -q %s -d %s' % (TEMP_WARS_DIR + fullWarName, TEMP_UNZIP_WAR_DIR + curWarName +"/"))
        print('unzip ' + fullWarName + ' \tsuccessfully!')

    # copy jar
    if curWarName != '':
        jarName = aLine.split('=')[1].strip('\n')
        if (jarName.find('SNAPSHOT') == -1):
            os.system('\cp -f %s %s' % (JAR_REPO_DIR + jarName, TEMP_UNZIP_WAR_DIR + curWarName + '/WEB-INF/lib'))
        if (jarName.find('SNAPSHOT') != -1):
            os.system('\cp -f %s %s' % (JAR_REPO_DIR + jarName, TEMP_UNZIP_WAR_DIR + curWarName + '/WEB-INF/lib'))
    preWarName = curWarName
    aLine = file.readline()
file.close()

print('package finished!')
