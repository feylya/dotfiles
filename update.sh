#!/bin/bash

git checkout upstream
git pull
git checkout master
git rebase upstream
