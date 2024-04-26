#deprecated
#!/bin/bash
read -p "Enter the name of the file to write to: "  fname
touch $fname

anscmnd="yes"   #command answer (if you want to record more than 1 command in file)

while [ $anscmnd == "yes" ]
do
        ansconf="yes"   #config answer (if you want to record more info about 1 command)

	read -p "What command are you interested in? " command

        cmndpath="which"
        cmndmanual="man"
        cmndhelp="help"

        echo "-------------------------------------------------------------------------------" >> $fname
        echo " $command" >> $fname
        echo "-------------------------------------------------------------------------------" >> $fname

        while [ $ansconf == "yes" ]
        do
                read -p "What are you searching for?(сmndpath/cmndmanual/cmndhelp): " request
                for i in "cmndpath" "cmndmanual" "cmndhelp"
                do
			if [ $i == $request ]
                        then
                                echo "          $request" >> $fname
                                echo "-------------------------" >> $fname
				${!request} ${command} >> $fname 2> /dev/null
                                echo "-------------------------" >> $fname
                        fi
                done
                read -p "Do you want to record more information about this command?(yes/no): " ansconf
        done
        read -p "Do you want to consider other commands?(yes/no): " anscmnd
done
       
