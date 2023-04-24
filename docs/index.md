<div style="text-align: center">
<iframe width="560" height="315" src="https://www.youtube.com/embed/X7CdZzqYkFY" title="Pinch promo video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>

Pinch is an open-source, personal and portable device capable of storing, retrieving and entering your passwords on demand. It is a physical device with no internet access and only works through manual activation.
Pinch is the size of a USB flash drive. It has a USB interface, two buttons and a three digit display which are used to select and confirm the desired password. When confirming, simply put the focus on the password field and the Pinch will enter it for you.


<img class="center" alt="Pinch Animation" src="https://raw.githubusercontent.com/jnthas/pinch/main/resources/pinch.gif" />


## How does Pinch work?
Pinch has three modes of operation
- The first is when your device is locked. To start using it, you need to enter a three-digit PIN, this will prevent others who have access to your device from easily retrieving your passwords.
- The second is the default one, the keyboard mode. When you plug it into the computer, it is able to enter passwords as if it were you without anyone seeing.
- The third, is the CDC. In this mode you can register new passwords and list existing labels via serial communication using a CLI. For security reasons, you cannot retrieve passwords in this mode, only register them. Select the desired slot on the device and enter the label and password on the command line. Disconnect and connect again and the password is now available.
