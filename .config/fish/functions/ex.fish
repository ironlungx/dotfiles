function ex
    if test -z "$argv[1]"
        # display usage if no parameters given
        echo "Usage: ex <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    else
        for n in $argv
            if test -f "$n"
                switch "$n" 
                    case *.cbt *.tar.bz2 *.tar.gz *.tar.xz *.tbz2 *.tgz *.txz *.tar
                        tar xvf "$n"
                    case *.lzma
                        unlzma ./"$n"
                    case *.bz2
                        bunzip2 ./"$n"
                    case *.cbr *.rar
                        unrar x -ad ./"$n"
                    case *.gz
                        gunzip ./"$n"
                    case *.cbz *.epub *.zip
                        unzip ./"$n"
                    case *.z
                        uncompress ./"$n"
                    case *.7z *.arj *.cab *.cb7 *.chm *.deb *.dmg *.iso *.lzh *.msi *.pkg *.rpm *.udf *.wim *.xar
                        7z x ./"$n"
                    case *.xz
                        unxz ./"$n"
                    case *.exe
                        cabextract ./"$n"
                    case *.cpio
                        cpio -id < ./"$n"
                    case *.cba *.ace
                        unace x ./"$n"
                    case '*'
                        echo "ex: '$n' - unknown archive method"
                        return 1
                end
            else
                echo "'$n' - file does not exist"
                return 1
            end
        end
    end
end

