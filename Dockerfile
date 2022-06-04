FROM python:3.9

# set working directory
WORKDIR /app

# copy requirements file
COPY ./requirements.txt .

# run upgrades and install crom and vim
RUN apt update && apt upgrade -y && apt install cron vim -y

# run pip upgrade
RUN python -m pip install --upgrade pip

# install pip requirements
RUN pip install -r requirements.txt

# copy files from app folder
COPY ./app .

# set rights to script
RUN chmod +x /app/script.sh

# copy cron job
COPY cronjob /etc/cron.d/container_cronjob

# set correct rights for cronjob
RUN chmod 644 /etc/cron.d/container_cronjob

# create logfile
RUN touch /var/log/cron.log

# update crontab
RUN /usr/bin/crontab /etc/cron.d/container_cronjob

# run cron and tail
CMD ["/bin/bash", "-c", "/app/script.sh && cron && tail -f /var/log/cron.log"]