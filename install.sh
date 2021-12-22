echo "Hi."
sleep 1
clear
echo "Thankyou for using my script"
sleep 2
clear
echo "Your mom's hot"
sleep 0.5
clear

#Start

#making necessary folders
mkdir -p ~/.local/share/fonts
mkdir -p ~/.anshie-misc
mkdir -p ~/bin

#updating the system
echo "Updating your stuff"
sudo pacman --noconfirm -Syu
sudo pacman --noconfirm -S base-devel

#installing fonts
cp -r fonts/* ~/.local/share/fonts/
fc-cache -f
clear


#aur
if ! command -v yay &> /dev/null
then
    echo "Installing yay"
        git clone https://aur.archlinux.org/yay.git ~/.anshie-misc/yay
        (cd ~/.anshie-misc/yay/ && makepkg -si )
fi


#important packages
echo "Installing necessary packages"
sudo pacman --noconfirm -S rustup cargo alacritty picom rofi flameshot feh pango gdk-pixbuf2 cairo glib2 gcc-libs glibc gtk3

# eww
# echo "Installing eww"
# git clone https://github.com/elkowar/eww ~/.anshie-misc/
# cd ~/.anshie-misc/eww
# cargo build --release
# cd target/release
# chmod +x ./eww
# cp eww ~/bin/
# cd

#Installing picom config
if [ -f ~/.config/picom.conf ]; then
    echo "picom conf backed up and new config installed"
    cp ~/.config/picom.conf ~/.config/picom.conf.bak
    cp config/picom.conf ~/.config/picom.conf
else
    echo "picom conf installed"
    mkdir -p ~/.config/picom
    cp config/picom.conf ~/.config/picom.conf
fi

#Installing alacritty config
if [ -f ~/.config/alacritty/alacritty.yml ]; then
    echo "alacritty config backed up and new config installed"
    cp ~/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml.bak
    cp config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
else
    echo "alacritty config installed"
    mkdir -p ~/.config/alacritty
    cp config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
fi

#Installing dunst config
if [ -d ~/.config/dunst ]; then
    echo "dunst config backed up and new config installed"
    mkdir ~/.config/dunst.bak && mv ~/.config/dunst/* ~/.config/dunst.bak/
    cp -r config/dunst/* ~/.config/dunst
else
    echo "dunst config installed"
    mkdir ~/.config/dunst
    cp -r config/dunst/* ~/.config/dunst
fi

#Adding wallpapers
if [ -d ~/Pictures/wallpapers ]; then
    echo "adding wallpapers"
    cp wallpapers/momo.jpg ~/Pictures/wallpapers/
else
    echo "adding wallpapers"
    mkdir ~/Pictures/wallpapers && cp -r wallpapers/momo.jpg ~/Pictures/wallpapers/;
fi

#Installing i3 config
if [ -f ~/.config/i3/config ]; then
    echo "i3 config backed up and new config installed"
    cp ~/.config/i3/config ~/.config/i3/config.bak
    cp config/i3/config ~/.config/i3/config
else
    echo "i3 config installed"
    cp config/i3/config ~/.config/i3/config
fi

#Installing rofi config
if [ -d ~/.config/rofi ]; then
    echo "rofi config backed up and new config installed"
    mkdir ~/.config/rofi.bak && mv ~/.config/rofi/* ~/.config/rofi.bak/
    cp -r config/rofi/* ~/.config/rofi
else
    echo "rofi config installed"
    mkdir ~/.config/rofi
    cp -r config/rofi/* ~/.config/rofi
fi

#Installing polybar config
clear
echo "LAST STEP!!!"
echo "What's your resolution"
echo "[1] 1366x768"
echo "[2] 1920x1080"
read res
if [[ "$res" == "1" ]]; then
    if [ -d ~/.config/polybar ]; then
        echo "polybar config backed up and new config installed"
        mkdir ~/.config/polybar.bak && mv ~/.config/polybar/* ~/.config/polybar.bak/
        cp -r config/polybar/forest ~/.config/polybar
    else
        echo "polybar config installed"
        mkdir ~/.config/polybar
        cp -r config/polybar/forest ~/.config/polybar
    fi
elif [[ $REPLY == "2" ]]; then
        if [ -d ~/.config/polybar ]; then
        echo "polybar config backed up and new config installed"
        mkdir ~/.config/polybar.bak && mv ~/.config/polybar/* ~/.config/polybar.bak/
        cp -r config/polybar/forest-1080p ~/.config/polybar/forest
    else
        echo "polybar config installed"
        mkdir ~/.config/polybar
        cp -r config/polybar/forest-1080p ~/.config/polybar/forest
    fi
else
    echo -e "\n:/ bro enter a correct option, run the script again, thats your punishment\n"
    exit 1
fi