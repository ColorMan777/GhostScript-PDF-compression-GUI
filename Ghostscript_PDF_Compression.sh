#!/bin/bash

if chemin=$(zenity --file-selection --file-filter="*.pdf" --title="PDF à compresser")

    then 
        if mode=$(zenity --entry --title="Mode de compression" --text="Veuillez choisir un mode de compression" --entry-text="Default" "Screen (72dpi)" "Ebook (150dpi)" "Prepress (300dpi)" "Printer (300dpi)" )
        then
            
        
        filename_base=$(basename -- "$chemin") #new file name creation
        filename="${filename_base%.*}"
        path=$(dirname -- "$chemin")
        slash="/"
        suffix="_compressed.pdf"
        new_path=$path$slash$filename$suffix
        
        
        if [ "$mode" = "Default" ] #condiion to set the compression mode
        then
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$new_path $chemin | zenity --progress --pulsate --auto-close

        fi
        
        if [ "$mode" = "Screen (72dpi)" ]
        then
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$new_path $chemin | zenity --progress --pulsate --auto-close
        fi
        
        if [ "$mode" = "Ebook (150dpi)" ]
        then
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$new_path $chemin | zenity --progress --pulsate --auto-close
        fi
        
        if [ "$mode" = "Prepress (300dpi)" ]
        then
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$new_path $chemin | zenity --progress --pulsate --auto-close
        fi
        
        if [ "$mode" = "Printer (300dpi)" ]
        then
            gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$new_path $chemin | zenity --progress --pulsate --auto-close
        fi
        

        fi
        
fi
