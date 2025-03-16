FROM archlinux:latest

# Update and install required packages
RUN pacman -Sy --noconfirm go wget curl git sudo nmap 


#create a user named awcator with password awcator and add it to the wheel group, with sudo access
RUN useradd -m -g users -G wheel -s /bin/bash awcator
RUN echo 'awcator:awcator' | chpasswd
RUN echo 'awcator ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN wget https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && tar -xvf gotty_linux_amd64.tar.gz && sudo mv gotty /usr/bin/gotty && chmod +x /usr/bin/gotty
USER awcator
EXPOSE 3000
CMD ["/usr/bin/gotty", "-w", "--max-connection", "100", "--permit-arguments", "bash"]
