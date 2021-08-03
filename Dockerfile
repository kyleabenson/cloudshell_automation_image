FROM gcr.io/cloudshell-images/cloudshell:latest

# Add your content here
RUN /usr/bin/python3 -m pip install --upgrade pip
RUN /usr/bin/python3 -m pip install ansible
RUN PATH=$PATH:$HOME/.local/bin/
RUN ansible-galaxy collection install google.cloud
COPY ansible.cfg /ansible/ansible.cfg
COPY inventory.gcp.yaml /ansible/inventory.gcp.yaml
COPY example_playbook.yaml /ansible/example_playbook.yaml
RUN chmod -R 666 /ansible/*

# To trigger a rebuild of your Cloud Shell image:
# 1. Commit your changes locally: git commit -a
# 2. Push your changes upstream: git push origin master

# This triggers a rebuild of your image hosted at gcr.io/cloud-ops-tutorials/cloud-ops-agent-ansible.
# You can find the Cloud Source Repository hosting this file at https://source.developers.google.com/p/cloud-ops-tutorials/r/cloud-ops-agent-ansible
