
# Get script's dir
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CHOICES=$(dialog --stdout --checklist 'Select what you want to setup' \
       0 0 4 linux 'Prepares the machine to export 32 and 64 bits linux templates' on \
             android 'Prepares the machine to export android templates' on \
             windows 'Prepares the machine to export 32 and 64 bits windows templates' on \
             html5 'Prepares the machine to export HTML5 templates' on )

echo $CHOICES
echo $PWD
if [[ "$CHOICES" =~ linux ]];
then
  source $DIR/linux-setup.sh
fi

if [[ "$CHOICES" =~ android ]];
then
  source $DIR/android-setup.sh
fi

if [[ "$CHOICES" =~ windows ]];
then
  source $DIR/windows-setup.sh
fi

if [[ "$CHOICES" =~ html5 ]];
then
  source $DIR/html5-setup.sh
fi

exit 0
