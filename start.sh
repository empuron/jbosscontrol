#!/bin/bash

# Macht einen Test, ob bestimmte Module vorinstalliert sind
# Diese notwendig, um den Anwendungsserver zu starten (Substanced) 

gruen="$(tput setaf 2)"
red="$(tput setaf 1)"
normal="$(tput setaf 7)"

# Abhängigkeiten
end=0
ist_python3_installiert=$(python3 --version)
if [ $? -eq 0 ]
then echo -n $ist_python3_installiert; echo -e " ist$gruen installiert$normal"; ((end++))
else echo "Python3 ist$red nicht installiert$normal"
fi

ist_pip3_installiert=$(pip3 --version)
if [ $? -eq 0 ]
then echo -n $ist_pip3_installiert; echo -e " ist$gruen installiert$normal"; ((end++))
else echo "pip3 ist$red nicht installiert$normal"
fi

#ist_pyramid_installiert
pip3 show pyramid >/dev/null && echo -e "Pyramid Module ist$gruen vorhanden$normal"; ((end++)) || echo "Pyramid Module ist$red nicht vorhanden$normal"

#ist_substanced_installiert
pip3 show substanced >/dev/null && echo -e "Substanced Module ist$gruen vorhanden$normal"; ((end++)) || echo "Substanced Module ist$red nicht vorhanden$normal"

if [ $end -eq 4 ]; then pserve ./development.ini; else echo -e "\033[1;31mNicht alle Voraussetzung erfüllt\033[0m"; fi
