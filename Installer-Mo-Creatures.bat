@echo off
title Installation Mo' Creatures Adventure
echo Telechargement des mods en cours (environ 190 fichiers), ne ferme pas cette fenetre...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$p = Join-Path $env:TEMP mca_install.ps1; Invoke-WebRequest https://github.com/nini17800/mo-creatures-adventure-modpack/raw/main/install.ps1 -OutFile $p -UseBasicParsing; & $p"
pause
